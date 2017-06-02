package com.hexacore.ssy.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hexacore.ssy.board.domain.Reply;
import com.hexacore.ssy.board.service.ReplyService;
import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.PageMaker;



@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	// 댓글 등록
	@RequestMapping(value ="", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody Reply reply){
		
		ResponseEntity<String> entity = null;
		
		try{
			service.regist(reply);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 목록
	@RequestMapping(value = "/all/{aid}", method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> list(
			@PathVariable("aid") int aid) {
		
		ResponseEntity<List<Reply>> entity = null;
		
		try{
			entity = new ResponseEntity<>(
					service.list(aid), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 수정
	@RequestMapping(value ="/{rid}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(
			@PathVariable("rid") int rid,
			@RequestBody Reply reply){
		
		ResponseEntity<String> entity = null;
		try{
			reply.setRid(rid);
			service.modify(reply);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/{rid}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(
			@PathVariable("rid") int rid) {
		
		ResponseEntity<String> entity = null;
		try{
			service.remove(rid);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
			
	// 댓글 페이지 리스트
	@RequestMapping(value = "/{aid}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(
			@PathVariable("aid") int aid,
			@PathVariable("page") int page){
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try{
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<>();
			List<Reply> list = service.listReplyPage(aid, cri);
			
			map.put("list", list);
			
			pageMaker.setTotalCount(service.count(aid));
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
