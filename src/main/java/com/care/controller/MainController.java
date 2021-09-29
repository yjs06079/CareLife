package com.care.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.care.admin.dto.KeyDTO;


@Controller
public class MainController {
	
	
	@GetMapping("/hello")
	public String hello() {
		
		return "main/hello";
	}
	
	@GetMapping("/usermain")
	public String userMain() {
		
		return "main/userMain";
	}
	
	@GetMapping("/teachermain")
	public String teacherMain() {
		
		return "main/teacherMain";
	}
	
	@GetMapping("/adminmain")
	public String adminMain(HttpSession session) {
		
		if(session.getAttribute("key") == null) {
			return "redirect:/hello";
			
		} else {
			return "main/adminMain";
		}
		
	}
}
