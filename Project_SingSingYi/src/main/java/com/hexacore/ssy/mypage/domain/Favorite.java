package com.hexacore.ssy.mypage.domain;

public class Favorite {
	
	private int fid;
	private String id;
	private int sid;
	
	public Favorite() {
		super();
	}

	public Favorite(int fid, String id, int sid) {
		super();
		this.fid = fid;
		this.id = id;
		this.sid = sid;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	@Override
	public String toString() {
		return "Favorite [fid=" + fid + ", id=" + id + ", sid=" + sid + "]";
	}
}
