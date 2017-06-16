package com.hexacore.ssy.mypage.domain;

public class FollowList {
	private int flid;
	private String sender;
	private String target;
	
	public FollowList() {
		super();
	}

	public FollowList(int flid, String sender, String target) {
		super();
		this.flid = flid;
		this.sender = sender;
		this.target = target;
	}

	public int getflid() {
		return flid;
	}

	public void setflid(int flid) {
		this.flid = flid;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	@Override
	public String toString() {
		return "FollowList [flid=" + flid + ", sender=" + sender + ", target=" + target + "]";
	}
}

	
