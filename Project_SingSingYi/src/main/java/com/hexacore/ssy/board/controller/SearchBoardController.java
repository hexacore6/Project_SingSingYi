package com.hexacore.ssy.board.controller;


import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hexacore.ssy.board.domain.Article;
import com.hexacore.ssy.board.service.BoardService;
import com.hexacore.ssy.common.Criteria;
import com.hexacore.ssy.common.PageMaker;
import com.hexacore.ssy.common.SearchCriteria;


@Controller
@RequestMapping("/board/*")
public class SearchBoardController {
	
	Logger logger = Logger.getLogger(SearchBoardController.class);
	
	@Inject
	private BoardService service;
	
	
	// listPage()는 SearchCriteria를 @ModelAttribute로 사용하고 있기 때문에 list.jsp에 자동으로 전달됨
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model){
		
		cri.setBid(1);
		logger.info(cri.toString());
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value ="/nlist", method = RequestMethod.GET)
	public void nlistPage(@ModelAttribute("cri") SearchCriteria cri, Model model){
		
		cri.setBid(2);
		logger.info(cri.toString());
		model.addAttribute("nlist", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/qnaregister", method = RequestMethod.GET)
	public void qnaRegistGET(){
		logger.info("GET방식으로 등록.............");	
	}
	
	@RequestMapping(value = "/qnaregister", method = RequestMethod.POST)
	public String qnaRegistPOST(Article article, RedirectAttributes rttr) {
		logger.info("POST방식으로 등록............");
		logger.info(article.toString());
		article.setBid(1);  // QnA 종류 번호
		service.regist(article);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list";
	}
	
	
	@RequestMapping(value = "/noticeregister", method = RequestMethod.GET)
	public void NoticeRegistGET(){
		logger.info("GET방식으로 등록.............");	
	}
	
	@RequestMapping(value = "/noticeregister", method = RequestMethod.POST)
	public String NoticeRegistPOST(Article article, RedirectAttributes rttr) {
		logger.info("POST방식으로 등록............");
		logger.info(article.toString());
		article.setBid(2);  // 공지사항 종류 번호
		service.regist(article);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/nlist";
	}
	
	
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model){
		
		logger.info("페이지 리스트를 Show.... Criteria");
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")Criteria cri, Model model){
		
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/readpage", method = RequestMethod.GET)
	public void read(@RequestParam("aid") int aid, @ModelAttribute("cri") SearchCriteria cri, Model model){
		model.addAttribute(service.read(aid));
	}
	
	@RequestMapping(value ="/qnamodifypage", method = RequestMethod.GET)
	public void qnaModifyPagingGET(@RequestParam("aid") int aid, @ModelAttribute("cri") SearchCriteria cri, Model model){
		model.addAttribute(service.read(aid));
	}
	
	@RequestMapping(value ="/qnamodifypage", method = RequestMethod.POST)
	public String qnaModifyPagingPOST(Article article, SearchCriteria cri, RedirectAttributes rttr){
		
		logger.info(cri.toString());
		service.modify(article);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/board/list";
		
	}
	
	@RequestMapping(value ="/noticemodifypage", method = RequestMethod.GET)
	public void noticeModifyPagingGET(@RequestParam("aid") int aid, @ModelAttribute("cri") SearchCriteria cri, Model model){
		model.addAttribute(service.read(aid));
	}
	
	@RequestMapping(value ="/noticemodifypage", method = RequestMethod.POST)
	public String noticeModifyPagingPOST(Article article, SearchCriteria cri, RedirectAttributes rttr){
		
		logger.info(cri.toString());
		service.modify(article);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/board/nlist";
		
	}
	
	@RequestMapping(value="/qnaRemovePage", method = RequestMethod.POST)
	public String qnaRemove(@RequestParam("aid") int aid , SearchCriteria cri, RedirectAttributes rttr){
		
		service.remove(aid);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/noticeRemovePage", method = RequestMethod.POST)
	public String noticeRemove(@RequestParam("aid") int aid , SearchCriteria cri, RedirectAttributes rttr){
		
		service.remove(aid);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/nlist";
	}
	
}
