package com.hexacore.ssy.member.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.hexacore.ssy.dto.LoginDTO;
import com.hexacore.ssy.member.domain.Member;
import com.hexacore.ssy.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	// 로그인 화면
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	// 결과 처리
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) {
		Member member = memberService.login(dto);
		
		if(member == null) {
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
		return "member/logout";
	}
	
	// 회원가입 화면
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public void registGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	// 회원가입
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public String registPOST(HttpServletRequest request, HttpServletResponse response) {
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
		
		return "/member/login";
	}
}
