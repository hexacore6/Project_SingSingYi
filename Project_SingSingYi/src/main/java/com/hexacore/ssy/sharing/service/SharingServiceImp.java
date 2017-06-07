package com.hexacore.ssy.sharing.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.hexacore.ssy.sharing.dao.SharingDao;
import com.hexacore.ssy.sharing.domain.Comment;
import com.hexacore.ssy.sharing.domain.LikeHistory;
import com.hexacore.ssy.sharing.domain.Sharing;

@Service
public class SharingServiceImp implements SharingService {
	
	@Inject
	private SharingDao sharingDao;

	@Override
	public List<Sharing> listAll() {
		return sharingDao.listAll();
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
	public void remove(int shid) {
		sharingDao.delete(shid);
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
	

}
