package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class BLKFile {

	private int no, textNo;
	private String fileName;
	private Timestamp regdate;
	
	public BLKFile() {
		// TODO Auto-generated constructor stub
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTextNo() {
		return textNo;
	}
	public void setTextNo(int textNo) {
		this.textNo = textNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//BLKFile end
