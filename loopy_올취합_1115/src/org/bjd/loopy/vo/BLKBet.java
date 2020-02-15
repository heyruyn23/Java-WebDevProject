package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class BLKBet {

	private int no, userNo, songNo, betNo, betDBs;
	private Timestamp regdate;
	
	public BLKBet() {
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
	public int getSongNo() {
		return songNo;
	}
	public void setSongNo(int songNo) {
		this.songNo = songNo;
	}
	public int getBetNo() {
		return betNo;
	}
	public void setBetNo(int betNo) {
		this.betNo = betNo;
	}
	public int getBetDBs() {
		return betDBs;
	}
	public void setBetDBs(int betDBs) {
		this.betDBs = betDBs;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//BLKBet end
