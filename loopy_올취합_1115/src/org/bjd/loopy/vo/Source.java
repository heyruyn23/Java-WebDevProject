package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Source {

	private int no, userNo, folderNo;
	private String name, mp3Name, nickKo, nickEn;
	private Timestamp regdate;
	
	public Source() {
		// TODO Auto-generated constructor stub
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

	public int getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(int folderNo) {
		this.folderNo = folderNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMp3Name() {
		return mp3Name;
	}

	public void setMp3Name(String mp3Name) {
		this.mp3Name = mp3Name;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Source end
