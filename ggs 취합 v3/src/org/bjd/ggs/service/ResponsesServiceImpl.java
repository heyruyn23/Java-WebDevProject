package org.bjd.ggs.service;

import org.bjd.ggs.dao.ResponsesDAO;
import org.bjd.ggs.vo.Response;

public class ResponsesServiceImpl implements ResponsesService{
	private ResponsesDAO responsesDAO;
	public void setResponsesDAO(ResponsesDAO responsesDAO) {
		this.responsesDAO = responsesDAO;
	}
	@Override
	public boolean insertEvent(Response response) {
		// TODO Auto-generated method stub
		return 1==responsesDAO.insertE(response);
	}
}
