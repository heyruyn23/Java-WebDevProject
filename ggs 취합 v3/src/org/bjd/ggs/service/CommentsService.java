package org.bjd.ggs.service;

import java.util.Map;

import org.bjd.ggs.vo.Comment;

public interface CommentsService {
	public boolean write(Comment comment);
	public boolean writeSanta(Comment comment);	
	
	public Map<String, Object> selectListEC(int pageNo, int no);
	public int selectTotalEC(int no);
	public boolean insertE(Comment comment);
}
