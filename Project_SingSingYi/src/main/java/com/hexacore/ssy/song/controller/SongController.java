package com.hexacore.ssy.song.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hexacore.ssy.song.controller.SongController;

@Controller
@RequestMapping("/song")
public class SongController {
	private static final Logger logger = Logger.getLogger(SongController.class);
	
	@RequestMapping(value="/sing", method=RequestMethod.GET)
	public void readSongData(@RequestParam("path") String path){
		
	}
	
}
