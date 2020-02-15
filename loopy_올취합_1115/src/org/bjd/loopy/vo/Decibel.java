package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Decibel {

	private int no, userNo, blkBetNo, dbs;
	private String dbType;
	private Timestamp regdate;
	
	public Decibel() {
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

	public int getBlkBetNo() {
		return blkBetNo;
	}

	public void setBlkBetNo(int blkBetNo) {
		this.blkBetNo = blkBetNo;
	}

	public int getDbs() {
		return dbs;
	}

	public void setDbs(int dbs) {
		this.dbs = dbs;
	}

	public String getDbType() {
		return dbType;
	}

	public void setDbType(String dbType) {
		this.dbType = dbType;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Decibel end
