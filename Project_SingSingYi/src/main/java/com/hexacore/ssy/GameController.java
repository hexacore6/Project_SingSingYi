package com.hexacore.ssy;


import java.util.List;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.member.service.MemberService;
import com.hexacore.ssy.song.domain.Song;
import com.hexacore.ssy.song.service.SongService;

@Controller
@RequestMapping("/game/*")
public class GameController {
	
	Logger logger = Logger.getLogger(GameController.class);
	@Inject
	private SongService service;
	@Inject
	private MemberService memberservice;
	
	
	// 미니 게임 시작 페이지
	@RequestMapping(value = "/gameStart", method = RequestMethod.GET)
	public void gameStartGET(Locale locale, Model model) {
		
	}
	
	// 종현이 게임 본 페이지 
	@RequestMapping(value = "/jhgame", method = RequestMethod.GET)
	public void jhgameGET(Song song, Model model){
		
		logger.info("Welcome 종현이게임!");
	}
	
	// 종현이 게임 본 페이지 POST
	@RequestMapping(value = "/jhgame", method = RequestMethod.POST)
		public ResponseEntity<List<Song>> jhgamePOST(Model model){
		logger.info("클라이언트: 종현이 게임 입장!");
			ResponseEntity<List<Song>> entity = null;
			
			try{
				entity = new ResponseEntity<List<Song>>(
						service.randomSong(), HttpStatus.OK);
						model.addAttribute("countSong", service.countSong());
						
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
	}
	
	// 종현이 게임 결과 페이지
	@RequestMapping(value = "/gameResult", method = RequestMethod.POST)
	public void gameResultPOST(Model model, @RequestParam("correct") int correct, HttpSession httpSession) {
		Member member = (Member)httpSession.getAttribute("login");
		
		String id = member.getId();		
		
		logger.info("클라이언트: 종현이 게임 결과 !");
			logger.info("종현이게임 맞춘 개수 :>>>>>>>>>>>>>>>>>>>>>"+correct);
			model.addAttribute("correct", correct);
			model.addAttribute("countSong", service.countSong());
			
			if(correct == 3){
				memberservice.addGameCoin(id);
			}
			
		}
	
	
	
	//---------------------------------------------------------------------------
	
		
	// 절대음감 게임 본 페이지 
	@RequestMapping(value = "/ppgame", method = RequestMethod.GET)
	public void ppgame(Song song, Model model){
		
		logger.info("Welcome 종현이게임!");
	}
		
	// 절대음감 게임 본 페이지 POST
	@RequestMapping(value = "/ppgame", method = RequestMethod.POST)
		public ResponseEntity<List<Song>> ppgamePOST(Model model){
		logger.info("클라이언트: 절대음감 게임 페이지  입장 !");
			ResponseEntity<List<Song>> entity = null;
			try{
				entity = new ResponseEntity<List<Song>>(
						service.randomSong(), HttpStatus.OK);
						model.addAttribute("countSong", service.countSong());
						
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
	}
		
	// 절대음감 게임 결과 페이지
	@RequestMapping(value = "/ppgameResult", method = RequestMethod.POST)
	public void ppgameResultPOST(Model model,@RequestParam("correct") int correct, HttpSession httpSession) {
		
		Member member = (Member)httpSession.getAttribute("login");
		String id = member.getId();		
			logger.info("클라이언트: 절대음감 게임 결과 !!");
			model.addAttribute("countSong", service.countSong());
			
			if(correct == 2){
				memberservice.addGameCoin(id);
			}

		}
		
	
	
	
	
}
