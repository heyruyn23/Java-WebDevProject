package org.bjd.ggs.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.bjd.ggs.dao.GiftGramsDAO;
import org.bjd.ggs.vo.Article;
import org.bjd.ggs.vo.Comment;
import org.bjd.ggs.vo.Filter;
import org.bjd.ggs.vo.GiftGram;
import org.bjd.ggs.vo.Image;
import org.bjd.ggs.vo.Like;
import org.bjd.ggs.vo.Member;
import org.bjd.ggs.vo.Number;

public class GiftGramsServiceImpl implements GiftGramsService{
	private GiftGramsDAO giftgramDAO;
	public void setGiftGramsDAO(GiftGramsDAO giftgramDAO) {
		this.giftgramDAO = giftgramDAO;
	}
	@Override
	public List<GiftGram> getList(int number) {
		Number num = new Number();
		num.setEndNumber(number);
		num.setStartNumber(number-9);
		return giftgramDAO.selectList(num);
	}
	@Override
	public Map<String,Object> getBestList() {
		Map<String, Object> map = new ConcurrentHashMap<>();
		List<GiftGram> list = giftgramDAO.bestList();
		map.put("bestlist", list);
		System.out.println(list);
		return map;
	}
	@Override
	public List<GiftGram> getFilterList(Filter filternum) {
		
		System.out.println("age = "+ filternum.getAge());
		System.out.println("endage = "+ filternum.getEndage());
		System.out.println("sex = "+ filternum.getSex());
		
		List<GiftGram> grams = giftgramDAO.filterList(filternum);
		
		System.out.println("서비스단 리스트 : "+grams);
		
		return grams;
	}
	@Override
	public Map<String, Object> getDetailGram(int no, int page) {
		
		Map<String, Object> map = new ConcurrentHashMap<>();

		 map.put("images", giftgramDAO.imageList(page)) ;
		 map.put("user", giftgramDAO.selectOne(page));
		 
		 //giftgramDAO.commentList(page);
		
		return map;
	}
	@Override
	public List<Comment> getCommentList(String page) {
		
		return giftgramDAO.commentList(page);
	}
	@Override
	public Like getLike(String no) {
		
		return giftgramDAO.likeCommentCount(no);
	}
	@Override
	public int findUser(int no, String postNum) {
		
		System.out.println("유저확인"+giftgramDAO.findLike(no));
		
		GiftGram gift = new GiftGram();
		
		gift.setNo(Integer.parseInt(postNum));
		gift.setMemberNo(no);
		
		System.out.println("서비스 확인" + no +"/"+ Integer.parseInt(postNum));
		
		 
		if(giftgramDAO.findLike(no) == 1) {
			giftgramDAO.likeDelte(no);
			return 0;
		}
		else {
			giftgramDAO.likeInsert(gift);
			return 1;
		}
		
	}
	@Override
	public void cmtInsert(Comment cmt) {
		int result;
		result = giftgramDAO.cmtInsert(cmt);
		System.out.println(result);
	}
	@Override
	public void gramInsert(String[] image, String content, int loginNO) {
		
		System.out.println("service gramInsert");
	
		for(int i=0 ; i<=image.length ; i++ ) {
			System.out.println("이미지들"+image[0]);
		}
	
		
		GiftGram gift = new GiftGram();
		
		gift.setContent(content);
		gift.setMemberNo(loginNO);
		
		giftgramDAO.gramInsert(gift);
		
		
		int giftNo = giftgramDAO.findGiftNo(gift);
		
		Image img = new Image();
		
		img.setGiftGramNo(giftNo);
		
		for(String imageName : image)
		{
			img.setImage(imageName);
			
			giftgramDAO.imageInsert(img);
		}
		
	}
	@Override
	public void hitUpdate(int giftNo) {
		giftgramDAO.hitUpdate(giftNo);
		
	}
	

}
