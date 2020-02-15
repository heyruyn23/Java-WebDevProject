package org.bjd.ggs.service;

import java.util.List;
import java.util.Map;

import org.bjd.ggs.vo.Event;

public interface EventsService {
	public List<Event> selectList();
	public Map<String, Object> selectEndedEvent(int pageNo);
	public int selectEndedTotal();
	public Event selectOne(int no);
}
