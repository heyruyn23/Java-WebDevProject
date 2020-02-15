package org.bjd.loopy.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Text {

	private int no, userNo, hit, textNo, textHit, likeNum, likeCount, replyCount;
	private String title, text, ref, board, textTitle, nickKo, profile;
	private Timestamp regdate, textReg;
	
	public Text() {
		// TODO Auto-generated constructor stub
	}

	public String getFormatDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		return sdf.format(regdate);
	}
	
	public String getFormatTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
		return sdf.format(regdate);
	}
	
	public int getTextNo() {
		return textNo;
	}

	public void setTextNo(int textNo) {
		this.textNo = textNo;
	}

	public int getTextHit() {
		return textHit;
	}

	public void setTextHit(int textHit) {
		this.textHit = textHit;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public String getTextTitle() {
		return textTitle;
	}

	public void setTextTitle(String textTitle) {
		this.textTitle = textTitle;
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

	public Timestamp getTextReg() {
		return textReg;
	}

	public void setTextReg(Timestamp textReg) {
		this.textReg = textReg;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Text end
