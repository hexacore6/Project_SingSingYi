package com.hexacore.ssy.sharing.service;

import java.util.Date;
import java.util.List;

import com.hexacore.ssy.sharing.domain.Sharing;



public interface SharingService {
	public List<Sharing> listAll();
	public void regist(Sharing sharing) throws Exception;
	public Sharing read(int shid);
	public void modify(Sharing sharing);
	public void remove(int shid);
	public void updateCommentCnt(int shid);
	public void updateLikeCnt(int shid);
	public int getShid();
}
