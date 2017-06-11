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
import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.mypage.dao.MypageDAO;
import com.hexacore.ssy.mypage.domain.CoinHistory;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class MyPageDAOTest {
	
	@Inject
	private MypageDAO dao;
	
	Logger logger = Logger.getLogger(MyPageDAOTest.class);
	
	
	// 나의 공유글 조회 테스트
	//@Test
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
	
	// 내 좋아요 개수 총합 조회
	//@Test
	public void readMyLikeCnt(){
		dao.readMyLikeCnt("woong1");
	}
	
	// 내 녹음저장소 조회
	//@Test
	public void readMyRecord(){
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(5);
		String id = "woong1";
		dao.readMyRecord(cri, id);
	}
	
	// 내 회원정보 조회
	//@Test
	public void readMyInformatino(){
		dao.readMyInformation("Woong");
	}
	
	// 내 애창곡 조회 (등록한 노래번호 조회)
	//@Test
	public void readMyFavorite(){
		dao.readMyFavorite("woong1");
	}
	
	// 내 애창곡 조회 (등록한 노래번호 조회) 페이징처리
	//@Test
	public void myFavoriteCriteria(){
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(5);
		String id = "woong";
		logger.info(cri.toString());
		logger.info("크리스타트 : " + cri.getPageStart());
		logger.info("퍼페이지넘"+ cri.getPerPageNum());
		List<HashMap<String, Object>> list = dao.favoriteCriteria(cri, id);
		
			logger.info("애창곡로그 : " + list);
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
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(5);
		String id = "woong1";
		logger.info("녹음번호 2번 삭제 전 : " + dao.readMyRecord(cri, id));
		dao.deleteMyRecord(2);
		logger.info("녹음번호 2번 삭제 후 : " + dao.readMyRecord(cri, id));
	}
	
	// 코인 충전
	//@Test
	public void addCoin(){
		logger.info("코인 3개 충전 전 : " + dao.readMyInformation("woong1"));
		//dao.addCoin(3, "woong1");
		logger.info("코인 3개 충전 후 : " + dao.readMyInformation("woong1"));
	}

	// 회원 정보 수정
	//@Test
	public void updateMyInformation(){
		Member member = new Member();
		member.setPassword("4444");
		logger.info("회원정보 수정 전 :" + dao.readMyInformation("woong"));
		dao.updateMyInformation(member);
		logger.info("회원정보 수정 후 :" + dao.readMyInformation("woong"));
	}
	
	// 나의 공유글 페이징처리 조회 테스트
	//@Test
	public void coinListPage() {
		
		int page = 3;
		String id = "woong";

		List<CoinHistory> list = dao.coinListPage(page, id);
		
		for (CoinHistory coinHistory : list) {
			logger.info("로그 :" + coinHistory.getChid() + ":" + coinHistory.getChcontent());
		}
	}
	
	// 나의 공유글 페이징처리2 조회 테스트
	//@Test
	public void testcoinListCriteria() {
		
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(5);
		String id = "woong1";
		logger.info(cri.toString());
		logger.info("크리스타트 : " + cri.getPageStart());
		logger.info("퍼페이지넘"+ cri.getPerPageNum());
		List<CoinHistory> list = dao.coinListCriteria(cri, id);
		
		for (CoinHistory coinHistory : list) {
			logger.info("코인로그 : "+ coinHistory.getChid() + ":" + coinHistory.getChcontent());
		}
	}
	
	//@Test
	public void testCount(){
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(5);
		String id = "woong1";
		dao.countCoinPaging(cri, id);
	}
	
	@Test
	public void testAddCoinList(){
		CoinHistory coinHistory = new CoinHistory();
		coinHistory.setId("kosta111");
		coinHistory.setChtype("충전");
		coinHistory.setChcontent("3개 충전");
		System.out.println("코인히스토리 : " + coinHistory);
		
		dao.coinListAdd(coinHistory);
	}
}
