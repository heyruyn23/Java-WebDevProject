package org.bjd.ggs.vo;

public class Like {
	private int no, memberNo, postNum, commentCnt, likeCnt;
	private String type;
	public static final String FREE = "F";
	public static final String SANTA = "S";
	public static final String GIVE = "G";
	
	public Like() {
		
	}
	public Like(int memberNo, int postNum, String type) {
		super();
		this.memberNo = memberNo;
		this.postNum = postNum;
		this.type = type;
	}

	public int getNo() {
		return no;
	}
	
	
	
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
