package com.hexacore.ssy.mypage.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hexacore.ssy.mypage.dao.MypageDAO;
import com.hexacore.ssy.mypage.domain.CoinHistory;
import com.hexacore.ssy.mypage.domain.Favorite;
import com.hexacore.ssy.mypage.domain.Member;
import com.hexacore.ssy.mypage.domain.RecordRepository;
import com.hexacore.ssy.mypage.domain.Sharing;
import com.hexacore.ssy.mypage.domain.Song;

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
	public CoinHistory readCoinHistory(String id) {
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

	// 내 녹음 저장소 조회
	@Override
	public List<RecordRepository> readMyRecord(String id) {
		return dao.readMyRecord(id);
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
	public void addCoin(int addCoin, String id) {
		dao.addCoin(addCoin, id);
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



}
