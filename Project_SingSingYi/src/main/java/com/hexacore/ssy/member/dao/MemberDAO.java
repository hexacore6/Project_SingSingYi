package com.hexacore.ssy.member.dao;

import com.hexacore.ssy.dto.LoginDTO;
import com.hexacore.ssy.member.domain.Member;

public interface MemberDAO {
	
	/** 로그인할 때 사용자의 아이디와 패스워드 이용하여 사용자 정보 조회 */
	public Member login(LoginDTO dto);
	
	/** 회원가입 */
	public void regist(Member member);
	
	/** 비밀번호 찾기 */
	public String searchPw(Member member);
	
	/** 비밀번호 재설정 */
	public void resetPw(Member member);
	
	/** 아이디 중복 확인 */
	public String confirm(String id);
	
	/** 게임 조건 성공 시 코인 1개 추가 */
	public void addGameCoin(String id);
	
	/** 게임 성공 후 코인 1개 추가  내역 등록 */
	public void coinListAdd(String id);
	
}
