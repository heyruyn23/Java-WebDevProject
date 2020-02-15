package org.bjd.ggs.service;

import org.bjd.ggs.dao.PickmesDAO;
import org.bjd.ggs.vo.Pickme;

public class PickmesServiceImpl implements PickmesService{
	private PickmesDAO pickmesDAO;
	public void setPickmesDAO(PickmesDAO pickmesDAO) {
		this.pickmesDAO = pickmesDAO;
	}
	@Override
	public int putItem(Pickme pickme) {
		// TODO Auto-generated method stub
		return pickmesDAO.insertItem(pickme);
	}
	@Override
	public int deleteItem(Pickme pickme) {
		// TODO Auto-generated method stub
		return pickmesDAO.deleteItem(pickme);
	}
	@Override
	public int updateItem(Pickme pickme) {
		// TODO Auto-generated method stub
		return pickmesDAO.updateItem(pickme);
	}
}
