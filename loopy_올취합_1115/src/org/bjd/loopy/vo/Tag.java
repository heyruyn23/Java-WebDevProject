package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Tag {

	private int no;
	private String tag;
	private Timestamp regdate;
	
	public Tag() {
		// TODO Auto-generated constructor stub
	}

	public Tag(String tag) {
		this.tag = tag;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Tag end
