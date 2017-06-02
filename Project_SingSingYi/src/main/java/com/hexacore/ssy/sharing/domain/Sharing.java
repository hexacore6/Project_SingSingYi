package com.hexacore.ssy.sharing.domain;

import java.util.Date;

public class Sharing {
	
	private int shid;
	private String id;
	private int rrid;
	private String shcontent;
	private int likecnt;
	private int commentcnt;
	private String eximgfilename;
	private Date shregdate;
	

	public Sharing() {

	}


	public Sharing(int shid, String id, int rrid, String shcontent, int likecnt, int commentcnt,
			String eximgfilename, Date shregdate) {
		super();
		this.shid = shid;
		this.id = id;
		this.rrid = rrid;
		this.shcontent = shcontent;
		this.likecnt = likecnt;
		this.commentcnt = commentcnt;
		this.eximgfilename = eximgfilename;
		this.shregdate = shregdate;
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


	public int getRrid() {
		return rrid;
	}


	public void setRrid(int rrid) {
		this.rrid = rrid;
	}


	public String getShcontent() {
		return shcontent;
	}


	public void setShcontent(String shcontent) {
		this.shcontent = shcontent;
	}


	public int getLikecnt() {
		return likecnt;
	}


	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}


	public int getCommentcnt() {
		return commentcnt;
	}


	public void setCommentcnt(int commentcnt) {
		this.commentcnt = commentcnt;
	}


	public String getEximgfilename() {
		return eximgfilename;
	}


	public void setEximgfilename(String eximgfilename) {
		this.eximgfilename = eximgfilename;
	}


	public Date getShregdate() {
		return shregdate;
	}


	public void setShregdate(Date shregdate) {
		this.shregdate = shregdate;
	}


	@Override
	public String toString() {
		return "Sharings [shid=" + shid + ", id=" + id + ", rrid=" + rrid + ", shcontent=" + shcontent + ", likecnt="
				+ likecnt + ", commentcnt=" + commentcnt + ", eximgfilename=" + eximgfilename + ", shregdate=" + shregdate + "]";
	}

	
}
