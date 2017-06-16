package com.hexacore.ssy.sharing.service;

import java.util.List;

import com.hexacore.ssy.sharing.domain.Comment;
import com.hexacore.ssy.sharing.domain.LikeHistory;
import com.hexacore.ssy.sharing.domain.RecordRepository;
import com.hexacore.ssy.sharing.domain.Sharing;



public interface SharingService {
	public List<Sharing> listAll(String id);
	public List<Comment> listComment(int shid);
	public void regist(Sharing sharing) throws Exception;
	public void registComment(Comment comment);
	public Comment getComment(Comment comment);
	public Sharing read(int shid);
	public void modify(Sharing sharing);
	public void removeSharing(int shid);
	public void removeComment(int shid);
	public void removeAllLikeHistory(int shid);
	public void likeHistory(LikeHistory likeHistory);
	public LikeHistory checkLike(LikeHistory likeHistory);
	public void updateCommentCnt(int shid);
	public void updateLikeCnt(int shid);
	public int getLikeCnt(int shid);
	public void fallLikeCnt(int shid);
	public void deleteLikeHistory(LikeHistory likeHistory);
	public int getShid();
	public List<Sharing> searchById(String id);
	public List<Sharing> searchByTitle(String recordfilename);
	public List<Sharing> searchByContent(String shcontent);
	public String getRecordFileName(int shid);
	public List<RecordRepository> getRecord(String id);
}
