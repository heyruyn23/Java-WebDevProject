package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class BLKSource {

	private int no, sourceNo, songNo, soundSourceCnt;
	private Timestamp regdate;
	
	public BLKSource() {
		// TODO Auto-generated constructor stub
	}

	public int getSoundSourceCnt() {
		return soundSourceCnt;
	}

	public void setSoundSourceCnt(int soundSourceCnt) {
		this.soundSourceCnt = soundSourceCnt;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSourceNo() {
		return sourceNo;
	}

	public void setSourceNo(int sourceNo) {
		this.sourceNo = sourceNo;
	}

	public int getSongNo() {
		return songNo;
	}

	public void setSongNo(int songNo) {
		this.songNo = songNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//BLKSource end
