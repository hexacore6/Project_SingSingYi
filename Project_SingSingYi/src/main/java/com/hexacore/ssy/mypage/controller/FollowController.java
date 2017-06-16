package com.hexacore.ssy.mypage.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.mypage.service.MypageService;
import com.hexacore.ssy.sharing.domain.Sharing;

@RestController
@RequestMapping("/mypage/*")
public class FollowController {
	
	private static final Logger logger = Logger.getLogger(FollowController.class);
	
	@Inject
	MypageService service;
	
	@RequestMapping(value="/follow/{id}", method=RequestMethod.GET)
	public void  follow(@PathVariable("id") String id, Model model, HttpSession httpSession){
		System.out.println("팔로우에 들어왓니 ?");
		ResponseEntity<List<Sharing>> entity = null;
		Member member = (Member)httpSession.getAttribute("login");
		
		String loginId = member.getId();
		
		model.addAttribute("list", service.readMySharing(id));
		model.addAttribute("id", loginId);
	}
}
