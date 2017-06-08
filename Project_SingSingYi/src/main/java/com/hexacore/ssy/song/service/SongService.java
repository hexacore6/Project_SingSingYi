package com.hexacore.ssy.song.service;

import java.util.List;

import com.hexacore.ssy.song.domain.Song;

public interface SongService {
	
	public List<Song> randomSong();
	
	public int countSong();
	
}
