package com.hexacore.ssy.sharing.domain;

import java.util.Date;

public class Comment {
	private int cid;
	private int shid;
	private String id;
	private String ccontent;
	private String cregdate;
	
	public Comment(){
		
	}
	
	public Comment(int cid, int shid, String id, String ccontent, String cregdate) {
		super();
		this.cid = cid;
		this.shid = shid;
		this.id = id;
		this.ccontent = ccontent;
		this.cregdate = cregdate;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getShid() {
		return shid;
	}

	public void setShid(int shid) {
		this.shid = shid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCregdate() {
		return cregdate;
	}

	public void setCregdate(String cregdate) {
		this.cregdate = cregdate;
	}

	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", shid=" + shid + ", id=" + id + ", ccontent=" + ccontent + ", cregdate="
				+ cregdate + "]";
	}
	
	
}
