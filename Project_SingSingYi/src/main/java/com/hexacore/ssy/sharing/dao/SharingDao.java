package com.hexacore.ssy.sharing.dao;

import java.util.Date;
import java.util.List;

import com.hexacore.ssy.sharing.domain.Sharing;


public interface SharingDao {
	public List<Sharing> listAll();
	public void create(Sharing sharing) throws Exception;
	public int getShid();
	public Sharing read(int shid);
	public void update(Sharing shid);
	public void delete(int shid);
	public void updateCommentCnt(int shid);
	public void updateLikeCnt(int shid);
	public void addAttach(String eximgfilename);
}
