package com.hexacore.ssy.song.domain;

public class Song {
	private int  sid;
	private String simgfilename;
	private String sfilename;
	private String stitle;
	private String singer;
	private String mrfilename;
	private String lyricsfilename;
	private String lyricstimefilename;
	private String midifilename;
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
	public String getMrfilename() {
		return mrfilename;
	}
	public void setMrfilename(String mrfilename) {
		this.mrfilename = mrfilename;
	}
	public String getLyricsfilename() {
		return lyricsfilename;
	}
	public void setLyricsfilename(String lyricsfilename) {
		this.lyricsfilename = lyricsfilename;
	}
	public String getLyricstimefilename() {
		return lyricstimefilename;
	}
	public void setLyricstimefilename(String lyricstimefilename) {
		this.lyricstimefilename = lyricstimefilename;
	}
	public String getMidifilename() {
		return midifilename;
	}
	public void setMidifilename(String midifilename) {
		this.midifilename = midifilename;
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
				+ ", singer=" + singer + ", mrfilename=" + mrfilename + ", lyricsfilename=" + lyricsfilename
				+ ", lyricstimefilename=" + lyricstimefilename + ", midifilename=" + midifilename + ", playcnt="
				+ playcnt + "]";
	}
	
	

	
	
}
