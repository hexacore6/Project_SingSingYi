package com.hexacore.ssy.board.domain;

public class Reply {
	
	private int rid;         //댓글번호
	private int aid;		 //게시글 번호
	private String id;		 //사용자 아이디
	private int bid;		 //게시판종류 번호
	private String rcontent; //게시글 댓글 내용
	private String rregdate; //게시글 댓글 작성날짜
	
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRregdate() {
		return rregdate;
	}
	public void setRregdate(String rregdate) {
		this.rregdate = rregdate;
	}
	
	@Override
	public String toString() {
		return "Reply [rid=" + rid + ", aid=" + aid + ", id=" + id + ", bid=" + bid + ", rcontent=" + rcontent
				+ ", rregdate=" + rregdate + "]";
	}
	
	
	
}
