package com.hexacore.ssy.song.controller;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void songMain(Model model) {
		model.addAttribute("bests", songService.bestSongs());
		model.addAttribute("songs", songService.songsList());
	}
	
}
