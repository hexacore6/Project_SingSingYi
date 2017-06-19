package com.hexacore.ssy.song.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hexacore.ssy.mypage.domain.Favorite;
import com.hexacore.ssy.mypage.domain.RecordRepository;
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
	
	@Override
	public void addFavorite(String id, int sid) {
		songDao.addFavorite(id, sid);		
	}
	
	public void removeFavorite(int fid) {
		songDao.removeFavorite(fid);
	}
	
	@Override
	public Favorite checkFavorite(String id, int sid) {
		return songDao.checkFavorite(id, sid);
	}
	
	@Override
	public void updatePlayCnt(int sid) {
		songDao.updatePlayCnt(sid);
	}
	
	@Override
	public Song readSong(int sid) {
		return songDao.readSong(sid);
	}
	
	@Override
	public void uploadRecord(RecordRepository recordRepository) {
		songDao.uploadRecord(recordRepository);
	}
	
	@Override
	public int readRecentRecordId() {
		return songDao.readRecentRecordId();
	}
}
