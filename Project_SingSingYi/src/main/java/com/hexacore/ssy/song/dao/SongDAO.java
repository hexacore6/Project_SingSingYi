package com.hexacore.ssy.song.dao;

import java.util.List;

import com.hexacore.ssy.song.domain.Song;

public interface SongDAO {
	
	public List<Song> randomSong();
	
	public int countSong();
	
	/** BEST 3 노래 불러오기 */
	public List<Song> bestSongs();
	
	/** 전체 노래 목록 */
	public List<Song> songsList();
	
}
