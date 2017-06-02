package com.hexacore.ssy.board.domain;


public class Article {
	private int aid;         //글 번호
	private String id;	     //사용자 아이디
	private int bid;		 //게시판 종류 번호
	private String atitle;   //글 제목
	private String acontent; //글 내용
	private String aregdate; //글 작성날짜
	private int viewcnt;     //조회수
	
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
	
	public String getAtitle() {
		return atitle;
	}
	
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	
	public String getAcontent() {
		return acontent;
	}
	
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	
	public String getAregdate() {
		return aregdate;
	}
	
	public void setAregdate(String aregdate) {
		this.aregdate = aregdate;
	}
	
	public int getViewcnt() {
		return viewcnt;
	}
	
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	@Override
	public String toString() {
		return "Article [aid=" + aid + ", id=" + id + ", bid=" + bid + ", atitle=" + atitle + ", acontent=" + acontent
				+ ", aregdate=" + aregdate + ", viewcnt=" + viewcnt + "]";
	}
	
}
