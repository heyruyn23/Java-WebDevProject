package org.bjd.ggs.service;

import org.bjd.ggs.dao.PurposesDAO;

public class PurposesServiceImpl implements PurposesService{
	private PurposesDAO purposesDAO;
	public void setPurposesDAO(PurposesDAO purposesDAO) {
		this.purposesDAO = purposesDAO;
	}
}
