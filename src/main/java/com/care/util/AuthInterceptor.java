package com.care.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		String root = request.getContextPath(); //현재 위치
		
		//session check (Interceptor가 먼저 동작)
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			response.sendRedirect(root + "/hello");
			
			return false;
		}
		
		return true;
	}
}
