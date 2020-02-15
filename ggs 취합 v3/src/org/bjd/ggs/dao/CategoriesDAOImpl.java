package org.bjd.ggs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Category;

public class CategoriesDAOImpl implements CategoriesDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Category> selectAll() {
		// TODO Auto-generated method stub
		return session.selectList("categories.selectAll");
	}

	@Override
	public String selectImg(String name) {
		// TODO Auto-generated method stub
		return session.selectOne("categories.selectImg", name);
	}
}
