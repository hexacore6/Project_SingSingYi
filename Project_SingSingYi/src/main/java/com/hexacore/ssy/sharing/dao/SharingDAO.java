package com.hexacore.ssy.sharing.dao;

import java.util.List;

import com.hexacore.ssy.sharing.domain.Comment;
import com.hexacore.ssy.sharing.domain.LikeHistory;
import com.hexacore.ssy.sharing.domain.RecordRepository;
import com.hexacore.ssy.sharing.domain.Sharing;


public interface SharingDAO {
	
	//공유글 전체리스트 출력
	public List<Sharing> listAll(String id);
	
	//댓글 전체리스트 출력
	public List<Comment> listComment(int shid);
	
	//공유글 작성
	public void create(Sharing sharing) throws Exception;
	
	//댓글 작성
	public void comment(Comment comment);
	
	//노래제목 가져오기
	public String getRecordFileName(int shid);
	
	//댓글 가져오기
	public Comment getComment(Comment comment);
	
	//공유글 고유번호 가져오기
	public int getShid();
	
	//좋아요기록 남기기
	public void likeHistory(LikeHistory likeHistory);
	
	//좋아요기록 체크하기
	public LikeHistory checkLike(LikeHistory likeHistory);
	
	//공유글 상세조회
	public Sharing read(int shid);
	
	//공유글 수정하기
	public void update(Sharing sharing);
	
	//공유글 이미지 수정
	public void updateImg(Sharing sharing);
	
	//공유글 삭제하기
	public void deleteSharing(int shid);
	
	//댓글 삭제하기(글 삭제전 선작업)
	public void deleteComment(int shid);
	
	//해당 글 좋아요기록 모두 삭제하기 (글 삭제전 선작업)
	public void deleteAllLikeHistory(int shid);
	
	public void updateCommentCnt(int shid);
	public void updateLikeCnt(int shid);
	public int getLikeCnt(int shid);
	public void fallLikeCnt(int shid);
	public void deleteLikeHistory(LikeHistory likeHistory);
	public void addAttach(String eximgfilename);
	
	//유저이름을 통한 검색처리
	public List<Sharing> searchById(String id);
	
	//노래이름을 통한 검색처리
	public List<Sharing> searchByTitle(String recordfilename);
	
	//내용을 통한 검색처리
	public List<Sharing> searchByContent(String shcontent);
	
	//공유글 내에서 녹음저장소 조회
	public List<RecordRepository> getRecord(String id);
}
