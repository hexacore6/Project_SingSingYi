package com.hexacore.ssy.song.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hexacore.ssy.song.dao.SongDAO;
import com.hexacore.ssy.song.domain.Song;

@Service
public class SongServicelmpl implements SongService  {

	@Inject
    private SongDAO songDao;

	@Override
	public Song randomMusic(int sid) {
		return songDao.randomMusic(sid);
	}
	
	
	


}
