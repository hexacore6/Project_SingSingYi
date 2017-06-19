package com.hexacore.ssy.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hexacore.ssy.dto.LoginDTO;
import com.hexacore.ssy.member.domain.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.hexacore.ssy.mapper.MemberMapper";
	
	@Override
	public Member login(LoginDTO dto) {
		return sqlSession.selectOne(namespace + ".login", dto);
	}
	
	@Override
	public void regist(Member member) {
		sqlSession.insert(namespace + ".regist", member);
	}
	
	@Override
	public String searchPw(Member member) {
		return sqlSession.selectOne(namespace + ".searchPw", member);
	}
	
	@Override
	public void resetPw(Member member) {
		sqlSession.update(namespace + ".resetPw", member);
	}
	
	@Override
	public String confirm(String id) {
		return sqlSession.selectOne(namespace + ".confirm", id);
	}

	@Override
	public void addGameCoin(String id) {
		sqlSession.update(namespace +".addGameCoin", id);
	}

	@Override
	public void coinListAdd(String id) {
		sqlSession.insert(namespace +".coinListAdd", id);
	}

	
}