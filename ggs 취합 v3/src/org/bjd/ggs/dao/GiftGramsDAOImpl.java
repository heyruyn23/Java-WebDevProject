package org.bjd.ggs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Article;
import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.Filter;
import org.bjd.ggs.vo.GiftGram;
import org.bjd.ggs.vo.Image;
import org.bjd.ggs.vo.Like;
import org.bjd.ggs.vo.Number;

public class GiftGramsDAOImpl implements GiftGramsDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<GiftGram> selectList(Number number) {
		
		return session.selectList("giftGrams.selectList",number);
	}

	@Override
	public List<GiftGram> bestList() {
		System.out.println("test");
		return session.selectList("giftGrams.bestList");
	}

	@Override
	public List<GiftGram> filterList(Filter filter) {
		
		return session.selectList("giftGrams.filterList",filter);
	}

	@Override
	public Article selectOne(int no) {
		
		return session.selectOne("giftGrams.detailuser",no);
	}

	@Override
	public List<String> imageList(int page) {
		
		return session.selectList("giftGrams.selectImage",page);
	}

	@Override
	public List<Comment> commentList(String page) {
		return session.selectList("giftGrams.selectcomment",page);
	}

	@Override
	public Like likeCommentCount(String no) {
		System.out.println(no+"test"+session.selectOne("giftGrams.selectlike", no));
		return session.selectOne("giftGrams.selectlike", no);
	}

	@Override
	public int findLike(int no) {
		
		return session.selectOne("giftGrams.findUser",no);
	}

	@Override
	public int likeInsert(GiftGram gift) {
		
		System.out.println("DAO 확인" + gift.getMemberNo() +"/"+ gift.getNo());
		
		return session.insert("giftGrams.likeInsert",gift);
	}

	@Override
	public int likeDelte(int no) {
		
		return session.delete("giftGrams.likeDelete",no);
	}

	@Override
	public int cmtInsert(Comment cmt) {
		
		return session.insert("giftGrams.cmtInsert",cmt);
	}

	@Override
	public void gramInsert(GiftGram gift) {
		session.insert("giftGrams.gramInsert",gift);
		
	}

	@Override
	public int findGiftNo(GiftGram gift) {
		System.out.println("findGiftNo");
		return session.selectOne("giftGrams.findGramNo",gift);
	}

	@Override
	public void imageInsert(Image image) {
		System.out.println("이미지 등록 : 게시물"+image.getGiftGramNo());
		System.out.println("이미지 등록 : 이미지"+image.getGiftGramNo());
		
		session.insert("giftGrams.imageInsert",image);
		
	}

	@Override
	public void hitUpdate(int no) {
		session.update("giftGrams.hitUpdate",no);
	}

	
}
