package com.hexacore.ssy.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hexacore.ssy.board.domain.Reply;
import com.hexacore.ssy.common.Criteria;


@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.hexacore.ssy.mapper.ReplyMapper";
	
	@Override
	public List<Reply> list(int aid) {
		return sqlSession.selectList(namespace+".list", aid);
	}
	
	@Override
	public void create(Reply reply) {
		sqlSession.insert(namespace+".create", reply);
	}
	@Override
	public void update(Reply reply) {
		sqlSession.update(namespace+".update", reply);
	}
	@Override
	public void delete(int rid) {
		sqlSession.delete(namespace+".delete", rid);
	}
	
	@Override
	public void boardDelete(int aid) {
		sqlSession.delete(namespace+".boardDelete", aid);
	}
	
	@Override
	public List<Reply> listPage(int aid, Criteria cri) {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("aid", aid);
		paramMap.put("cri", cri);
		return sqlSession.selectList(namespace+".listPage", paramMap);
	}
	
	@Override
	public int count(int aid) {
		
		return sqlSession.selectOne(namespace+".count", aid);
	}
	@Override
	public int getAid(int rid) {
		return sqlSession.selectOne(namespace+".getAid", rid);
	}


}








