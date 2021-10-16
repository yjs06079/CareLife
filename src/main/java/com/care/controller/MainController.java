package com.care.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.care.teacher.service.TeacherService;

@Controller
public class MainController {
	
	@Resource(name="teacherservice")
	private TeacherService service;
	
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
