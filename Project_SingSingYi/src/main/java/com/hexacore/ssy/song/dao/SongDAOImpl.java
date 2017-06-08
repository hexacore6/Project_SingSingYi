package com.hexacore.ssy.song.dao;


import java.util.List;


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

	
}








