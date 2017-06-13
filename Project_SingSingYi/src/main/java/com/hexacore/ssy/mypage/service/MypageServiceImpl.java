package com.hexacore.ssy.mypage.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.mypage.dao.MypageDAO;
import com.hexacore.ssy.mypage.domain.CoinHistory;
import com.hexacore.ssy.mypage.domain.RecordRepository;
import com.hexacore.ssy.mypage.domain.Song;
import com.hexacore.ssy.sharing.domain.Sharing;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Inject
	private MypageDAO dao;
	
	// 나의 공유글 목록 조회
	@Override
	public List<Sharing> readMySharing(String id) {
		return dao.readMySharing(id);
	}
	
	// 나의 공유글 삭제
	@Override
	public void deleteMySharing(int shid) {
		dao.deleteMySharing(shid);
	}
	
	// 나의 코인변경내역 조회
	@Override
	public List<CoinHistory> readCoinHistory(String id) {
		return dao.readCoinHistory(id);
	}
	
	// Top5 랭킹 조회
	@Override
	public List<Member> readTopRank() {
		return dao.readTopRank();
	}
	
	// 내 랭킹 조회
	@Override
	public Member readMyRank(String id) {
		return dao.readMyRank(id);
	}
	
	// 내 랭킹주변 순위 조회
	@Override
	public List<Member> readMyRankArea(int rank) {
		return dao.readMyRankArea(rank);
	}
	
	// 내 좋아요 총합 개수 조회
	@Override
	public List<Sharing> readMyLikeCnt(String id) {
		return dao.readMyLikeCnt(id);
	}
	
	// 내 녹음 저장소 조회
	@Override
	public List<RecordRepository> readMyRecord(Criteria cri, String id) {
		return dao.readMyRecord(cri, id);
	}
	
	// 내 정보 조회 (코인 개수 조회)
	@Override
	public Member readMyInformation(String id) {
		return dao.readMyInformation(id);
	}
	
	// 내 애창곡 조회 (등록한 노래번호 조회)
	@Override
	public List<HashMap<String, Object>> readMyFavorite(String id) {
		return dao.readMyFavorite(id);
	}
	
	@Override
	public List<HashMap<String, Object>> favoriteCriteria(Criteria cri, String id) {
		return dao.favoriteCriteria(cri, id);
	}
	
	// 내 애창곡 삭제
	@Override
	public void deleteMyFavorite(int fid) {
		dao.deleteMyFavorite(fid);
	}
	
	// 내 녹음 저장소 삭제
	@Override
	public void deleteMyRecord(int rrid) {
		dao.deleteMyRecord(rrid);
	}
	
	// 코인 충전
	@Override
	public void addCoin(Member member, String id) {
		dao.addCoin(member, id);
	}
	
	// 해당 노래번호인 노래 조회
	@Override
	public Song selectSong(int sid) {
		return dao.selectSong(sid);
	}

	// 내 정보 수정 (비밀번호 수정)
	@Override
	public void updateMyInformation(Member member) {
		dao.updateMyInformation(member);
	}
	
	// 나의 코인변경내역 조회 페이징 처리
	@Override
	public List<CoinHistory> coninListCriteria(Criteria cri, String id) {
		return dao.coinListCriteria(cri, id);
	}
	
	// 코인 내역 테이블 행의 수 계산
	@Override
	public int countCoinPaging(Criteria cri, String id) {
		return dao.countCoinPaging(cri, id);
	}
	
	// 코인 충전 내역 추가
	@Override
	public void coinListAdd(CoinHistory coinHistory) {
		dao.coinListAdd(coinHistory);
	}
	
	// 애창곡 내역 테이블 행의 수 계산
	@Override
	public int countFavoritePaging(Criteria cri, String id) {
		// TODO Auto-generated method stub
		return dao.countFavoritePaging(cri, id);
	}
	
	// 녹음저장소 내역 테이블 행의 수 계산
	@Override
	public int countRecordPaging(Criteria cri, String id) {
		// TODO Auto-generated method stub
		return dao.countRecordPaging(cri, id);
	}


}
