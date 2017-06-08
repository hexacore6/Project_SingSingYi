package com.hexacore.ssy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hexacore.ssy.member.domain.Member;


/**
 * 특정 경로에 접근하는 경우 현재 사용자가 로그인한 상태의 사용자인지를 체크하는 역할
 */
public class MypageInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = Logger.getLogger(MypageInterceptor.class);
	
	// 현재 사용자가 로그인한 상태인지를 체크, 컨트롤러를 호출하게 할 것인지를 결정
/*	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		
		Member member = (Member)httpSession.getAttribute("login");
		if(!member.getId().equals(request.getParameter("id"))) {
			response.sendRedirect("/mypage/mySharing?id="+member.getId());
			return false;
		}
		
		return true;
	}*/
	
}
