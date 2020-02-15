package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class UserMGMT {

	private int no, actorNo, acteeNo, userNo, followerCnt;
	private String sbType, reason;
	private Timestamp regdate;
	
	public UserMGMT() {
		// TODO Auto-generated constructor stub
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getFollowerCnt() {
		return followerCnt;
	}

	public void setFollowerCnt(int followerCnt) {
		this.followerCnt = followerCnt;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getActorNo() {
		return actorNo;
	}

	public void setActorNo(int actorNo) {
		this.actorNo = actorNo;
	}

	public int getActeeNo() {
		return acteeNo;
	}

	public void setActeeNo(int acteeNo) {
		this.acteeNo = acteeNo;
	}

	public String getSbType() {
		return sbType;
	}

	public void setSbType(String sbType) {
		this.sbType = sbType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//UserMGMT end
