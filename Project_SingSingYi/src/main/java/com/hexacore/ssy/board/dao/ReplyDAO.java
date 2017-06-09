package com.hexacore.ssy.board.dao;

import java.util.List;

import com.hexacore.ssy.board.domain.Reply;
import com.hexacore.ssy.common.Criteria;


public interface ReplyDAO {

	public List<Reply> list(int aid);
	
	public void create(Reply reply);
	
	public void update(Reply reply);
	
	public void delete(int rno);
	
	public void boardDelete(int aid);
	
	public List<Reply> listPage(int aid, Criteria cri);
	
	public int count(int aid);
	
	public int getAid(int rid);
	
}
