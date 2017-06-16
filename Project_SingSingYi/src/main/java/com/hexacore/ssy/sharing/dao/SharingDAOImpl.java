package com.hexacore.ssy.sharing.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hexacore.ssy.sharing.domain.Comment;
import com.hexacore.ssy.sharing.domain.LikeHistory;
import com.hexacore.ssy.sharing.domain.RecordRepository;
import com.hexacore.ssy.sharing.domain.Sharing;


@Repository
public class SharingDAOImpl implements SharingDAO {

	private String namespace = "com.hexacore.ssy.mapper.SharingMapper";

	@Inject
	private SqlSession session;

	@Override
	public List<Sharing> listAll(String id) {
		return session.selectList(namespace + ".listAll", id);
	}

	@Override
	public List<Comment> listComment(int shid) {
		return session.selectList(namespace + ".listComment", shid);
	}

	@Override
	public void create(Sharing sharing) throws Exception {
		session.insert(namespace + ".create", sharing);
		
	}

	@Override
	public void comment(Comment comment) {
		session.insert(namespace + ".comment", comment);
	}
	

	@Override
	public Comment getComment(Comment comment) {
		return session.selectOne(namespace + ".getComment", comment);
		
	}

	@Override
	public Sharing read(int shid) {
		return session.selectOne(namespace + ".read", shid);
	}

	@Override
	public void update(Sharing sharing) {
		session.update(namespace + ".update", sharing);
		
	}
	

	@Override
	public void updateImg(Sharing sharing) {
		session.update(namespace + ".update", sharing);
		
	}

	@Override
	public void deleteSharing(int shid) {
		session.delete(namespace + ".deleteSharing", shid);
	}
	
	@Override
	public void deleteComment(int shid) {
		session.delete(namespace + ".deleteComment", shid);
	}

	@Override
	public void updateCommentCnt(int shid) {
		session.update(namespace + ".updateCommentCnt", shid);
		
	}

	@Override
	public void updateLikeCnt(int shid) {
		session.update(namespace + ".updateLikeCnt", shid);
		
	}
	
	@Override
	public int getLikeCnt(int shid) {
		return session.selectOne(namespace + ".getLikeCnt", shid);
	}

	@Override
	public void fallLikeCnt(int shid) {
		session.update(namespace + ".fallLikeCnt", shid);
		
	}

	@Override
	public void deleteLikeHistory(LikeHistory likeHistory) {
		session.delete(namespace + ".deleteLikeHistory", likeHistory);
		
	}

	@Override
	public void likeHistory(LikeHistory likeHistory) {
		session.insert(namespace + ".likeHistory", likeHistory);
	}
	

	@Override
	public LikeHistory checkLike(LikeHistory likeHistory) {
		return session.selectOne(namespace + ".checkLike", likeHistory);
	}

	@Override
	public void addAttach(String eximgfilename) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getShid() {
		return session.selectOne(namespace + ".getShid");
	}

	@Override
	public List<Sharing> searchById(String id){
		return session.selectList(namespace + ".searchById", id);
	}
	
	@Override
	public List<Sharing> searchByTitle(String recordfilename) {
		return session.selectList(namespace + ".searchByTitle", recordfilename);
	}

	@Override
	public List<Sharing> searchByContent(String shcontent) {
		return session.selectList(namespace + ".searchByContent", shcontent);
	}

	@Override
	public String getRecordFileName(int shid) {
		String name = session.selectOne(namespace + ".getRecordFileName", shid);
		String[] array = name.split("@");
		return array[2];
	}

	@Override
	public List<RecordRepository> getRecord(String id) {
		return session.selectList(namespace + ".getRecord", id);
	}

	

	

	
	
}
