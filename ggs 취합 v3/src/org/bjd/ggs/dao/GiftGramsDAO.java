package org.bjd.ggs.dao;

import java.util.List;

import org.bjd.ggs.vo.Article;
import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.Filter;
import org.bjd.ggs.vo.GiftGram;
import org.bjd.ggs.vo.Image;
import org.bjd.ggs.vo.Like;
import org.bjd.ggs.vo.Number;

public interface GiftGramsDAO {
	public List<GiftGram> selectList(Number number); 
	public List<GiftGram> bestList(); 
	public List<GiftGram> filterList(Filter filter); 
	public List<String> imageList(int no);
	public Article selectOne(int no);
	public List<Comment> commentList(String no);
	public Like likeCommentCount(String no);
	public int findLike(int no);
	public int likeInsert(GiftGram gift);
	public int likeDelte(int no);
	public int cmtInsert(Comment cmt);
	public void gramInsert(GiftGram gift);
	public int findGiftNo(GiftGram gift);
	public void imageInsert(Image image);
	public void hitUpdate(int no);
}
