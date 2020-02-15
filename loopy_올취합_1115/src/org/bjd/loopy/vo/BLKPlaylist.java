package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class BLKPlaylist {

	private int no, songNo, playlistNo, idx;
	private Timestamp regdate;
	
	public BLKPlaylist() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSongNo() {
		return songNo;
	}

	public void setSongNo(int songNo) {
		this.songNo = songNo;
	}

	public int getPlaylistNo() {
		return playlistNo;
	}

	public void setPlaylistNo(int playlistNo) {
		this.playlistNo = playlistNo;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//BLKPlaylist end
