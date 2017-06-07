package com.hexacore.ssy.sharing.domain;

import java.util.Date;

public class LikeHistory {
	private int lhid;
	private int shid;
	private String id;
	
	public LikeHistory(){
		
	}
	
	public LikeHistory(int lhid, int shid, String id) {
		super();
		this.lhid = lhid;
		this.shid = shid;
		this.id = id;
	}

	public int getLhid() {
		return lhid;
	}

	public void setLhid(int lhid) {
		this.lhid = lhid;
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

	@Override
	public String toString() {
		return "LikeHistory [lhid=" + lhid + ", shid=" + shid + ", id=" + id + "]";
	}
	
}
