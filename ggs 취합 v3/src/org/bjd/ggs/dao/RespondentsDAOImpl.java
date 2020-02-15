package org.bjd.ggs.dao;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Respondent;

public class RespondentsDAOImpl implements RespondentsDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int insertE(Respondent respondent) {
		// TODO Auto-generated method stub
		return session.insert("respondents.insertE", respondent);
	}
}
