package org.bjd.ggs.service;

import java.util.List;
import java.util.Map;
import org.bjd.ggs.vo.Article;


public interface BoardService {
	Map<String, Object> getIndexContents(int pageNo,String order,String select, String wire);
	public Map<String, Object> getArticleContents(int no, int pageNo, int memberNo, boolean isHit);
	Map<String, Object> getIndexContentsSanta(int pageNo,String order,String select, String wire);
	public Map<String, Object> getArticleContentsSanta(int no, int pageNo, int memberNo, boolean isHit);
	public List<Article> freeBoardList();
	public List<Article> giveBoardList();
	public Article getArticle(int no);
	public Article getArticleSanta(int no);
	public boolean write(Article article);
	public boolean writeSanta(Article article);
}
