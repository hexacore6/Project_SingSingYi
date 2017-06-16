package com.hexacore.ssy.member.service;

import com.hexacore.ssy.dto.LoginDTO;
import com.hexacore.ssy.member.domain.Member;

public interface MemberService {
	
	/** 사용자의 아이디와 패스워드 이용하여 사용자 정보 조회 */
	public Member login(LoginDTO dto);
	
	/** 회원가입 */
	public void regist(Member member);
	
	/** 아이디 중복 확인 */
	public boolean confirm(String id);
	
	/** 게임 조건 성공 시 코인 1개 추가 및 내역 추가 */
	public void addGameCoin(String id);
}
