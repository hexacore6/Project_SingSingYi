package com.hexacore.ssy.song.domain;

public class Song {
	private int  sid;
	private String simgfilename;
	private String sfilename;
	private String stitle;
	private String singer;
	private String musicalnote1;
	private String musicalnote2;
	private String musicalnote3;
	private String musicalnote4;
	private int playcnt;
	
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSimgfilename() {
		return simgfilename;
	}
	public void setSimgfilename(String simgfilename) {
		this.simgfilename = simgfilename;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getMusicalnote1() {
		return musicalnote1;
	}
	public void setMusicalnote1(String musicalnote1) {
		this.musicalnote1 = musicalnote1;
	}
	public String getMusicalnote2() {
		return musicalnote2;
	}
	public void setMusicalnote2(String musicalnote2) {
		this.musicalnote2 = musicalnote2;
	}
	public String getMusicalnote3() {
		return musicalnote3;
	}
	public void setMusicalnote3(String musicalnote3) {
		this.musicalnote3 = musicalnote3;
	}
	public String getMusicalnote4() {
		return musicalnote4;
	}
	public void setMusicalnote4(String musicalnote4) {
		this.musicalnote4 = musicalnote4;
	}
	public int getPlaycnt() {
		return playcnt;
	}
	public void setPlaycnt(int playcnt) {
		this.playcnt = playcnt;
	}
	
	@Override
	public String toString() {
		return "Song [sid=" + sid + ", simgfilename=" + simgfilename + ", sfilename=" + sfilename + ", stitle=" + stitle
				+ ", singer=" + singer + ", musicalnote1=" + musicalnote1 + ", musicalnote2=" + musicalnote2
				+ ", musicalnote3=" + musicalnote3 + ", musicalnote4=" + musicalnote4 + ", playcnt=" + playcnt + "]";
	}
	
	
}
