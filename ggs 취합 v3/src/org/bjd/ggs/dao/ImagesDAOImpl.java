package org.bjd.ggs.dao;

import org.apache.ibatis.session.SqlSession;

public class ImagesDAOImpl implements ImagesDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
}
