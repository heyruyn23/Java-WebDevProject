package org.bjd.ggs.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.bjd.ggs.dao.EventsDAO;
import org.bjd.ggs.util.PaginateUtil;
import org.bjd.ggs.vo.Event;
import org.bjd.ggs.vo.PageVO;

public class EventsServiceImpl implements EventsService{
	private EventsDAO eventsDAO;
	public void setEventsDAO(EventsDAO eventsDAO) {
		this.eventsDAO = eventsDAO;
	}
	private PaginateUtil paginateUtil;
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	@Override
	public List<Event> selectList() {
		// TODO Auto-generated method stub
		return eventsDAO.selectList();
	}

	@Override
	public int selectEndedTotal() {
		// TODO Auto-generated method stub
		return eventsDAO.selectEndedTotal();
	}
	@Override
	public Event selectOne(int no) {
		// TODO Auto-generated method stub
		return eventsDAO.selectOne(no);
	}
	@Override
	public Map<String, Object> selectEndedEvent(int pageNo) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new ConcurrentHashMap<>();
		int numBlock = 5;
		int numPage = 6;
		int total = eventsDAO.selectEndedTotal();
		
		String url = "/eventEnded/page/";
		PageVO pageVO = new PageVO(pageNo,numPage);
		List<Event> list = eventsDAO.selectListEnded(pageVO);
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);				
		map.put("content", list);			
		map.put("paginate", paginate);	
		return map;
	}
}
