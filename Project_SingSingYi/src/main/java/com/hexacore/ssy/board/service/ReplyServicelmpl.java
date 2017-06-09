package com.hexacore.ssy.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hexacore.ssy.board.dao.ReplyDAO;
import com.hexacore.ssy.board.domain.Reply;
import com.hexacore.ssy.common.Criteria;




@Service
public class ReplyServicelmpl implements ReplyService {

	@Inject
    private ReplyDAO replyDAO;

	@Override
	public List<Reply> list(int aid) {
		return replyDAO.list(aid);
	}
	

	@Override
	public void regist(Reply reply) {
		replyDAO.create(reply);
	}

	@Override
	public void modify(Reply reply) {
		replyDAO.update(reply);
	}
	
	@Override
	public void remove(int rid) {
		replyDAO.delete(rid);
	}
	
	@Override
	public void boardRemove(int aid) {
		replyDAO.delete(aid);
	}

	@Override
	public List<Reply> listReplyPage(int aid, Criteria cri) {
		return replyDAO.listPage(aid, cri);
	}

	@Override
	public int count(int aid) {
		return replyDAO.count(aid);
	}
	
	
}
