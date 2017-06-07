package com.hexacore.ssy.member.dao;

import com.hexacore.ssy.dto.LoginDTO;
import com.hexacore.ssy.member.domain.Member;

public interface MemberDAO {
	
	/** 로그인할 때 사용자의 아이디와 패스워드 이용하여 사용자 정보 조회 */
	public Member login(LoginDTO dto);
	
	/** 회원가입 */
	public void regist(Member member);
	
}
