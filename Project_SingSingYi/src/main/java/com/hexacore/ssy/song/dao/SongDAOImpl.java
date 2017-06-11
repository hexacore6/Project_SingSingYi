package com.hexacore.ssy.song.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hexacore.ssy.song.domain.Song;
@Repository
public class SongDAOImpl implements SongDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.hexacore.ssy.mapper.SongMapper";

	@Override
	public List<Song> randomSong() {
		return sqlSession.selectList(namespace+".randomSong");
	}

	@Override
	public int countSong() {
		return sqlSession.selectOne(namespace+".countSong");
	}
	
	@Override
	public List<Song> bestSongs() {
		return sqlSession.selectList(namespace + ".bestSongs");
	}
	
	@Override
	public List<Song> songsList() {
		return sqlSession.selectList(namespace + ".songsList");
	}

	@Override
	public void addFavorite(String id, int sid) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("sid", sid);
		sqlSession.insert(namespace+".addFavorite", paramMap);
	}
	
	public void removeFavorite(int fid){
		sqlSession.delete(namespace+".removeFavorite", fid);
	}
}








