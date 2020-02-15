package org.bjd.ggs.vo;

import java.sql.Timestamp;


public class Article {
	private int no, memberNo, hit, likesNum, commentsNum ,postNum;
	private String title, content, type, fileName, email;
	public static final String FREE = "F";
	public static final String SANTA = "S";
	private Timestamp regDate;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public Article() {
		
	}
	public Article(int no ,String title,String content) {
		this.no = no;
		this.title = title;
		this.content = content;
	}
	
	public Article(String title,String content,int memberNo) {
		this.title = title;
		this.content = content;
		this.memberNo = memberNo;
	}
	
	public int getLikesNum() {
		return likesNum;
	}

	public void setLikesNum(int likesNum) {
		this.likesNum = likesNum;
	}

	public int getCommentsNum() {
		return commentsNum;
	}

	public void setCommentNum(int commentsNum) {
		this.commentsNum = commentsNum;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	
	

}
