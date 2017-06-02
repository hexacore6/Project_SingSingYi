package com.hexacore.ssy.sharing.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hexacore.ssy.sharing.domain.Sharing;


@Repository
public class SharingDaoImp implements SharingDao {

	private String namespace = "com.hexacore.ssy.mapper.SharingMapper";

	@Inject
	private SqlSession session;

	@Override
	public List<Sharing> listAll() {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public void create(Sharing sharing) throws Exception {
		session.insert(namespace + ".create", sharing);
		
	}

	@Override
	public Sharing read(int shid) {
		return session.selectOne(namespace + ".read", shid);
	}

	@Override
	public void update(Sharing shid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int shid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCommentCnt(int shid) {
		session.update(namespace + ".updateLikeCnt", shid);
		
	}

	@Override
	public void updateLikeCnt(int shid) {
		session.update(namespace + ".updateLikeCnt", shid);
		
	}

	@Override
	public void addAttach(String eximgfilename) {
		// TODO Auto-generated method stub
		
	}

	
	
}
