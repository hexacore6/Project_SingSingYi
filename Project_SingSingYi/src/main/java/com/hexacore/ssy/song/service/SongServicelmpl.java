package com.hexacore.ssy.song.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hexacore.ssy.mypage.domain.Favorite;
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
	
	/** 애창곡 추가 */
	@Override
	public void addFavorite(String id, int sid) {
		songDao.addFavorite(id, sid);		
	}
	
	/** 애창곡 삭제 */
	public void removeFavorite(int fid) {
		songDao.removeFavorite(fid);
	}
	
	/** 애창곡 중복 체크 */
	@Override
	public Favorite checkFavorite(String id, int sid) {
		return songDao.checkFavorite(id, sid);
	}
}
