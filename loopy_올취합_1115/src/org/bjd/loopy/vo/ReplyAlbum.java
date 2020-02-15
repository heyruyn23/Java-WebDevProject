package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class ReplyAlbum {

	private int no, userNo, playlistNo, seq;
	private String text;
	private Timestamp regdate;
	
	public ReplyAlbum() {
		// TODO Auto-generated constructor stub
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

	public int getPlaylistNo() {
		return playlistNo;
	}

	public void setPlaylistNo(int playlistNo) {
		this.playlistNo = playlistNo;
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
	
}//ReplayAlbum end
