package com.hexacore.ssy;

import java.util.List;

import java.util.Locale;
import java.util.Random;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hexacore.ssy.song.domain.Song;
import com.hexacore.ssy.song.service.SongService;

@Controller
@RequestMapping("/game/*")
public class GameController {
	
	Logger logger = Logger.getLogger(GameController.class);
	@Inject
	private SongService service;
	
	
	// 종현이 게임 시작 페이지
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
	public void gameResultPOST(Model model, @RequestParam("correct") int correct ) {
			logger.info("클라이언트: 종현이 게임 결과 !");
			logger.info(correct);
			model.addAttribute("correct", correct);
			model.addAttribute("countSong", service.countSong());
			
		}
	
	
	//---------------------------------------------------------------------------
	
	// 절대음감 게임 시작 페이지
	@RequestMapping(value = "/ppgameStart", method = RequestMethod.GET)
	public void ppgameStart(Locale locale, Model model) {
		
	}
	
		
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
	@RequestMapping(value = "/ppgameResult", method = RequestMethod.GET)
	public void ppgameResultPOST(Model model) {
			logger.info("클라이언트: 절대음감 게임 결과 !!");

			
		}
		
	
	
	
	
}
