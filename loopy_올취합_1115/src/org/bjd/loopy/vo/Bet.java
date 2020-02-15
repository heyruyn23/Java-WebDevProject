package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Bet {

	private int no, seq;
	private String title, mp3Name, coverName, nickKo;
	private Timestamp regdate, endTime;
	
	public Bet() {
		// TODO Auto-generated constructor stub
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMp3Name() {
		return mp3Name;
	}

	public void setMp3Name(String mp3Name) {
		this.mp3Name = mp3Name;
	}

	public String getCoverName() {
		return coverName;
	}

	public void setCoverName(String coverName) {
		this.coverName = coverName;
	}

	public String getNickKo() {
		return nickKo;
	}

	public void setNickKo(String nickKo) {
		this.nickKo = nickKo;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
}//Bet end
