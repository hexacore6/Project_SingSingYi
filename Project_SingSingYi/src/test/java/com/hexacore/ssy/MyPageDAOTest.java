package com.hexacore.ssy;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hexacore.ssy.mypage.dao.MypageDAO;
import com.hexacore.ssy.mypage.domain.Favorite;
import com.hexacore.ssy.mypage.domain.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class MyPageDAOTest {
	
	@Inject
	private MypageDAO dao;
	
	Logger logger = Logger.getLogger(MyPageDAOTest.class);
	
	
	// 나의 공유글 조회 테스트
	@Test
	public void readMySharingTest() {
		logger.info(dao.readMySharing("woong"));
	}
	
	// 나의 코인변경내역 조회 테스트
	//@Test
	public void readCoinTest(){
		dao.readCoinHistory("woong");
	}
	
	// Top5 랭킹 조회
	//@Test
	public void readTopRankTest(){
		dao.readTopRank();		
	}
	
	// 내 랭킹 조회
	//@Test
	public void readMyRankTest(){
		dao.readMyRank("woong");
	}
	
	// 내 랭킹기준 조회
	//@Test
	public void readMyRankArea(){
		dao.readMyRankArea(10);
	}
	
	// 내 녹음저장소 조회
	//@Test
	public void readMyRecord(){
		dao.readMyRecord("woong");
	}
	
	// 내 회원정보 조회
	//@Test
	public void readMyInformatino(){
		dao.readMyInformation("Woong");
	}
	
	// 내 애창곡 조회 (등록한 노래번호 조회)
	@Test
	public void readMyFavorite(){
		dao.readMyFavorite("woong1");
	}
	
	// 내 애창곡 삭제
	//@Test
	public void deleteMyFavorite(){
		logger.info("애창곡 2번 삭제 전 : " + dao.readMyFavorite("woong1"));
		dao.deleteMyFavorite(2);
		logger.info("애창곡 2번 삭제 후 : " + dao.readMyFavorite("woong1"));
	}
	
	// 내 녹음저장소 삭제
	//@Test
	public void deleteMyRecord(){
		logger.info("녹음번호 2번 삭제 전 : " + dao.readMyRecord("woong1"));
		dao.deleteMyRecord(2);
		logger.info("녹음번호 2번 삭제 후 : " + dao.readMyRecord("woong1"));
	}
	
	// 코인 충전
	//@Test
	public void addCoin(){
		logger.info("코인 3개 충전 전 : " + dao.readMyInformation("woong1"));
		dao.addCoin(3, "woong1");
		logger.info("코인 3개 충전 후 : " + dao.readMyInformation("woong1"));
	}
	
	//@Test
	public void updateMyInformation(){
		Member member = new Member();
		member.setPassword(4444);
		logger.info("회원정보 수정 전 :" + dao.readMyInformation("woong"));
		dao.updateMyInformation(member);
		logger.info("회원정보 수정 후 :" + dao.readMyInformation("woong"));
	}
}
