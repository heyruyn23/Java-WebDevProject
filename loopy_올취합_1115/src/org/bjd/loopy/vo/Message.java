package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Message {

	private int no, senderNo, receiverNo, checked;
	private String text;
	private Timestamp regdate;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSenderNo() {
		return senderNo;
	}

	public void setSenderNo(int senderNo) {
		this.senderNo = senderNo;
	}

	public int getReceiverNo() {
		return receiverNo;
	}

	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Message end
