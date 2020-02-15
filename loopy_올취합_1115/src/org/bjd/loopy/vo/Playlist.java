package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Playlist {

	private int no, userNo, playedTime, wholeNum, wholeDuration;
	private String name, acType, coverName, content, nickKo, tag, defaultMsg;
	private Timestamp regdate;
	
	public Playlist() {
		// TODO Auto-generated constructor stub
	}

	public Playlist(String acType,int userNo) {
		super();
		this.userNo = userNo;
		this.acType = acType;
	}
	
	public Playlist(int no, String acType) {
		super();
		this.no = no;
		this.acType = acType;
	}
	
	public String getNickKo() {
		return nickKo;
	}

	public void setNickKo(String nickKo) {
		this.nickKo = nickKo;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getDefaultMsg() {
		return defaultMsg;
	}

	public void setDefaultMsg(String defaultMsg) {
		this.defaultMsg = defaultMsg;
	}

	public int getWholeNum() {
		return wholeNum;
	}

	public void setWholeNum(int wholeNum) {
		this.wholeNum = wholeNum;
	}

	public int getWholeDuration() {
		return wholeDuration;
	}

	public void setWholeDuration(int wholeDuration) {
		this.wholeDuration = wholeDuration;
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

	public int getPlayedTime() {
		return playedTime;
	}

	public void setPlayedTime(int playedTime) {
		this.playedTime = playedTime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAcType() {
		return acType;
	}

	public void setAcType(String acType) {
		this.acType = acType;
	}

	public String getCoverName() {
		return coverName;
	}

	public void setCoverName(String coverName) {
		this.coverName = coverName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Playlist end
