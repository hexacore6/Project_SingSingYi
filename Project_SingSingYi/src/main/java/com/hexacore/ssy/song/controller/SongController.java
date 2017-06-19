package com.hexacore.ssy.song.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.PageMaker;
import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.mypage.domain.Favorite;
import com.hexacore.ssy.mypage.domain.RecordRepository;
import com.hexacore.ssy.mypage.service.MypageService;
import com.hexacore.ssy.song.domain.Song;
import com.hexacore.ssy.song.service.SongService;

@Controller
@RequestMapping("/song")
public class SongController {
	private static final Logger logger = Logger.getLogger(SongController.class);
	
	@Inject
	private SongService songService;
	
	@Inject
	private MypageService mypageService;
	
	
	@RequestMapping(value="/sing", method=RequestMethod.GET)
	public void readSongData(Criteria cri, Model model, @RequestParam("sid") int sid, HttpSession httpSession){
		
		
		songService.updatePlayCnt(sid);
		
		model.addAttribute("sid", sid);
		model.addAttribute("song", songService.readSong(sid));
	}
	
	@RequestMapping(value="/sing", method=RequestMethod.POST)
	public void readSongDataPOST(Criteria cri, Model model, @RequestParam("sid") int sid, HttpSession httpSession){
		// 나의 애창곡 조회
		Member member = (Member)httpSession.getAttribute("login");
		
		String id = member.getId();
		List<HashMap<String, Object>> list = mypageService.favoriteCriteria(cri, id);
		System.out.println("리스트" + list);

		String sfilename = null;
		
		for (HashMap<String, Object> hashMap : list) {
			sfilename =  (String) hashMap.get("sfilename");
		}
		
		model.addAttribute("sfilename", sfilename);
		model.addAttribute("list", list);
		model.addAttribute("id", id);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(mypageService.countFavoritePaging(cri, id));
		
		model.addAttribute("pageMaker", pageMaker);
		
		// 나의 애창곡 조회 End
		
		songService.updatePlayCnt(sid);
		
		model.addAttribute("sid", sid);
		model.addAttribute("song", songService.readSong(sid));
	}
	
	@RequestMapping(value="/upload", produces = "application/text; charset=utf8", method=RequestMethod.POST)
	public ResponseEntity<String> uploadSong(@RequestBody Song song, HttpSession httpSession){
		ResponseEntity<String> entity = null;
		logger.info("파일 이름 : " + song.getSfilename());
		Member member = (Member) httpSession.getAttribute("login");
		String id = member.getId();
		int rrid = 0;
		
		if(songService.readRecentRecordId() == null) {
			rrid = 0;
		} else {
			rrid = songService.readRecentRecordId().intValue();
		}
		
		logger.info("알알 : " + rrid);
		
		String fileName = id + "_" + (rrid+1) + "_" + song.getSfilename();
		
		RecordRepository recordRepository = new RecordRepository();
		recordRepository.setId(id);
		recordRepository.setRecordfilename(fileName);
		
		songService.uploadRecord(recordRepository);
		
		entity = new ResponseEntity<String>(fileName, HttpStatus.OK);
		
		return entity;
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
		
		if(songService.checkFavorite(id, sid)!=null){
			
			entity = new ResponseEntity<Boolean>(false, HttpStatus.OK);			
		} else{
			songService.addFavorite(id, sid);
			entity = new ResponseEntity<Boolean>(true, HttpStatus.OK);
		}
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
