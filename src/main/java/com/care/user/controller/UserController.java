package com.care.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.user.service.BookingService;


@Controller
public class UserController {
	
	  @Resource(name="BookingService")
	  private BookingService service;
	
	
	@GetMapping("usermain/bookingparents")
	public String bookingParents(HttpServletRequest request) {

		return "user/bookingParents";
	} 
	
	@PostMapping("usermain/bookingparentsresult")
	public String bookingParentsResult(HttpServletRequest request, UserParentsDTO dto,Model model ) {
		
		String pPhone = request.getParameter("pPhone");
			
		HttpSession session =request.getSession();//세션정보를 가지고와서 id를 묶어주기
		
		session.setAttribute("pPhone", pPhone); 
		session.setMaxInactiveInterval(60*30); //로그인유지 시간 30분 
		
		System.out.println(dto.getPName());
		
		int result = service.parentsInsert(dto);
		
		System.out.println("pno-->"+dto.getPNo());
		
		model.addAttribute("pno", dto.getPNo());
		
		return "user/bookingInfo";
		
	}
	
	@GetMapping("usermain/bookinginfo")
	public String bookingInfo(HttpServletRequest request) {
		
		
		return "user/bookingInfo";
	}
	
	
	@PostMapping("usermain/bookingteacher")
	public String bookingTeacher(BookingDTO dto) {
		
		
		int result = service.bookingInsert(dto);
		
		
		
		return "user/bookingInfo";
	}
	
	
	
	
}
