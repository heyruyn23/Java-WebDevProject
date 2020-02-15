package org.bjd.ggs.service;

import java.util.List;

import org.bjd.ggs.vo.Item;
import org.bjd.ggs.vo.PageVO;
import org.bjd.ggs.vo.Survey;



public interface ItemsService {
	public List<Item> getCustomGift(Survey survey);
	public List<Item> getItems(PageVO pageVO);
	public List<Integer> getItemNos(int memberNo);
	public List<Item> getItemList();
	public int getCount(int memberNo);
}
