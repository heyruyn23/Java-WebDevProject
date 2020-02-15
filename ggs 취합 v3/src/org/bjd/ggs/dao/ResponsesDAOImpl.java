package org.bjd.ggs.dao;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Response;

public class ResponsesDAOImpl implements ResponsesDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int insertE(Response response) {
		// TODO Auto-generated method stub
		return session.insert("responses.insertE", response);
	}
}
