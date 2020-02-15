package org.bjd.ggs.service;

import java.util.List;

import org.bjd.ggs.dao.ItemsDAO;
import org.bjd.ggs.vo.Item;
import org.bjd.ggs.vo.PageVO;
import org.bjd.ggs.vo.Survey;

public class ItemsServiceImpl implements ItemsService {
	private ItemsDAO itemsDAO;
	public void setItemsDAO(ItemsDAO itemsDAO) {
		this.itemsDAO = itemsDAO;
	}
	@Override
	public List<Item> getCustomGift(Survey survey) {
		// TODO Auto-generated method stub
		return itemsDAO.selectCustomGift(survey);
	}
	@Override
	public List<Item> getItems(PageVO pageVO) {
		// TODO Auto-generated method stub
		return itemsDAO.selectList(pageVO);
	}
	
	@Override
	public List<Item> getItemList() {
		// TODO Auto-generated method stub
		return itemsDAO.selectItemArray();
	}
	@Override
	public List<Integer> getItemNos(int memberNo) {
		// TODO Auto-generated method stub
		return itemsDAO.selectItemNos(memberNo);
	}
	@Override
	public int getCount(int memberNo) {
		// TODO Auto-generated method stub
		return itemsDAO.selectCount(memberNo);
	}


}
