package com.hexacore.ssy.sharing.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hexacore.ssy.sharing.dao.SharingDAO;
import com.hexacore.ssy.sharing.domain.Comment;
import com.hexacore.ssy.sharing.domain.LikeHistory;
import com.hexacore.ssy.sharing.domain.RecordRepository;
import com.hexacore.ssy.sharing.domain.Sharing;

@Service
public class SharingServiceImpl implements SharingService {
	
	@Inject
	private SharingDAO sharingDao;

	@Override
	public List<Sharing> listAll(String id) {
		return sharingDao.listAll(id);
	}

	@Override
	public List<Comment> listComment(int shid) {
		return sharingDao.listComment(shid);
	}

	//@Transactional
	@Override
	public void regist(Sharing sharing) throws Exception {
		sharingDao.create(sharing);
	}
	
	

	@Override
	public void registComment(Comment comment) {
		sharingDao.comment(comment);
	}
	
	@Override
	public Comment getComment(Comment comment) {
		return sharingDao.getComment(comment);
	}

	@Override
	public Sharing read(int shid) {
		return sharingDao.read(shid);
	}

	@Override
	public void modify(Sharing sharing) {
		sharingDao.update(sharing);
	}

	@Override
	public void removeSharing(int shid) {
		sharingDao.deleteSharing(shid);
	}
	
	@Override
	public void removeComment(int shid) {
		sharingDao.deleteComment(shid);
	}

	@Override
	public void updateCommentCnt(int shid) {
		sharingDao.updateCommentCnt(shid);
	}

	@Override
	public void updateLikeCnt(int shid) {
		sharingDao.updateLikeCnt(shid);
	}

	@Override
	public void fallLikeCnt(int shid) {
		sharingDao.fallLikeCnt(shid);
	}

	@Override
	public void deleteLikeHistory(int shid) {
		sharingDao.deleteLikeHistory(shid);
	}

	@Override
	public void likeHistory(Sharing sharing) {
		sharingDao.likeHistory(sharing);
	}

	@Override
	public LikeHistory checkLike(int shid) {
		return sharingDao.checkLike(shid);
	}

	@Override
	public int getShid() {
		return sharingDao.getShid();
	}

	@Override
	public List<Sharing> searchById(String id) {
		return sharingDao.searchById(id);
	}

	@Override
	public String getRecordFileName(int shid) {
		return sharingDao.getRecordFileName(shid);
	}

	@Override
	public List<Sharing> searchByTitle(String recordfilename) {
		return sharingDao.searchByTitle(recordfilename);
	}

	@Override
	public List<Sharing> searchByContent(String shcontent) {
		return sharingDao.searchByContent(shcontent);
	}

	@Override
	public List<RecordRepository> getRecord(String id) {
		return sharingDao.getRecord(id);
	}
	

}
