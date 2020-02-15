package org.bjd.ggs.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Image {

	private int no, giftGramNo;
	private String image;
	private Timestamp regDate;
	
	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public Image() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getGiftGramNo() {
		return giftGramNo;
	}

	public void setGiftGramNo(int giftGramNo) {
		this.giftGramNo = giftGramNo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	
}
