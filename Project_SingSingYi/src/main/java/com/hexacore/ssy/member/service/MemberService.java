package com.hexacore.ssy.member.service;

import com.hexacore.ssy.dto.LoginDTO;
import com.hexacore.ssy.member.domain.Member;

public interface MemberService {
	
	public Member login(LoginDTO dto);
	
}
