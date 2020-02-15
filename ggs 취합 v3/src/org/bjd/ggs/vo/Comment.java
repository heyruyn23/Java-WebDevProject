package org.bjd.ggs.vo;

import java.sql.Timestamp;

public class Comment {
	private int no, memberNo, postNum;
	private String content, type, email;
	private Timestamp regDate;
	public static final String FREE = "F";
	public static final String SANTA = "S";
	public static final String GIFT = "G";
	public static final String EVENT = "E";
	
	public Comment() {
		
	}

	public Comment(int memberNo, int postNum, String content) {
		super();
		this.memberNo = memberNo;
		this.postNum = postNum;
		this.content = content;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}


	
	
}
