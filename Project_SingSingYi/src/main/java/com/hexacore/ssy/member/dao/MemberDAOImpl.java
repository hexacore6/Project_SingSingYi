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
//		return sqlSession.insert(namespace + ".regist", member);
	}
	
}