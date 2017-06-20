package com.hexacore.ssy.member.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.hexacore.ssy.dto.LoginDTO;
import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = Logger.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	// 로그인 화면
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	// 로그인 결과 처리
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) {
		Member member = memberService.login(dto);
		
		if(member == null) {
			logger.info("login failed");
			model.addAttribute("msg", "fail");
			return;
		}
		
		model.addAttribute("member", member);
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Object obj = session.getAttribute("login");
		
		if(obj != null) {
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
			}
		}
		return "redirect:/";
	}
	
	// 회원가입 화면
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public void registGET() {
		
	}
	
	// 회원가입
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registPOST(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes rttr) {
		Member member = new Member();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String pwquestion = request.getParameter("pwquestion");
		String pwanswer = request.getParameter("pwanswer");
		member.setId(id);
		member.setPassword(password);
		member.setPwquestion(pwquestion);
		member.setPwanswer(pwanswer);
		
		memberService.regist(member);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/";
	}
	
	// 비밀번호 찾기 화면
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public void search() {
		
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String searchPOST(HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) {
		Member member = new Member();
		String id = request.getParameter("id");
		String pwquestion = request.getParameter("pwquestion");
		String pwanswer = request.getParameter("pwanswer");
		member.setId(id);
		member.setPwquestion(pwquestion);
		member.setPwanswer(pwanswer);
		
		if(memberService.searchPw(member) == null) {
			logger.info("입력 정보 불일치, 비밀번호 찾기 실패");
			rttr.addFlashAttribute("msg", "FAIL");
			return "redirect:/member/search";
		}
		
		rttr.addFlashAttribute("id", id);
		return "redirect:/member/reset";
	}
	
	// 비밀번호 재설정
	@RequestMapping(value="/reset", method=RequestMethod.GET)
	public void reset() {
		logger.info("비밀번호 재설정페이지로 이동");
	}
	
	@RequestMapping(value="/reset", method=RequestMethod.POST)
	public String resetPOST(String id, String password, RedirectAttributes rttr) {
		if(id.equals("")) {
			logger.info("오류 : 아이디 공백");
			rttr.addFlashAttribute("msg", "emptyId");
			return "redirect:/";
		}
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		
		memberService.resetPw(member);
		
		return "redirect:/";
	}
	
	// 아이디 중복확인
	@RequestMapping(value="/iddup", method=RequestMethod.POST)
	public ResponseEntity<String> read(String id, Model model) {
		System.out.println(id);
		
		ResponseEntity<String> entity = null;
		
		try {
				model.addAttribute("id", memberService.confirm(id));
				if(memberService.confirm(id) == true){
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}
				
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
