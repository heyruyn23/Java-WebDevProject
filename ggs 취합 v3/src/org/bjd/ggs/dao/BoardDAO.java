package org.bjd.ggs.dao;

import java.util.List;

import org.bjd.ggs.vo.Article;
import org.bjd.ggs.vo.PageVO;
import org.bjd.ggs.vo.PageVOS;


public interface BoardDAO {

	public List<Article> selectList(PageVO pageVO);// selectList() end
	public List<Article> selectListSanta(PageVOS pageVOS);// selectList() end

	public int selectTotal();
	public int selectTotals();
	public Article selectOne(int no);
	public List<Article> selectList();
	public int updateHit(int no);
	public int insert(Article article);
	
	public Article selectOneSanta(int no);
	public List<Article> selectListSanta();
	public int insertSanta(Article article);
}
