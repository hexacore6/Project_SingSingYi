package com.hexacore.ssy.mypage.dao;

import java.util.HashMap;
import java.util.List;

import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.mypage.domain.CoinHistory;
import com.hexacore.ssy.mypage.domain.Member;
import com.hexacore.ssy.mypage.domain.RecordRepository;
import com.hexacore.ssy.mypage.domain.Sharing;
import com.hexacore.ssy.mypage.domain.Song;

public interface MypageDAO {
	
	// 나의 공유글 목록 조회
	public List<Sharing> readMySharing(String id);
	
	// 나의 공유글 삭제
	public void deleteMySharing(int shid);
	
	// 나의 코인변경내역 조회
	public List<CoinHistory> readCoinHistory(String id);
	
	// Top5 랭킹 조회
	public List<Member> readTopRank();
	
	// 내 랭킹 조회
	public Member readMyRank(String id);
	
	// 내 좋아요 총합 개수 조회
	public List<Sharing> readMyLikeCnt(String id);
	
	// 내 랭킹주변 순위 조회
	public List<Member> readMyRankArea(int rank);
	
	// 내 애창곡 조회 (등록한 노래번호 조회)
	public List<HashMap<String, Object>> readMyFavorite(String id);
	
	// 내 애창곡 조회 (등록한 노래번호 조회) 페이징 처리
	public List<HashMap<String, Object>> favoriteCriteria(Criteria cri, String id);
	
	// 내 애창곡 삭제
	public void deleteMyFavorite(int fid);
	
	// 내 녹음 저장소 조회
	public List<RecordRepository> readMyRecord(Criteria cri, String id);
	
	// 내 녹음 저장소 삭제
	public void deleteMyRecord(int rrid);
	
	// 내 정보 조회 (코인 개수 조회)
	public Member readMyInformation(String id);
	
	// 내 정보 수정 (비밀번호 수정)
	public void updateMyInformation(Member member);
	
	// 코인 충전
	public void addCoin(Member member, String id);
	
	// 해당 노래번호인 노래 조회
	public Song selectSong(int sid); 
	
	// 코인 내역 조회 페이징 처리
	public List<CoinHistory> coinListPage(int page, String id);
	
	// 코인 내역 조회 페이징 처리 2
	public List<CoinHistory> coinListCriteria(Criteria cri, String id);
	
	// 코인 내역 테이블 행의 수 계산
	public int countCoinPaging(Criteria cri, String id);
	
	// 애창곡 테이블 행의 수 계산
	public int countFavoritePaging(Criteria cri, String id);
		
	// 녹음저장소 테이블 행의 수 계산
	public int countRecordPaging(Criteria cri, String id);
}
