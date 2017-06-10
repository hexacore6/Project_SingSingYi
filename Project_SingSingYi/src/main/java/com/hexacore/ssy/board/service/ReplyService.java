package com.hexacore.ssy.board.service;

import java.util.List;

import com.hexacore.ssy.board.domain.Reply;
import com.hexacore.ssy.common.Criteria;


public interface ReplyService {
	
	public List<Reply> list(int aid);
	
	public void regist(Reply reply);
	
	public void modify(Reply reply);
	
	public void remove(int rid);
	
	public void boardRemove(int aid);
	
	public List<Reply> listReplyPage(int aid, Criteria cri);
	
	public int count(int aid);
	
	
	
}
