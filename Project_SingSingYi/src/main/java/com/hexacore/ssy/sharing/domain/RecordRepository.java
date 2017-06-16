package com.hexacore.ssy.sharing.domain;

import java.util.Date;

public class RecordRepository {
	private int rrid;
	private String id;
	private String recordfilename;
	private String recordregdate;
	
	public RecordRepository(){
		
	}

	public RecordRepository(int rrid, String id, String recordfilename, String recordregdate) {
		super();
		this.rrid = rrid;
		this.id = id;
		this.recordfilename = recordfilename;
		this.recordregdate = recordregdate;
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

	public String getRecordregdate() {
		return recordregdate;
	}

	public void setRecordregdate(String recordregdate) {
		this.recordregdate = recordregdate;
	}

	@Override
	public String toString() {
		return "RecordRepository [rrid=" + rrid + ", id=" + id + ", recordfilename=" + recordfilename
				+ ", recordregdate=" + recordregdate + "]";
	}
}
