package com.hexacore.ssy.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.hexacore.ssy.member.domain.Member;

/**
 * MemberController에서 HttpSession과 관련된 아무런 작업도 처리된 적 없기 때문에
 * HttpSession에 관련된 모든 설정 인터셉터에서 처리
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "login";
	private static final Logger logger = Logger.getLogger(LoginInterceptor.class);
	
	// MemberController에서 member라는 이름으로 객체를 담아둔 상태를 체크해서 HttpSession에 저장
	// loginCookie 생성
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		HttpSession httpSession = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Member member = (Member)modelMap.get("member");
		/*
		String msg = (String)modelMap.get("msg");
		if(msg != null) {
			logger.info("로그인 실패!");
			response.sendRedirect("/member/login");
		}
		*/
		if(member != null) {
			logger.info("new login success");
			httpSession.setAttribute(LOGIN, member);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie == null) {
				loginCookie = new Cookie("loginCookie", member.getId());
				loginCookie.setMaxAge(-1);
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
			}
//			response.sendRedirect("/");
			
			Object dest = httpSession.getAttribute("dest");
			
			response.sendRedirect(dest != null ? (String)dest : "/song/main");
		}
		
	}
	
	// 기존 HttpSession에 남아있는 정보가 있는 경우 메인으로 이동
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		
		if(httpSession.getAttribute(LOGIN) != null) {
//			logger.info("clear login data before");
//			httpSession.removeAttribute(LOGIN);
			
			// 기존 HttpSession에 남아있는 정보가 있을 때(로그인한 상태) home, login, regist 페이지로 이동할 때
			logger.info("is logined");
			response.sendRedirect("/song/main");
			return true;
		}
		
		return true;
	}
	
}
