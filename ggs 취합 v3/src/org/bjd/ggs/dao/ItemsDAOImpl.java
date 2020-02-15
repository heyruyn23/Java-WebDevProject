package org.bjd.ggs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Item;
import org.bjd.ggs.vo.PageVO;
import org.bjd.ggs.vo.Survey;

public class ItemsDAOImpl implements ItemsDAO {
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<Item> selectCustomGift(Survey survey) {
		// TODO Auto-generated method stub
		return session.selectList("items.selectCustomGift",survey);
	}
	@Override
	public List<Item> selectList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("items.selectList",pageVO);
	}

	@Override
	public List<Item> selectItemArray() {
		// TODO Auto-generated method stub
		return session.selectList("items.selectItemArray");
	}

	@Override
	public List<Integer> selectItemNos(int memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("items.selectItemNos",memberNo);
	}

	@Override
	public int selectCount(int memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("items.selectCount",memberNo);
	}

}
