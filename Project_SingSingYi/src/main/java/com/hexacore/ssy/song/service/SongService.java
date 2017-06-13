package com.hexacore.ssy.song.service;

import java.util.List;

import com.hexacore.ssy.song.domain.Song;

public interface SongService {
	
	public List<Song> randomSong();
	
	public int countSong();
	
	/** BEST 3 노래 가져오기 */
	public List<Song> bestSongs();
	
	/** 전체 노래 목록 가져오기 */
	public List<Song> songsList();
	
	/** 애창곡 추가 */
	public void addFavorite(String id, int sid);
	
	/** 애창곡 삭제 */
	public void removeFavorite(int fid);
	
	
}
