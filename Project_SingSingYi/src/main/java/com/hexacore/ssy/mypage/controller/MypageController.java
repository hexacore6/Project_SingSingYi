package com.hexacore.ssy.mypage.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hexacore.ssy.mypage.domain.Favorite;
import com.hexacore.ssy.mypage.domain.Member;
import com.hexacore.ssy.mypage.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private static final Logger logger = Logger.getLogger(MypageController.class);
	
	@Inject
	MypageService service;
	
	// 나의 공유글 조회
	@RequestMapping(value="/mySharing", method=RequestMethod.GET)
	public void readMySharing(@RequestParam("id") String id, Model model){
		model.addAttribute("list", service.readMySharing(id));
	}
	
	// 나의 공유글 삭제
	@RequestMapping(value="/removeSharing", method=RequestMethod.POST)
	public String removeMySharing(@RequestParam("shid") int shid, RedirectAttributes rttr){
		service.deleteMySharing(shid);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/mypage/mySharing";
	}
	
	// 나의 코인개수 조회 (회원정보조회)
	@RequestMapping(value="/myCoin", method=RequestMethod.GET)
	public void readMyCoin(@RequestParam("id") String id, Model model){
		model.addAttribute("myCoin", service.readMyInformation(id));
		model.addAttribute("list", service.readCoinHistory(id));
	}
	// 나의 애창곡 조회
	@RequestMapping(value="/myFavorite", method=RequestMethod.GET)
	public void readMyFaovrite(@RequestParam("id") String id, Model model){
		model.addAttribute("list", service.readMyFavorite(id));
		
	}
	
	// 나의 애창곡 삭제
	public void delteFavorite(@RequestParam("fid") int fid){
		service.deleteMyFavorite(fid);
	}
	
	
	// 나의 랭킹 조회
	@RequestMapping(value="/myRank", method=RequestMethod.GET)
	public void readMyRank(@RequestParam("id") String id, Model model){
		logger.info("처음");
		model.addAttribute("rank", service.readMyRank(id));
		model.addAttribute("top5List", service.readTopRank());
		logger.info("하이");
		int rank = service.readMyRank(id).getRank();
		logger.info("나의 랭킹 : " + rank);
		model.addAttribute("myRankArea", service.readMyRankArea(rank));
	}
	
	// 나의 정보 수정 (비밀번호 수정)
	@RequestMapping(value="/myModify", method=RequestMethod.GET)
	public void modifyGET(Member member){
	}
	
	
	// 나의 정보 수정 (비밀번호 수정)
	@RequestMapping(value="/myModify", method=RequestMethod.POST)
	public void modifyPOST(Member member){
		service.updateMyInformation(member);
		
	}
}
