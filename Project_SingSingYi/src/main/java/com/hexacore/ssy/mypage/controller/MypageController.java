package com.hexacore.ssy.mypage.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.PageMaker;
import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.mypage.domain.CoinHistory;
import com.hexacore.ssy.mypage.service.MypageService;
import com.hexacore.ssy.sharing.domain.Sharing;
import com.hexacore.ssy.sharing.service.SharingService;
import com.hexacore.ssy.sharing.util.MediaUtils;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	private static final Logger logger = Logger.getLogger(MypageController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Resource(name= "recordPath")
	private String recordPath;
	
	@Inject
	MypageService service;
	SharingService sharingService;
	
	// 나의 공유글 조회
	@RequestMapping(value="/sharing", method=RequestMethod.GET)
	public void readMySharing(Model model, HttpSession httpSession){
		Member member = (Member)httpSession.getAttribute("login");
		
		String id = member.getId();
		
		model.addAttribute("list", service.readMySharing(id));
		model.addAttribute("id", id);
	}
	
	// 나의 공유글 삭제
	@RequestMapping(value="/removesharing", method=RequestMethod.GET)
	public String removeMySharing(@RequestParam("shid") int shid, RedirectAttributes rttr){
		service.deleteMySharing(shid);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/mypage/sharing";
	}
	
	// 나의 코인개수 및 코인내역 조회 (회원정보조회)
	@RequestMapping(value="/coin", method=RequestMethod.GET)
	public void readMyCoin(Criteria cri, Model model, HttpSession httpSession){
		Member member = (Member)httpSession.getAttribute("login");
		
		String id = member.getId();		
		
		model.addAttribute("myCoin", service.readMyInformation(id));
		model.addAttribute("id", id);
		logger.info("테이블 :" +  service.coninListCriteria(cri, id));
		model.addAttribute("list", service.coninListCriteria(cri, id));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.countCoinPaging(cri, id));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	// 코인 충전
	@Transactional
	@RequestMapping(value="/addcoin", method=RequestMethod.POST)
	public String addCoin(String id, Member member){
		System.out.println("아이디" + id);
		System.out.println("멤버" + member);
		service.addCoin(member, id);
		CoinHistory coinHistory = new CoinHistory();
		coinHistory.setId(id);
		coinHistory.setChtype("충전");
		coinHistory.setChcontent("코인 " + member.getCoincnt() +" 개 충전");
		service.coinListAdd(coinHistory);
		return "redirect:/mypage/coin";
	}
	
	// 나의 애창곡 조회
	@RequestMapping(value="/favorite", method=RequestMethod.GET)
	public void readMyFaovrite(Criteria cri, Model model, HttpSession httpSession){
		
		Member member = (Member)httpSession.getAttribute("login");
		
		String id = member.getId();
		model.addAttribute("list", service.favoriteCriteria(cri, id));
		model.addAttribute("id", id);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.countFavoritePaging(cri, id));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// 나의 애창곡 삭제
	public String deleteFavorite(@RequestParam("fid") int fid){
		service.deleteMyFavorite(fid);
				
		return "redirect:/mypage/myFavorite";
	}
	
	
	// 나의 랭킹 조회
	@RequestMapping(value="/rank", method=RequestMethod.GET)
	public void readMyRank(Model model, HttpSession httpSession){
		Member member = (Member)httpSession.getAttribute("login");
		
		String id = member.getId();
		model.addAttribute("id", id);
		model.addAttribute("rank", service.readMyRank(id));
		model.addAttribute("top5List", service.readTopRank());
		int rank = service.readMyRank(id).getRank();
		model.addAttribute("myRankArea", service.readMyRankArea(rank));
	}
	
	// 나의 녹음저장소 조회
	@RequestMapping(value="record", method=RequestMethod.GET)
	public void readMyRecord(Criteria cri, Model model, HttpSession httpSession){
		Member member = (Member)httpSession.getAttribute("login");
		
		String id = member.getId();
		model.addAttribute("id", id);
		model.addAttribute("list", service.readMyRecord(cri, id));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.countRecordPaging(cri, id));
		
		model.addAttribute("pageMaker", pageMaker);
	}

	// 나의 녹음저장소 삭제
	@RequestMapping(value="/removerecord", method=RequestMethod.GET)
	public String removeMyRecord(@RequestParam("rrid") int rrid, RedirectAttributes rttr){
		service.deleteMyRecord(rrid);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/mypage/myRecord";
	}
	
	// 이미지 파일 불러오기
	@ResponseBody
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("File NAME : " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);

			logger.info(uploadPath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			System.out.println(entity);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}
	
	/*
	// mp3 파일 불러오기
	@ResponseBody
	@RequestMapping(value="/displayRecord")
	public ResponseEntity<byte[]> displayRecord(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("RecordFile NAME : " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			System.out.println(formatName);
			System.out.println(mType);

			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(recordPath + fileName);

			logger.info(recordPath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.parseMediaType("audio/mpeg"));
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			System.out.println("엔티티 : " + entity);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}
	*/
	
	// mp3 파일 불러오기
	@RequestMapping(value="/displayRecord")
	public void displayRecord(String fileName, HttpServletResponse response) throws Exception {
		
		response.setContentType("audio/mpeg");
		InputStream in = null;
		OutputStream out = null;

		try {
			in = new FileInputStream(recordPath + fileName);
			logger.info(recordPath + fileName);
			 out = response.getOutputStream();
			 
			 byte[] buffer = new byte[1024];
		     int count = 0;
		     while( (count = in.read(buffer)) != -1){
		    	 out.write(buffer, 0, count);
		     }
			 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			 if(out != null) out.close();
	         if(in != null) in.close();
		}
	}
		
	// 나의 정보 수정 (비밀번호 수정)
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(Model model, HttpSession httpSession){
		Member member = (Member)httpSession.getAttribute("login");
		
		String id = member.getId();
		model.addAttribute("id", id);
	}
	
	
	// 나의 정보 수정 (비밀번호 수정)
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public void modifyPOST(Member member){
		service.updateMyInformation(member);
	}
	
	// 내 글 상세보기
	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public ResponseEntity<Sharing> read(@RequestBody Sharing sharing, Model model) {
		System.out.println("에스아이디 : " + sharing.getShid());
		System.out.println(sharingService.read(sharing.getShid()) + "떠라");
		ResponseEntity<Sharing> entity = null;
		//String id = sharingService.read(sharing.getShid()).getId();
		try {
			model.addAttribute("read", sharingService.read(sharing.getShid()));
			model.addAttribute("listComment", sharingService.listComment(sharing.getShid()));
			System.out.println(sharingService.read(sharing.getShid()) + "결과");
			entity = new ResponseEntity<Sharing>(sharingService.read(sharing.getShid()), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Sharing>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 내 글 수정하기
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Sharing sharing, MultipartFile file, Model model) throws IOException {
		
		System.out.println(sharing);
		System.out.println(file);
		try {
			sharingService.modify(sharing);
			System.out.println("성공");
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return "redirect:/mypage/sharing";

	}
	
	// 내 글 삭제
	@Transactional
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Sharing sharing, Model model) {
		
		try {
			sharingService.removeComment(sharing.getShid());
			sharingService.removeSharing(sharing.getShid());
		} catch (Exception e) {
			System.out.println("삭제 실패");
			e.printStackTrace();
		}
		return "redirect:/mypage/sharing";
	}
	
	// 파일 업로드
	
}
