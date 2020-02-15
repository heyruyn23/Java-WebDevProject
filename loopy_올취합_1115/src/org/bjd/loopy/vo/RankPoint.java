package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class RankPoint {

	private int no, userNo, rps, total, cnt;
	private String rpType;
	private Timestamp regdate;
	
	public RankPoint() {
		// TODO Auto-generated constructor stub
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
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

	public int getRps() {
		return rps;
	}

	public void setRps(int rps) {
		this.rps = rps;
	}

	public String getRpType() {
		return rpType;
	}

	public void setRpType(String rpType) {
		this.rpType = rpType;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//RankPoint end
