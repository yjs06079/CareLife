package com.care.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.care.user.dto.UserParentsDTO;
import com.care.user.service.BookingService;


@Controller
public class UserController {
	
	  @Resource(name="BookingService")
	  private BookingService service;
	
	
	@GetMapping("usermain/bookingparents")
	public String bookingParents(HttpServletRequest request) {

		System.out.println("dddddddddddd");
		
		
		return "user/bookingParents";
	} 
	
	@PostMapping("/bookingparentsresult")
	public String bookingParentsResult(HttpServletRequest request, UserParentsDTO dto ) {
		
		String boPhone = request.getParameter("boPhone");
		
		System.out.println("boPhone >  " + boPhone);
		
		HttpSession session =request.getSession();//세션정보를 가지고와서 id를 묶어주기
		
		session.setAttribute("boPhone", boPhone); 
		session.setMaxInactiveInterval(60*30); //로그인유지 시간 30분 
		
		System.out.println(dto.getBoName());
		
		int result = service.parentsInsert(dto);
		
		return "user/bookinginfo";
		
	}
	
	@GetMapping("usermain/bookinginfo")
	public String bookinginfo(HttpServletRequest request) {
		
		
		return "user/bookingInfo";
	}
	
	
	
	
	
}
