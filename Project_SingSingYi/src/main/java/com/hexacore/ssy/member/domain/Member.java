package com.hexacore.ssy.member.domain;

public class Member {

	private String id;
	private int password;
	private String pwquestion;
	private String pwanswer;
	private int coincnt;
	private int rankpoint;
	private int rank;
	
	public Member() {
	}
	
	public Member(String id, int password, String pwquestion, String pwanswer, int coincnt, int rankpoint) {
		super();
		this.id = id;
		this.password = password;
		this.pwquestion = pwquestion;
		this.pwanswer = pwanswer;
		this.coincnt = coincnt;
		this.rankpoint = rankpoint;
	}
	
	public Member(String id, int password, String pwquestion, String pwanswer, int coincnt, int rankpoint, int rank) {
		super();
		this.id = id;
		this.password = password;
		this.pwquestion = pwquestion;
		this.pwanswer = pwanswer;
		this.coincnt = coincnt;
		this.rankpoint = rankpoint;
		this.rank= rank;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int i) {
		this.password = i;
	}

	public String getPwquestion() {
		return pwquestion;
	}

	public void setPwquestion(String pwquestion) {
		this.pwquestion = pwquestion;
	}

	public String getPwanswer() {
		return pwanswer;
	}

	public void setPwanswer(String pwanswer) {
		this.pwanswer = pwanswer;
	}

	public int getCoincnt() {
		return coincnt;
	}

	public void setCoincnt(int coincnt) {
		this.coincnt = coincnt;
	}

	public int getRankpoint() {
		return rankpoint;
	}

	public void setRankpoint(int rankpoint) {
		this.rankpoint = rankpoint;
	}
	
	
	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", pwquestion=" + pwquestion + ", pwanswer=" + pwanswer
				+ ", coincnt=" + coincnt + ", rankpoint=" + rankpoint + "]";
	}
}


