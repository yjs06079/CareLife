package com.care.teacher.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.teacher.dto.LoginDTO;
import com.care.teacher.dto.TeacherBookingListDTO;
import com.care.teacher.dto.TeacherCancelDTO;
import com.care.teacher.dto.TeacherDTO;
import com.care.teacher.service.TeacherService;
import com.care.user.dto.BookingParentsDTO;
import com.care.util.MakePage;
import com.care.util.PageNation;
import com.care.util.TeacherCoolSMS;


@Controller
public class TeacherController {

	private String path = "/carelife/resources/teacher";
	
	@Resource(name="teacherservice")
	private TeacherService service;
	
	//////////////////////////// 선생님 전용 페이지 /////////////////////////////////
	
	//예약 리스트
	@RequestMapping("teachermain/bookinglist")
	public String teacherBookingList(@RequestParam(required = false, defaultValue = "1") int currPage, TeacherBookingListDTO dto, Model model) {
		int totalCount = service.bookingTotalCount(); //전체 자료 수
		int pageSize = 10;
		int blockSize = 5;
		
		PageNation page = new PageNation(currPage, totalCount, pageSize, blockSize);
		
		ArrayList<TeacherBookingListDTO> list = service.teacherBookingList(dto, page.getStartRow(), pageSize);
		
		model.addAttribute("list", list);
		model.addAttribute("size", list.size());
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		
		return "teacher/teacherBookingList";
	}
	
	//예약 상세 페이지
	@GetMapping("teachermain/bookinglist/detail/{boNo}")
	public String teacherBookingDetail(@PathVariable int boNo, Model model) {
		TeacherBookingListDTO dto = service.teacherBookingDetail(boNo);
		
		model.addAttribute("dto", dto);
		
		return "teacher/teacherbookingDetail";
	}
	
	//예약 취소
	@PostMapping("teachermain/bookinglist/detail/cancel/{boNo}")
	public String teacherBookingCancel(@PathVariable int boNo, Model model) {
		//예약 취소
		int bookingCancel = service.teacherBookingCancel(boNo);
		
		//취소 문자 전송
		TeacherCancelDTO dto = service.bookingCancelSMS(boNo);
		TeacherCoolSMS.sendSMS(dto);
		
		model.addAttribute("bookingCancel", bookingCancel);
		model.addAttribute("boNo", boNo);
		
		return "teacher/teacherbookingCancel";
	}
	
	////////////////////////////사용자 전용 페이지 /////////////////////////////////
	
	@RequestMapping("usermain/teacherList")
	public String list(HttpServletRequest request,@RequestParam(required = false, defaultValue = "1") int currPage
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
		int pageSize = 9;
		int blockSize = 5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		List<TeacherDTO> list = service.teacherList(searchtxt, page.getStartRow(), page.getEndRow());
		model.addAttribute("list",list);
		model.addAttribute("page", page);
		model.addAttribute("searchtxt", searchtxt);
		
		model.addAttribute("path", path);
		
		return "teacher/teacherList";
	}
}
