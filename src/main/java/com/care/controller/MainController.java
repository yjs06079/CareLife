package com.care.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.care.teacher.dto.LoginDTO;
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
