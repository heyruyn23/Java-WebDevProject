package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Exp {

	private int no, userNo, exps; 
	private String expType;
	private Timestamp regdate;
	
	public Exp() {
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

	public int getExps() {
		return exps;
	}

	public void setExps(int exps) {
		this.exps = exps;
	}

	public String getExpType() {
		return expType;
	}

	public void setExpType(String expType) {
		this.expType = expType;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Exp end
