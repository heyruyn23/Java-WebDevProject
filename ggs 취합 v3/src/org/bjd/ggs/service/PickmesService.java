package org.bjd.ggs.service;

import org.bjd.ggs.vo.Pickme;

public interface PickmesService {
	public int putItem(Pickme pickme);
	public int deleteItem(Pickme pickme);
	public int updateItem(Pickme pickme);

}
