package org.bjd.ggs.vo;

import java.sql.Timestamp;

public class GiftGram {
	private int no, memberNo, hit;
	private String content,image;
	private Timestamp regDate;
	
	public Timestamp getRegDate() {
		return regDate;
	}

	
	
	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public GiftGram() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}

	
	
}
