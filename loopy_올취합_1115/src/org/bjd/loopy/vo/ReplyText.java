package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class ReplyText {

	private int no, textNo, userNo, seq, likeCount;
	private String text, nickKo, profile;
	private Timestamp regdate;
	
	public ReplyText() {
		// TODO Auto-generated constructor stub
	}

	public String getNickKo() {
		return nickKo;
	}

	public void setNickKo(String nickKo) {
		this.nickKo = nickKo;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getTextNo() {
		return textNo;
	}

	public void setTextNo(int textNo) {
		this.textNo = textNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//ReplayText
