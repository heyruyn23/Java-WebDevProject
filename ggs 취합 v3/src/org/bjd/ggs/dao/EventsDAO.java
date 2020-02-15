package org.bjd.ggs.dao;

import java.util.List;

import org.bjd.ggs.vo.Event;
import org.bjd.ggs.vo.PageVO;

public interface EventsDAO {
	public List<Event> selectList();
	public List<Event> selectListEnded(PageVO pageVO);
	public int selectEndedTotal();
	public Event selectOne(int no);
}
