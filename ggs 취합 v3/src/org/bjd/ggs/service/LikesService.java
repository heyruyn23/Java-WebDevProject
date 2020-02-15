package org.bjd.ggs.service;

import java.util.Map;
import org.bjd.ggs.vo.Like;



public interface LikesService {
	
	public Map<String, Object> execute(Like like);
}
