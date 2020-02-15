package org.bjd.loopy.vo;

public class PageVO {

	private int start, end, typeNo;
	private String type;
	
	public PageVO() {
		
	}
	
	public PageVO(int pageNo, int numPage) {
		
		end = pageNo * numPage;
		start = end - (numPage - 1);
		
	}

	public PageVO(int page, int numPage, int typeNo) {
		this(page,numPage);
		this.typeNo = typeNo;
	}
	
	public PageVO(int pageNo , int numPage,String type) {		
		end = pageNo * numPage; 	
		start = end - (numPage-1);
		this.type = type;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}//PageVO end
