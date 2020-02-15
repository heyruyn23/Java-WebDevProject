package org.bjd.ggs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.bjd.ggs.dao.BoardDAO;
import org.bjd.ggs.dao.CommentsDAO;
import org.bjd.ggs.dao.LikesDAO;
import org.bjd.ggs.util.PaginateUtil;
import org.bjd.ggs.vo.Article;
import org.bjd.ggs.vo.Like;
import org.bjd.ggs.vo.PageVO;
import org.bjd.ggs.vo.PageVOS;

public class BoardServiceImpl implements BoardService{
	private BoardDAO boardDAO;
	private CommentsDAO commentsDAO;
	private LikesDAO likesDAO;
	private PaginateUtil paginateUtil;
	
	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	public void setCommentsDAO(CommentsDAO commentsDAO) {
		this.commentsDAO = commentsDAO;
	}
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	@Override
	public Map<String, Object> getIndexContents(int pageNo,String order,String select, String wire) {
		// TODO Auto-generated method stub
		
				Map<String,Object> map = new ConcurrentHashMap<>();
				int numBlock = 5;
				int numPage = 7;
				int total = boardDAO.selectTotal();
				System.out.println(total);
				String url = "/ajax/freeBoard/page/";
				PageVO pageVO = new PageVO(pageNo,numPage,order,select, wire);
				List<Article> list = boardDAO.selectList(pageVO);
				String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);				
				map.put("content", list);			
				map.put("paginate", paginate);	
				return map;
	}
	@Override
	public Map<String, Object> getIndexContentsSanta(int pageNo,String order,String select, String wire) {
		// TODO Auto-generated method stub
		
				Map<String,Object> map = new ConcurrentHashMap<>();
				int numBlock = 5;
				int numPage = 7;
				int total = boardDAO.selectTotals();
				System.out.println(total);
				String url = "/ajax/giveBoard/page/";
				PageVOS pageVOS = new PageVOS(pageNo,numPage,order,select, wire);
				List<Article> lists = boardDAO.selectListSanta(pageVOS);
				
				System.out.println(lists);
				
				String paginates = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);				
				map.put("contentS", lists);			
				map.put("paginateSanta", paginates);	
				return map;
	}
	@Override
	public Map<String, Object> getArticleContents(int no, int pageNo,int memberNo, boolean isHit) {
		Map<String, Object> map = new HashMap<>();
		
		if(isHit) {
			boardDAO.updateHit(no);
		}//if end
		
		map.put("article", boardDAO.selectOne(no));
		
		int numPage = 5;
		
		PageVO pageVO = new PageVO(pageNo,numPage,no);
		
		int total = commentsDAO.selectTotal(no);
		
		int numBlock = 3;
		
		String url = "/viewArticle/"+no+"/page/";
			
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		map.put("list",commentsDAO.selectList(pageVO));
		map.put("paginate", paginate);
		map.put("total", total);
		
		boolean likeFlag = false;
		
		if(memberNo>0) {
			Like like = likesDAO.selectOne(new Like(memberNo, no, Like.FREE));
			likeFlag = like!=null;
			map.put("likeFlag", likeFlag);
		}//if end
		
		
		return map;
	}
	@Override
	public Map<String, Object> getArticleContentsSanta(int no, int pageNo,int memberNo, boolean isHit) {
		Map<String, Object> map = new HashMap<>();
		
		if(isHit) {
			boardDAO.updateHit(no);
		}//if end
		
		map.put("article", boardDAO.selectOneSanta(no));
		
		int numPage = 5;
		
		PageVO pageVO = new PageVO(pageNo,numPage,no);
		
		int total = commentsDAO.selectTotalS(no);
		
		int numBlock = 3;
		
		String url = "/viewArticleS/"+no+"/page/";
			
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		
		map.put("list",commentsDAO.selectListS(pageVO));
		map.put("paginate", paginate);
		map.put("total", total);
		
		boolean likeFlag = false;
		
		if(memberNo>0) {
			Like like = likesDAO.selectOne(new Like(memberNo, no, Like.FREE));
			likeFlag = like!=null;
			map.put("likeFlag", likeFlag);
		}//if end
		
		
		return map;
	}
	@Override
	public Article getArticle(int no) {
		// TODO Auto-generated method stub
		return boardDAO.selectOne(no);
	}
	@Override
	public Article getArticleSanta(int no) {
		// TODO Auto-generated method stub
		return boardDAO.selectOne(no);
	}
	@Override
	public List<Article> freeBoardList() {
		// TODO Auto-generated method stub
		return boardDAO.selectList();
	}
	@Override
	public List<Article> giveBoardList() {
		// TODO Auto-generated method stub
		return boardDAO.selectListSanta();
	}
	@Override
	public boolean write(Article article) {
		return 1==boardDAO.insert(article);
	}
	@Override
	public boolean writeSanta(Article article) {
		return 1==boardDAO.insertSanta(article);
	}
}
