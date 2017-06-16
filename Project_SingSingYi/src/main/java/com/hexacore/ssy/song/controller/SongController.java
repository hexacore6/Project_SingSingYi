package com.hexacore.ssy.song.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.mypage.domain.Favorite;
import com.hexacore.ssy.sharing.domain.Sharing;
import com.hexacore.ssy.song.domain.Song;
import com.hexacore.ssy.song.service.SongService;

@Controller
@RequestMapping("/song")
public class SongController {
	private static final Logger logger = Logger.getLogger(SongController.class);
	
	@Inject
	private SongService songService;
	
	@RequestMapping(value="/sing", method=RequestMethod.GET)
	public void readSongData(@RequestParam("sid") int sid){
		
	}
	
	@RequestMapping(value="/recordTest", method=RequestMethod.GET)
	public void readSongData2(){
		
	}
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void songMain(Model model) {
		model.addAttribute("bests", songService.bestSongs());
		model.addAttribute("songs", songService.songsList());
	}
	
	@RequestMapping(value="/addFavorite", method=RequestMethod.POST)
	public ResponseEntity<Boolean> addFavorite(@RequestBody Song song, HttpSession httpSession){
		ResponseEntity<Boolean> entity = null;
		
		
		Member member = (Member)httpSession.getAttribute("login");
		int sid = song.getSid();
		String id = member.getId();
		
		songService.addFavorite(id, sid);
		entity = new ResponseEntity<Boolean>(true, HttpStatus.OK);
		
		return entity;
		
		//return "redirect:/song/main";
	}
	
	@RequestMapping(value="/removeFavorite", method=RequestMethod.POST)
	public ResponseEntity<Boolean> removeFavorite(@RequestBody Favorite favorite, HttpSession httpSession){
		ResponseEntity<Boolean> entity = null;

		int fid = favorite.getFid();
		
		songService.removeFavorite(fid);
		entity = new ResponseEntity<Boolean>(true, HttpStatus.OK);
		
		return entity;
		
		//return "redirect:/song/main";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public ResponseEntity<Boolean> removeFavorite(String song, HttpSession httpSession){
		ResponseEntity<Boolean> entity = null;
		System.out.println("수신 데잍터 :" + song);
		
		
		entity = new ResponseEntity<Boolean>(true, HttpStatus.OK);
		
		return entity;
		
		//return "redirect:/song/main";
	}
	
}
