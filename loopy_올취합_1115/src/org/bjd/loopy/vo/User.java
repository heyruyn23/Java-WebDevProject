package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class User {

	private int no, verification, rps, dbs, exps, userNo;
	private float dbPct;
	private String email, password, nickKo, nickEn, profile, coverArt, info;
	private Timestamp regdate;
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(String email, String password) {
		super();
		this.email=email;
		this.password=password;
	}
	
	public int getRps() {
		return rps;
	}

	public void setRps(int rps) {
		this.rps = rps;
	}

	public int getDbs() {
		return dbs;
	}

	public void setDbs(int dbs) {
		this.dbs = dbs;
	}

	public int getExps() {
		return exps;
	}

	public void setExps(int exps) {
		this.exps = exps;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public float getDbPct() {
		return dbPct;
	}

	public void setDbPct(float dbPct) {
		this.dbPct = dbPct;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getVerification() {
		return verification;
	}
	public void setVerification(int verification) {
		this.verification = verification;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickKo() {
		return nickKo;
	}
	public void setNickKo(String nickKo) {
		this.nickKo = nickKo;
	}
	public String getNickEn() {
		return nickEn;
	}
	public void setNickEn(String nickEn) {
		this.nickEn = nickEn;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getCoverArt() {
		return coverArt;
	}
	public void setCoverArt(String coverArt) {
		this.coverArt = coverArt;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//User end
