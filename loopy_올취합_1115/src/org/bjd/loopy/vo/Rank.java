package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Rank {

	private int no;
	private String name;
	private long pct;
	private Timestamp regdate;
	
	public Rank() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getPct() {
		return pct;
	}

	public void setPct(long pct) {
		this.pct = pct;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Rank end
