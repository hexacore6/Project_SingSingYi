package com.hexacore.ssy;

import java.util.List;

import java.util.Locale;

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
	
	@RequestMapping(value = "/gameStart", method = RequestMethod.GET)
	public void gameStartGET(Locale locale, Model model) {
		
	}
	
	@RequestMapping(value = "/jhgame", method = RequestMethod.GET)
	public void jhgameGET(Song song, Model model){
		
		logger.info("Welcome 종현이게임!");
	}
	
	@RequestMapping(value = "/jhgame", method = RequestMethod.POST)
		public ResponseEntity<List<Song>> jhgamePOST(Model model){
		logger.info("클라이언트: 게임결과페이지 입장1");
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
	
	
/*	
	@RequestMapping(value = "/jhgame2", method = RequestMethod.POST)
	public void jhgame2POST(Song song, Model model){
		
	}
	
	@RequestMapping(value = "/jhgame2", method = RequestMethod.GET)
		public void jhgame2GET(Song song, Model model){
		
				song = service.randomSong();
				
				model.addAttribute("countSong", service.countSong());
				model.addAttribute("song", song);
				
				logger.info(song.toString());	
			}
	
	*/
	
/*	@RequestMapping(value = "/gameStart", method = RequestMethod.POST)
	public void gameStartPOST(Song song, Model model) {
		logger.info("POST방식으로 등록............");
		
		int count = service.countSong(); //랜덤할 때 총 개수로 사용
		double randomValue = Math.random();
		int sid = (int)(randomValue * count) +1;
		model.addAttribute("list", service.randomSong(sid));
		logger.info(song.toString());
		
	}*/
	
	@RequestMapping(value = "/gameResult", method = RequestMethod.GET)
	public void gameResultGET(Model model) {
		model.addAttribute("countSong", service.countSong());
		logger.info("클라이언트: 게임결과페이지 입장2");
	}
	
	@RequestMapping(value = "/gameResult", method = RequestMethod.POST)
	public ResponseEntity<String> gameResultPOST(Model model, @RequestBody int correct) {
		
		ResponseEntity<String> entity = null;
		try{
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			model.addAttribute("correct", correct);
			model.addAttribute("countSong", service.countSong());
			logger.info("클라이언트: 게임결과페이지 입장3");
			logger.info(correct);
			
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	
}
