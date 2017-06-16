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
import com.hexacore.ssy.song.service.SongService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class SongServiceTest {
	
	@Inject
	private SongService service;
	
	Logger logger = Logger.getLogger(SongServiceTest.class);
	
	@Test
	public void checkFavorite(){
		String id = "woong1";
		int sid = 3;
		System.out.println("서비스 체크 : " + service.checkFavorite(id, sid));
	}
	
}
