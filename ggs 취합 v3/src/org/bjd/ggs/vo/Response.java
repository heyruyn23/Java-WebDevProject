package org.bjd.ggs.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Response {
	private int no, rank, respondentNo, categoryNo, rankFirst, rankSecond, rankThird
				, categoryNoFirst, categoryNoSecond, categoryNoThird;
	private Timestamp regDate;
	
	public Response() {
		
	}
	
	public int getRankFirst() {
		return rankFirst;
	}



	public void setRankFirst(int rankFirst) {
		this.rankFirst = rankFirst;
	}



	public int getRankSecond() {
		return rankSecond;
	}



	public void setRankSecond(int rankSecond) {
		this.rankSecond = rankSecond;
	}



	public int getRankThird() {
		return rankThird;
	}



	public void setRankThird(int rankThird) {
		this.rankThird = rankThird;
	}



	public int getCategoryNoFirst() {
		return categoryNoFirst;
	}



	public void setCategoryNoFirst(int categoryNoFirst) {
		this.categoryNoFirst = categoryNoFirst;
	}



	public int getCategoryNoSecond() {
		return categoryNoSecond;
	}



	public void setCategoryNoSecond(int categoryNoSecond) {
		this.categoryNoSecond = categoryNoSecond;
	}



	public int getCategoryNoThird() {
		return categoryNoThird;
	}



	public void setCategoryNoThird(int categoryNoThird) {
		this.categoryNoThird = categoryNoThird;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getRespondentNo() {
		return respondentNo;
	}

	public void setRespondentNo(int respondentNo) {
		this.respondentNo = respondentNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	
	
}
