package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Report {

	private int no, accuser_no, targetNo;
	private String reason, reportType;
	private Timestamp regdate;
	
	public Report() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getAccuser_no() {
		return accuser_no;
	}

	public void setAccuser_no(int accuser_no) {
		this.accuser_no = accuser_no;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Report end
