package com.hexacore.ssy;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hexacore.ssy.dto.LoginDTO;
import com.hexacore.ssy.member.dao.MemberDAO;
import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.member.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MemberServiceTest {
	
	@Inject
	private MemberService service;
	
	Logger logger = Logger.getLogger(MemberServiceTest.class);
	
	/** 로그인 테스트 */
	@Test
	public void loginTest() {
		LoginDTO loginDTO = new LoginDTO();
		loginDTO.setId("asdf");
		loginDTO.setPassword("1234");
		
		logger.info(service.login(loginDTO));
	}
	
	/** 회원가입 테스트 */
//	@Test
	public void registTest() {
		Member member = new Member();
		member.setId("kosta");
		member.setPassword(1111);
		member.setPwquestion("보물1호는?");
		member.setPwanswer("뭘까");
		
		service.regist(member);
	}
	
}
