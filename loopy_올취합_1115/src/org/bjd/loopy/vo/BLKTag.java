package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class BLKTag {

	private int no, tagNo, targetNo;
	private String acsType;
	private Timestamp regdate;
	
	public BLKTag() {
		// TODO Auto-generated constructor stub
	}

	public BLKTag(int targetNo, String acsType) {
		super();
		this.targetNo = targetNo;
		this.acsType = acsType;
	}
	
	public BLKTag(int tagNo,String acsType, int targetNo) {
		super();
		this.tagNo = tagNo;
		this.targetNo = targetNo;
		this.acsType = acsType;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}

	public String getAcsType() {
		return acsType;
	}

	public void setAcsType(String acsType) {
		this.acsType = acsType;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//BLKTag end
