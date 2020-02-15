package org.bjd.ggs.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Member {
	public static final String LOGIN = "loginMember";
	
	private int no , postNum;
	private String email, password, sex;
	private Date birthDate;
	private Timestamp regDate; 
	
	public Member(String email,
			String password,
			String sex,
			Date birthDate) {
		this.email = email;
		this.password = password;
		this.sex = sex;
		this.birthDate = birthDate;
	}
	 
	
	
	public int getPostNum() {
		return postNum;
	}



	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}



	public Member(String email, String password) {
		this.email = email;
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Member() {
		
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
}
