package org.bjd.ggs.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Event {
	private int no, purposeNo, hit;
	private String title, content;
	private Date startDate, endDate;
	private Timestamp regDate;
	
	public Event() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getPurposeNo() {
		return purposeNo;
	}

	public void setPurposeNo(int purposeNo) {
		this.purposeNo = purposeNo;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
}
