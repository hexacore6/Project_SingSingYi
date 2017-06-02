package com.hexacore.ssy.mypage.domain;

import java.util.Date;

public class RecordRepository {
	
	private int rrid;
	private String id;
	private String recordfilename;
	private Date recordregdate;
	
	public RecordRepository() {
		super();
	}

	public int getRrid() {
		return rrid;
	}

	public void setRrid(int rrid) {
		this.rrid = rrid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRecordfilename() {
		return recordfilename;
	}

	public void setRecordfilename(String recordfilename) {
		this.recordfilename = recordfilename;
	}

	public Date getRecordregdate() {
		return recordregdate;
	}

	public void setRecordregdate(Date recordregdate) {
		this.recordregdate = recordregdate;
	}

	@Override
	public String toString() {
		return "RecordRepository [rrid=" + rrid + ", id=" + id + ", recordfilename=" + recordfilename
				+ ", recordregdate=" + recordregdate + "]";
	}
}
