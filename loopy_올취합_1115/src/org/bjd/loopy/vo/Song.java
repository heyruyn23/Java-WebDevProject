package org.bjd.loopy.vo;

import java.sql.Timestamp;

public class Song {

	private int no, userNo, betNo, hit, pubVeri, comVeri, statVeri, srcVeri, duration, songCnt;
	private String title, info, mp3Name, coverName, genre, nickKo, album, profile, nickEn;
	private Timestamp regdate;
	
	public Song() {
		// TODO Auto-generated constructor stub
	}
	
	public String getNickEn() {
		return nickEn;
	}

	public void setNickEn(String nickEn) {
		this.nickEn = nickEn;
	}

	public int getSongCnt() {
		return songCnt;
	}

	public void setSongCnt(int songCnt) {
		this.songCnt = songCnt;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getNickKo() {
		return nickKo;
	}

	public void setNickKo(String nickKo) {
		this.nickKo = nickKo;
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

	public int getBetNo() {
		return betNo;
	}

	public void setBetNo(int betNo) {
		this.betNo = betNo;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getPubVeri() {
		return pubVeri;
	}

	public void setPubVeri(int pubVeri) {
		this.pubVeri = pubVeri;
	}

	public int getComVeri() {
		return comVeri;
	}

	public void setComVeri(int comVeri) {
		this.comVeri = comVeri;
	}

	public int getStatVeri() {
		return statVeri;
	}

	public void setStatVeri(int statVeri) {
		this.statVeri = statVeri;
	}

	public int getSrcVeri() {
		return srcVeri;
	}

	public void setSrcVeri(int srcVeri) {
		this.srcVeri = srcVeri;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getMp3Name() {
		return mp3Name;
	}

	public void setMp3Name(String mp3Name) {
		this.mp3Name = mp3Name;
	}

	public String getCoverName() {
		return coverName;
	}

	public void setCoverName(String coverName) {
		this.coverName = coverName;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}//Song end
