package com.care.teacher.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.teacher.dto.MakePage;
import com.care.teacher.dto.TeacherDTO;
import com.care.teacher.service.TeacherService;


@Controller
public class TeacherController {

	@Resource(name="teacherservice")
	private TeacherService service;
	
	@RequestMapping("usermain/teacherList")
	public String list(@RequestParam(required = false, defaultValue = "1") int currPage
			 , @RequestParam(required = false, defaultValue = "") String searchtxt
			 , Model model){
		
		Pattern p = Pattern.compile("(^[0-9]*$)");
		
		Matcher m = p.matcher(searchtxt);
		if(m.find()) {
			model.addAttribute("searchtxt", searchtxt);
		} else {
			model.addAttribute("searchtxt", ""); 
		}
		
		int totalCount = service.totalCount(searchtxt); //전체 자료 수
		int pageSize = 8;
		int blockSize = 5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<TeacherDTO> list = service.teacherList(searchtxt, page.getStartRow(), page.getEndRow());
		model.addAttribute("list",list);
		model.addAttribute("page", page);
		model.addAttribute("searchtxt", searchtxt);
		
		return "teacher/teacherList";
	}	
}
