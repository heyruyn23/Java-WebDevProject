package org.bjd.ggs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.bjd.ggs.vo.Article;
import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.Filter;
import org.bjd.ggs.vo.GiftGram;
import org.bjd.ggs.vo.Like;
import org.bjd.ggs.vo.Member;
import org.bjd.ggs.vo.Number;

public interface GiftGramsService {
	public List<GiftGram> getList(int num);
	public Map<String,Object> getBestList();
	public List<GiftGram> getFilterList(Filter filter);
	public Map<String, Object> getDetailGram(int no, int page);
	public List<Comment> getCommentList(String page);
	public Like getLike(String no);
	public int findUser(int no, String postNum);
	public void cmtInsert(Comment cmt);
	public void gramInsert(String[] image, String content, int loginNO);
	public void hitUpdate(int giftNo);
}
