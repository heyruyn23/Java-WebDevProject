package org.bjd.ggs.dao;

import org.apache.ibatis.session.SqlSession;

public class PurposesDAOImpl implements PurposesDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
}
