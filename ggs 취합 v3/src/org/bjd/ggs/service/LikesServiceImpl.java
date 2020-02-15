package org.bjd.ggs.service;

import java.util.HashMap;
import java.util.Map;

import org.bjd.ggs.dao.LikesDAO;
import org.bjd.ggs.vo.Like;

public class LikesServiceImpl implements LikesService{
	private LikesDAO likesDAO;
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	@Override
	public Map<String, Object> execute(Like like) {
		Map<String, Object> map = new HashMap<>();
		
		Like searchLike = likesDAO.selectOne(like);
		
		System.out.println("execute:"+searchLike);

		if(searchLike==null) {
			likesDAO.insert(like);
		}else {
			likesDAO.delete(searchLike);
		}//if~else end
		
		map.put("flag", searchLike==null);
		
		map.put("count", likesDAO.selectTotal(like));
		
		return map;
	}
}
