package com.hexacore.ssy;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.mypage.domain.CoinHistory;
import com.hexacore.ssy.mypage.domain.Song;
import com.hexacore.ssy.mypage.service.MypageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class MyPageServiceTest {
	
	Logger logger = Logger.getLogger(MyPageServiceTest.class);
	
	@Inject
	private MypageService service;
	
	// 나의 공유글 조회 테스트
	//@Test
	public void readMySharingTest() {
		service.readMySharing("woong");
	}
	
	// 나의 코인변경내역 조회 테스트
	//@Test
	public void readCoinTest(){
		service.readCoinHistory("woong");
	}
	
	// Top5 랭킹 조회
	//@Test
	public void readTopRankTest(){
		service.readTopRank();		
	}
	
	// 내 랭킹 조회
	//@Test
	public void readMyRankTest(){
		service.readMyRank("woong");
	}
	
	// 내 랭킹기준 조회
	//@Test
	public void readMyRankArea(){
		service.readMyRankArea(10);
	}
	
	// 내 녹음저장소 조회
	//@Test
	public void readMyRecord(){
		//service.readMyRecord("woong");
	}
	
	// 내 회원정보 조회
	//@Test
	public void readMyInformation(){
		service.readMyInformation("Woong");
	}	
	
	
	
	// 내 애창곡 조회 (등록한 노래번호 조회)
	//@Test
	public List<HashMap<String, Object>> readMyFavorite(){
		return service.readMyFavorite("woong");
	}
	
	// 내 애창곡 삭제
	//@Test
	public void deleteMyFavorite(){
		service.deleteMyFavorite(1);
	}
	
	// 내 녹음 저장소 삭제
	//@Test
	public void deleteMyRecord(){
		service.deleteMyRecord(1);
	}
	
	// 코인 충전
	//@Test
	public void addCoin(){
		//service.addCoin(3, "woong1");
	}
	// 해당 노래번호인 노래 조회
	//@Test
	public Song selectSong(){
		return service.selectSong(1);
	}
	
	@Test
	public void criList(){
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(5);
		String id = "woong1";
		service.coninListCriteria(cri, id);
	}
}
