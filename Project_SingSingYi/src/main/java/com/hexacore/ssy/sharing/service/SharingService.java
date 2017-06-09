package com.hexacore.ssy.sharing.service;

import java.util.List;

import com.hexacore.ssy.sharing.domain.Comment;
import com.hexacore.ssy.sharing.domain.LikeHistory;
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
	public void likeHistory(Sharing sharing);
	public LikeHistory checkLike(int shid);
	public void updateCommentCnt(int shid);
	public void updateLikeCnt(int shid);
	public void fallLikeCnt(int shid);
	public void deleteLikeHistory(int shid);
	public int getShid();
}
