package com.hexacore.ssy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 특정 경로에 접근하는 경우 현재 사용자가 로그인한 상태의 사용자인지를 체크하는 역할
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = Logger.getLogger(AuthInterceptor.class);
	
	// 원래 가려고 했던 URI 저장했다가 로그인 성공 후 원래의 URI로 이동시키는 작업
	private void saveDest(HttpServletRequest request) {
		String uri = request.getRequestURI();
		
		String query = request.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if(request.getMethod().equals("GET")) {
			logger.info("dest : " + (uri + query));
			request.getSession().setAttribute("dest", uri + query);
		}
	}
	
	// 현재 사용자가 로그인한 상태인지를 체크, 컨트롤러를 호출하게 할 것인지를 결정
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		
		if(httpSession.getAttribute("login") == null) {
			logger.info("current user is no logined");
			
			saveDest(request);
			
			response.sendRedirect("/member/login");
			return false;
		}
		
		return true;
	}
	
}
