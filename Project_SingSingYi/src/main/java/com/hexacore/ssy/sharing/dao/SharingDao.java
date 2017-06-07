package com.hexacore.ssy.sharing.dao;

import java.util.Date;
import java.util.List;

import com.hexacore.ssy.sharing.domain.Comment;
import com.hexacore.ssy.sharing.domain.LikeHistory;
import com.hexacore.ssy.sharing.domain.Sharing;


public interface SharingDao {
	public List<Sharing> listAll();
	public List<Comment> listComment(int shid);
	public void create(Sharing sharing) throws Exception;
	public void comment(Comment comment);
	public Comment getComment(Comment comment);
	public int getShid();
	public void likeHistory(Sharing sharing);
	public LikeHistory checkLike(int shid);
	public Sharing read(int shid);
	public void update(Sharing sharing);
	public void updateImg(Sharing sharing);
	public void delete(int shid);
	public void updateCommentCnt(int shid);
	public void updateLikeCnt(int shid);
	public void addAttach(String eximgfilename);
}
