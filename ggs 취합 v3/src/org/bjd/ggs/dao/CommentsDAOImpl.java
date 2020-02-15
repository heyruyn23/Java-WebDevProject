package org.bjd.ggs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.PageVO;

public class CommentsDAOImpl implements CommentsDAO {
	
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	public List<Comment> selectList(PageVO pageVO) {
		return session.selectList("comments.selectList", pageVO);
	}// selectList() end

	public int selectTotal(int no) {
		return session.selectOne("comments.selectTotal", no);
	}// selectTotal() end
	public List<Comment> selectListS(PageVO pageVO) {
		return session.selectList("comments.selectListS", pageVO);
	}// selectList() end

	public int selectTotalS(int no) {
		return session.selectOne("comments.selectTotalS", no);
	}// selectTotal() end
	public int insert(Comment comment) {
		return session.insert("comments.insert", comment);
	}// insert() end
	public int insertSanta(Comment comment) {
		return session.insert("comments.insertSanta", comment);
	}// insert() end
	
	
	@Override
	public List<Comment> selectListEC(PageVO pageVO) {
		// TODO Auto-generated method stub
		System.out.println("pageVO.getStart()"+pageVO.getStart());
		System.out.println("pageVO.getEnd()"+pageVO.getEnd());
		return session.selectList("comments.selectListEC", pageVO);
	}
	@Override
	public int selectTotalEC(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("comments.selectTotalEC",no);
	}
	@Override
	public int insertE(Comment comment) {
		// TODO Auto-generated method stub
		return session.insert("comments.insertE", comment);
	}
}
