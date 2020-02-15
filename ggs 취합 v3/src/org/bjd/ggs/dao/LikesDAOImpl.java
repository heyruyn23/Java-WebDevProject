package org.bjd.ggs.dao;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Like;

public class LikesDAOImpl implements LikesDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	public int delete(Like like) {
		return session.delete("likes.delete", like.getNo());
	}// delete() end

	public int insert(Like like) {
		return session.insert("likes.insert", like);
	}// insert() end

	public Like selectOne(Like like) {
		return session.selectOne("likes.selectOne", like);
	}// selectOne() end

	public int selectTotal(Like like) {
		return session.selectOne("likes.selectTotal", like);
	}// selectTotal() end
}
