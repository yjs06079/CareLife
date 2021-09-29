package com.care.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.care.admin.dto.KeyDTO;
import com.care.admin.service.AdminService;

@Controller
public class AdminController {

//	@Autowired
//	private AdminService service;
	
	@PostMapping("/adminresult")
	public String loginResult(KeyDTO dto, HttpSession session) {
		session.removeAttribute("key");
		
		if(dto.getKey().equals("admin")) {
			session.setAttribute("key", dto.getKey());
			session.setMaxInactiveInterval(30*60); //session 유지 시간 -> 30분
			
			return "redirect:/adminmain";
		
		} else {
			return "redirect:/hello";
			
		}
	}
	
	@GetMapping("adminmain/bookinglist")
	public String bookingList() {
		
		return "admin/bookingList";
	}
	
}
