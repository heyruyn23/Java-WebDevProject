package org.bjd.ggs.service;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.dao.RespondentsDAO;
import org.bjd.ggs.vo.Respondent;

public class RespondentsServiceImpl implements RespondentsService {

	private RespondentsDAO respondentsDAO;
	public void setRespondentsDAO(RespondentsDAO respondentsDAO) {
		this.respondentsDAO = respondentsDAO;
	}
	
	@Override
	public int insertE(Respondent respondent) {
		// TODO Auto-generated method stub
		int no = respondentsDAO.insertE(respondent);
		System.out.println("respondentsDAO.insertE(respondent): "+no);
		return no;
	}
}
