package com.hexacore.ssy.board.domain;

public class Board {

	private int bid; // 게시판 번호
	private String btype; // 게시판 종류

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", btype=" + btype + "]";
	}

}
