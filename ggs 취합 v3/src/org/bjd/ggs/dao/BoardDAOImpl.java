package org.bjd.ggs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Article;
import org.bjd.ggs.vo.PageVO;
import org.bjd.ggs.vo.PageVOS;


public class BoardDAOImpl implements BoardDAO{
	private SqlSession session;

	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	
	public List<Article> selectList(PageVO pageVO) {
		return session.selectList("board.selectList",pageVO);
	}//selectList() end
	
	public List<Article> selectListSanta(PageVOS pageVOS) {
		return session.selectList("board.selectListSanta",pageVOS);
	}//selectList() end
	
	public Article selectOne(int no) {
		return session.selectOne("board.selectOne",no);
	}//selectList() end
	public Article selectOneSanta(int no) {
		return session.selectOne("board.selectOneSanta",no);
	}//selectList() end
	
	public int selectTotal() {
		return session.selectOne("board.selectTotal");
	}//selectList() end
	public int selectTotals() {
		return session.selectOne("board.selectTotalS");
	}//selectList() end
	@Override
	public List<Article> selectList() {
		// TODO Auto-generated method stub
		return session.selectList("board.selectFree");
	}
	public List<Article> selectListSanta() {
		// TODO Auto-generated method stub
		return session.selectList("board.selectGive");
	}
	public int updateHit(int no) {
		return session.update("board.updateHit",no);
	}//selectList() end
	public int insert(Article article) {
		return session.insert("board.insert",article);
	}//selectList() end
	public int insertSanta(Article article) {
		return session.insert("board.insertSanta",article);
	}//selectList() end

}
