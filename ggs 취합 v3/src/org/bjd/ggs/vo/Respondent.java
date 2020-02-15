package org.bjd.ggs.vo;

import java.sql.Timestamp;

public class Respondent {
	private int no, memberNo, eventNo;
	private String target;
	private Timestamp regDate;
	
	public Respondent() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	
	
}
