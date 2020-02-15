package org.bjd.ggs.dao;

import java.util.List;

import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.PageVO;

public interface CommentsDAO {
	
	public List<Comment> selectList(PageVO pageVO);

	public int selectTotal(int no);
	public List<Comment> selectListS(PageVO pageVO);

	public int selectTotalS(int no);
	public int insert(Comment comment);
	public int insertSanta(Comment comment);
	
	public List<Comment> selectListEC(PageVO pageVO);
	public int selectTotalEC(int no);
	public int insertE(Comment comment);
}
