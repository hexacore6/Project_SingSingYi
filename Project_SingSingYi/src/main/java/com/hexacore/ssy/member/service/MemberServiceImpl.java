package com.hexacore.ssy.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Override
	public String searchPw(Member member) {
		return memberDao.searchPw(member);
	}
	
	@Override
	public void resetPw(Member member) {
		memberDao.resetPw(member);
	}
	
	@Override
	public boolean confirm(String id) {
		if(memberDao.confirm(id) == null) {
			return false;
		}
		return true;
	}
	
	@Transactional
	@Override
	public void addGameCoin(String id) {
		memberDao.addGameCoin(id);  //코인 1개 추가
		memberDao.coinListAdd(id);//코인 추가내역 추가
	}

}
