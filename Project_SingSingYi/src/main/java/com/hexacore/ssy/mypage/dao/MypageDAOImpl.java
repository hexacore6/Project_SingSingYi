package com.hexacore.ssy.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.mypage.domain.CoinHistory;
import com.hexacore.ssy.mypage.domain.RecordRepository;
import com.hexacore.ssy.mypage.domain.Song;
import com.hexacore.ssy.sharing.domain.Sharing;

@Repository
public class MypageDAOImpl implements MypageDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.hexacore.ssy.mapper.MyPageMapper";
	
	// 나의 공유글 목록 조회
	@Override
	public List<Sharing> readMySharing(String id) {
			return session.selectList(namespace+".readMySharing", id);
	}
	
	// 나의 공유글 삭제
	@Override
	public void deleteMySharing(int shid) {
		session.delete(namespace+".deleteMySharing", shid);
	}
	
	// 나의 코인변경내역 조회
	@Override
	public List<CoinHistory> readCoinHistory(String id) {
		return session.selectList(namespace+".readCoinHistory", id);
	}
	
	// Top5 랭킹 조회
	@Override
	public List<Member> readTopRank() {
		return session.selectList(namespace+".readTopRank");
	}
	
	// 내 랭킹 조회
	@Override
	public Member readMyRank(String id) {
		return session.selectOne(namespace+".readMyRank", id);
	}
	
	// 내 랭킹주변 순위 조회
	@Override
	public List<Member> readMyRankArea(int rank) {
		return session.selectList(namespace+".readMyRankArea", rank);
	}
	
	// 내 좋아요 개수 총합 조회
	@Override
	public List<Sharing> readMyLikeCnt(String id) {
		return session.selectOne(namespace+".readMyLikeCnt", id);
	}
	
	
	// 내 녹음 저장소 조회
	@Override
	public List<RecordRepository> readMyRecord(Criteria cri, String id) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("pageStart", cri.getPageStart());
		paramMap.put("perPageNum", cri.getPerPageNum());
		paramMap.put("id", id);		
		
		return session.selectList(namespace+".readMyRecord", paramMap);
	}
	
	// 내 정보 조회 (코인 개수 조회)
	@Override
	public Member readMyInformation(String id) {
		return session.selectOne(namespace+".readMyInformation", id);
	}
	
	// 내 정보 수정
	@Override
	public void updateMyInformation(Member member) {
	
		session.update(namespace+".updateMyInformation", member);
	}
	
	// 내 애창곡 조회 (등록한 노래번호 조회)
	@Override
	public List<HashMap<String, Object>> readMyFavorite(String id) {

		return session.selectList(namespace+".readMyFavorite", id);
	}
	
	// 내 애창곡 조회 (등록한 노래번호 조회) 페이징 처리
	@Override
	public List<HashMap<String, Object>> favoriteCriteria(Criteria cri, String id) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("pageStart", cri.getPageStart());
		paramMap.put("perPageNum", cri.getPerPageNum());
		paramMap.put("id", id);
		
		return session.selectList(namespace+".favoriteCriteria", paramMap);
	}
	
	// 내 애창곡 삭제
	@Override
	public void deleteMyFavorite(int fid) {
		session.delete(namespace+".deleteMyFavorite", fid);
	}
	
	// 내 녹음저장소 삭제
	@Override
	public void deleteMyRecord(int rrid) {
		session.delete(namespace+".deleteMyRecord", rrid);
	}

	// 코인 충전
	@Override
	public void addCoin(Member member, String id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("coincnt", member.getCoincnt());
		paramMap.put("id", id);
		
		session.update(namespace+".addCoin", paramMap);
	}
	
	// 해당 노래번호인 노래 조회
	@Override
	public Song selectSong(int sid) {
		return session.selectOne(namespace+".selectSong", sid);
	}
	
	
	/// 코인 내역 조회 페이징 처리
	@Override
	public List<CoinHistory> coinListPage(int page, String id) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("page", page);
		paramMap.put("id", id);
		
		if (page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(namespace+".coinListPage", paramMap);
	}
	
	/// 코인 내역 조회 페이징 처리2
	@Override
	public List<CoinHistory> coinListCriteria(Criteria cri, String id) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("pageStart", cri.getPageStart());
		paramMap.put("perPageNum", cri.getPerPageNum());
		paramMap.put("id", id);
		
		return session.selectList(namespace+".coinListCriteria", paramMap);
	}
	
	
	// 코인 내역 테이블 행의 수 계산
	@Override
	public int countCoinPaging(Criteria cri, String id) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("pageStart", cri.getPageStart());
		paramMap.put("perPageNum", cri.getPerPageNum());
		paramMap.put("id", id);
		
		return session.selectOne(namespace+".countCoinPaging", paramMap);
	}
	
	// 코인 충전 내역 추가
	@Override
	public void coinListAdd(CoinHistory coinHistory) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("id", coinHistory.getId());
		paramMap.put("ctype", coinHistory.getChtype());
		paramMap.put("content", coinHistory.getChcontent());
		session.insert(namespace+".coinListAdd", paramMap);
		
		
	}	
	
	// 애창곡 내역 테이블 행의 수 계산
	@Override
	public int countFavoritePaging(Criteria cri, String id) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("pageStart", cri.getPageStart());
		paramMap.put("perPageNum", cri.getPerPageNum());
		paramMap.put("id", id);
		
		return session.selectOne(namespace+".countFavoritePaging", paramMap);
	}
	
	// 녹음저장소 내역 테이블 행의 수 계산
	@Override
	public int countRecordPaging(Criteria cri, String id) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("pageStart", cri.getPageStart());
		paramMap.put("perPageNum", cri.getPerPageNum());
		paramMap.put("id", id);
		
		return session.selectOne(namespace+".countRecordPaging", paramMap);
	}
	

}
