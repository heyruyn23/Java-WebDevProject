package org.bjd.ggs.dao;

import org.bjd.ggs.vo.Pickme;

public interface PickmesDAO {
	public int insertItem(Pickme pickme);
	public int deleteItem(Pickme pickme);
	public int updateItem(Pickme pickme);
}
