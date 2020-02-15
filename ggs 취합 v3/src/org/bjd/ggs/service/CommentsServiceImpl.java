package org.bjd.ggs.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.bjd.ggs.dao.CommentsDAO;
import org.bjd.ggs.util.PaginateUtil;
import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.PageVO;

public class CommentsServiceImpl implements CommentsService {
	
	private CommentsDAO commentsDAO;
	public void setCommentsDAO(CommentsDAO commentsDAO) {
		this.commentsDAO = commentsDAO;
	}
	private PaginateUtil paginateUtil;
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	@Override
	public boolean write(Comment comment) {
		// TODO Auto-generated method stub
		return 1==commentsDAO.insert(comment);
	}
	@Override
	public boolean writeSanta(Comment comment) {
		// TODO Auto-generated method stub
		return 1==commentsDAO.insertSanta(comment);
	}
	
	@Override
	public int selectTotalEC(int no) {
		// TODO Auto-generated method stub
		return commentsDAO.selectTotalEC(no);
	}
	@Override
	public Map<String, Object> selectListEC(int pageNo, int no) {
		// TODO Auto-generated method stub
		//System.out.println("pageNo :: "+pageNo);
		//System.out.println("no :: "+no);
		Map<String,Object> map = new ConcurrentHashMap<>();
		int numBlock = 5;
		int numPage = 3;
		int total = commentsDAO.selectTotalEC(no);
		
		String url = "/eventDetail/"+no+"/page/";
		PageVO pageVO = new PageVO(pageNo,numPage, no);
		
		List<Comment> list = commentsDAO.selectListEC(pageVO);
		//System.out.println("list test ::"+list);
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);				
		map.put("content", list);			
		map.put("paginate", paginate);	
		return map;
	}
	@Override
	public boolean insertE(Comment comment) {
		// TODO Auto-generated method stub
		return 1==commentsDAO.insertE(comment);
	}
}
