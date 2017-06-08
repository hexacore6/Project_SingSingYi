package com.hexacore.ssy.song.dao;

import java.util.List;

import com.hexacore.ssy.song.domain.Song;

public interface SongDAO {

	public List<Song> randomSong();
	
	public int countSong();

}
