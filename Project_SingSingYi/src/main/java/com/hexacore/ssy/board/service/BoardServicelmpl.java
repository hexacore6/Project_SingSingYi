package com.hexacore.ssy.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.hexacore.ssy.board.dao.BoardDAO;
import com.hexacore.ssy.board.domain.Article;
import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.SearchCriteria;

@Service
public class BoardServicelmpl implements BoardService  {

	@Inject
    private BoardDAO dao;
	
	
	@Override
	public void regist(Article article) {
		dao.create(article);
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public Article read(int aid) {
		dao.updateViewCnt(aid);
		return dao.read(aid);
	}

	@Override
	public void modify(Article article) {
		dao.update(article);
	}
	

	@Override
	public void remove(int aid) {
		dao.delete(aid);
	}

	@Override
	public List<Article> listAll() { 
		return dao.listAll();
	}

	@Override
	public List<Article> listCriteria(Criteria cri) {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) {
		return dao.countPaging(cri);
	}

	@Override
	public List<Article> listSearchCriteria(SearchCriteria cri) {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return dao.listSearchCount(cri);
	}


}
