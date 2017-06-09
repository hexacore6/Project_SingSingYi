package com.hexacore.ssy.song.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hexacore.ssy.song.dao.SongDAO;
import com.hexacore.ssy.song.domain.Song;

@Service
public class SongServicelmpl implements SongService  {

	@Inject
    private SongDAO songDao;

/*	@Override
	public List<Song> randomSong() {
		return songDao.randomSong();
	}*/
	
	@Override
	public List<Song> randomSong() {
		return songDao.randomSong();
	}

	@Override
	public int countSong() {
		return songDao.countSong();
	}
	
	@Override
	public List<Song> bestSongs() {
		return songDao.bestSongs();
	}
	
	@Override
	public List<Song> songsList() {
		return songDao.songsList();
	}

}
