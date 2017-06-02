package com.hexacore.ssy.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hexacore.ssy.board.domain.Article;
import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.SearchCriteria;
@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.hexacore.ssy.mapper.BoardMapper";

	@Override
	public void create(Article article) {
		sqlSession.insert(namespace+".create", article);
	}

	@Override
	public Article read(int aid) {
		return sqlSession.selectOne(namespace+".read", aid);
	}

	@Override
	public void update(Article article) {
		sqlSession.update(namespace +".update", article);
	}

	@Override
	public void delete(int aid) {
		sqlSession.delete(namespace+".delete", aid);
	}

	@Override
	public List<Article> listAll() {
		return sqlSession.selectList(namespace+".listAll");
	}

	@Override
	public List<Article> listPage(int page) {
		
		if(page <= 0){
			page =1;
		}
		
		page = (page - 1)*10;
		return sqlSession.selectList(namespace+".listPage", page);
	}

	@Override
	public List<Article> listCriteria(Criteria cri) {
		System.out.println("서비스 요청...");
		return sqlSession.selectList(namespace+".listCriteria", cri);
	}

	@Override
	public List<Article> listSearch(SearchCriteria cri) {
		return sqlSession.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return sqlSession.selectOne(namespace+".listSearchCount", cri);
	}

	@Override
	public int countPaging(Criteria cri) {
		return sqlSession.selectOne(namespace+".countPaging", cri);
	}

	@Override
	public void updateViewCnt(int aid) {
		sqlSession.update(namespace+".updateViewCnt", aid);
	}
	
	



	
}








