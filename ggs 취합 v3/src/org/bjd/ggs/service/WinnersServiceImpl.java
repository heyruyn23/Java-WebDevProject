package org.bjd.ggs.service;

import org.bjd.ggs.dao.WinnersDAO;

public class WinnersServiceImpl implements WinnersService {
	private WinnersDAO winnersDAO;
	public void setWinnersDAO(WinnersDAO winnersDAO) {
		this.winnersDAO = winnersDAO;
	}
}
