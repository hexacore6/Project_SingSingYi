package com.hexacore.ssy.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hexacore.ssy.dto.LoginDTO;
import com.hexacore.ssy.member.dao.MemberDAO;
import com.hexacore.ssy.member.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDao;
	
	@Override
	public Member login(LoginDTO dto) {
		return memberDao.login(dto);
	}
	
	@Override
	public void regist(Member member) {
		memberDao.regist(member);
	}

}
