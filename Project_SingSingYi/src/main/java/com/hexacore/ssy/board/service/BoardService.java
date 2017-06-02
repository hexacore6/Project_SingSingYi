package com.hexacore.ssy.board.service;

import java.util.List;

import com.hexacore.ssy.board.domain.Article;
import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.SearchCriteria;

public interface BoardService {
	
	public void regist(Article article);
	
	public Article read(int aid);
	
	public void modify(Article article);
	
	public void remove(int aid);
	
	public List<Article> listAll();
	
	public List<Article> listCriteria(Criteria cri);
	
	public int listCountCriteria(Criteria cri);
	
	public List<Article> listSearchCriteria(SearchCriteria cri);
	
	public int listSearchCount(SearchCriteria cri);
	

	
}
