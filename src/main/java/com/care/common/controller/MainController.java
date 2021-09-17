package com.care.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


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
	public String adminMain() {
		
		return "main/adminMain";
	}
}
