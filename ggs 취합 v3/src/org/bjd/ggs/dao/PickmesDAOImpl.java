package org.bjd.ggs.dao;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Pickme;

public class PickmesDAOImpl implements PickmesDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	public int insertItem(Pickme pickme) {
		// TODO Auto-generated method stub
		return session.insert("pickmes.insertItem",pickme);
	}

	@Override
	public int deleteItem(Pickme pickme) {
		// TODO Auto-generated method stub
		return session.insert("pickmes.deleteItem",pickme);
	}

	@Override
	public int updateItem(Pickme pickme) {
		// TODO Auto-generated method stub
		return session.insert("pickmes.updateItem",pickme);
	}
}
