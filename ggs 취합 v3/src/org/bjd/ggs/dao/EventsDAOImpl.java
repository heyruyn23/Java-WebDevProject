package org.bjd.ggs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Event;
import org.bjd.ggs.vo.PageVO;

public class EventsDAOImpl implements EventsDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Event> selectList() {
		// TODO Auto-generated method stub
		return session.selectList("events.selectList");
	}

	@Override
	public List<Event> selectListEnded(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("events.selectListEnded", pageVO);
	}

	@Override
	public int selectEndedTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("events.selectEndedTotal");
	}

	@Override
	public Event selectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("events.selectOne", no);
	}
}
