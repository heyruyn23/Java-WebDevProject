package org.bjd.ggs.dao;

import org.bjd.ggs.vo.Like;

public interface LikesDAO {
	
	public int delete(Like like);

	public int insert(Like like);

	public Like selectOne(Like like);

	public int selectTotal(Like like);
}
