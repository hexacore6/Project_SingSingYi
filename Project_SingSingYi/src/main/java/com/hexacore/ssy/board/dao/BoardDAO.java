package com.hexacore.ssy.board.dao;

import java.util.List;

import com.hexacore.ssy.board.domain.Article;
import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.SearchCriteria;

public interface BoardDAO {

	public void create(Article article);
	
	public Article read(int aid);
	
	public void update(Article article);
	
	public void delete(int aid);
	
	public List<Article> listAll();
	
	/** 선택 페이지에 대한 게시글목록 반환 */
	public List<Article> listPage(int page);
	
	/** listPage 대신 파라미터를 2개받아 게시글목록 반환 **/
	public List<Article> listCriteria(Criteria cri);
	
	public List<Article> listSearch(SearchCriteria cri);
	
	public int listSearchCount(SearchCriteria cri);
	
	public int countPaging(Criteria cri);
	
	/** 조회수 증가 */
	public void updateViewCnt(int aid);

	
	
	
}
