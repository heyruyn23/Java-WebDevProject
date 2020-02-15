package org.bjd.ggs.dao;

import java.util.List;

import org.bjd.ggs.vo.Item;
import org.bjd.ggs.vo.PageVO;
import org.bjd.ggs.vo.Survey;

public interface ItemsDAO {
	public List<Item> selectCustomGift(Survey survey); 
	public List<Item> selectList(PageVO pageVO);
	
	public List<Integer> selectItemNos(int memberNo);
	
	public List<Item> selectItemArray();
	
	public int selectCount(int memberNo);
}
