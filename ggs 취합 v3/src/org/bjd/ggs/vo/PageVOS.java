package org.bjd.ggs.vo;

public class PageVOS {
	
	private int start, end, postNum;
	private String order,select, wire;
	
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public String getWire() {
		return wire;
	}

	public void setWire(String wire) {
		this.wire = wire;
	}

	public PageVOS() {
		// TODO Auto-generated constructor stub
	}
	
	public PageVOS(int page, int numPage, int postNum) {
		this(page,numPage);
		this.postNum = postNum;
	}

	public PageVOS(int page, int numPage) {
		end = page*numPage;
		start = end-(numPage-1);
	}
	public PageVOS(int page, int numPage,String order) {
		end = page*numPage;
		start = end-(numPage-1);
		if(order.equals("new")) {
			this.order="b.no";
		}else {
			this.order="l.count";
		}
		System.out.println("pageVO::"+this.order);
	}
	public PageVOS(int page, int numPage,String order, String select, String wire) {
		end = page*numPage;
		start = end-(numPage-1);
		if(order.equals("new")) {
			this.order="b.no";
		}else {
			this.order="l.count";
		}
		this.select=select;
		this.wire="%"+wire+"%";
		
		System.out.println("pageVO::"+this.order);
		System.out.println("pageVO::"+this.select);
		System.out.println("pageVO::"+this.wire);
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
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

}
