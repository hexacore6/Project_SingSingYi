package com.hexacore.ssy.mypage.domain;

import java.util.Date;

public class CoinHistory {
	
	private int chid;
	private String id;
	private String chtype;
	private String chcontent;
	private int chcount;
	private Date chdate;
	
	public CoinHistory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getChid() {
		return chid;
	}

	public void setChid(int chid) {
		this.chid = chid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChtype() {
		return chtype;
	}

	public void setChtype(String chtype) {
		this.chtype = chtype;
	}

	public String getChcontent() {
		return chcontent;
	}

	public void setChcontent(String chcontent) {
		this.chcontent = chcontent;
	}

	public int getChcount() {
		return chcount;
	}

	public void setChcount(int chcount) {
		this.chcount = chcount;
	}

	public Date getChdate() {
		return chdate;
	}

	public void setChdate(Date chdate) {
		this.chdate = chdate;
	}

	@Override
	public String toString() {
		return "CoinHistory [chid=" + chid + ", id=" + id + ", chtype=" + chtype + ", chcontent=" + chcontent
				+ ", chcount=" + chcount + ", chdate=" + chdate + "]";
	}
}
