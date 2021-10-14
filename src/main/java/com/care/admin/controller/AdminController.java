package com.care.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.admin.dto.AdminBookingDTO;
import com.care.admin.dto.KeyDTO;
import com.care.admin.service.AdminService;
import com.care.employee.dto.EmployeeDTO;
import com.care.teacher.dto.TeacherDTO;
import com.care.util.AdminCoolSMS;
import com.care.util.MakePage;

@Controller
public class AdminController {

	private String path = "resources/teacher";
	
	@Autowired
	private AdminService service;
	
	@PostMapping("/adminresult")
	public String loginResult(KeyDTO dto, HttpSession session) {
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		
		String key = service.login(dto);
		
		if(key != null) {
			session.setAttribute("login", key);
			return "redirect:/adminmain";
			
		} else {
			return "redirect:/hello";
		}
	}
	
	//예약 조회
	@RequestMapping("adminmain/bookinglist")
	public String list(@RequestParam(required = false, defaultValue = "1") int currPage
			, @RequestParam(required = false, defaultValue = "") String search
			, @RequestParam(required = false, defaultValue = "") String searchtxt
			, Model model){

		Pattern p = Pattern.compile("(^[0-9]*$)");

		if(search == "t_no" || search.equals("t_no")
				|| search == "t_name" || search.equals("t_name")) {

			Matcher m = p.matcher(searchtxt);
			if(m.find()) {
				model.addAttribute("searchtxt", searchtxt);
			} else {
				model.addAttribute("searchtxt", ""); 
			}
		}
		int totalCount = service.bookingTotalCount(search,searchtxt); //전체 자료 수
		int pageSize = 10;
		int blockSize = 5;

		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);

		//합계 구하기
		int bototal = service.bototal();
		model.addAttribute("bototal", bototal);

		List<AdminBookingDTO> list = service.bookingList(search,searchtxt, page.getStartRow(), page.getEndRow());
		model.addAttribute("list",list);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("searchtxt", searchtxt);

		return "admin/bookingList";
	}

	@RequestMapping("adminmain/bookinglist/detail/{bono}")
	public String adminBookingDetail(@PathVariable int bono, Model model) {
		AdminBookingDTO dto = service.adminBookingDetail(bono);

		model.addAttribute("dto", dto);

		return "admin/bookingDetail";
	}
	
	//지원자 조회
	@GetMapping("adminmain/employeelist")
	public String employeeList(@RequestParam(required = false, defaultValue = "1") int currPage, Model model) {
		int totalCount = service.emptotalCount(); //전체 자료 수
		int pageSize = 10;
		int blockSize = 5;
		
		MakePage page = new MakePage(currPage, totalCount, pageSize, blockSize);
		
		ArrayList<EmployeeDTO> list = service.employeeList(page.getStartRow(), page.getEndRow());
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		return "admin/employeeList";
	}
	
	//지원자 상세보기
	@GetMapping("adminmain/employeelist/detail/{eno}")
	public String employeeDetail(HttpServletRequest request, @PathVariable int eno, Model model) {
		EmployeeDTO dto = service.employeeDetail(eno);
		
		model.addAttribute("dto", dto);
		model.addAttribute("path", path);
		
		return "admin/employeeDetail";
	}
	
	//불합격 처리
	@GetMapping("adminmain/nonpass/{eno}")
	public String employeeNonPass(@PathVariable int eno, Model model) {
		int result = service.employeeNonPass(eno);
		
		model.addAttribute("result", result);
		model.addAttribute("eno", eno);
		
		return "admin/employeeNonPass";
	}
	
	//합격처리
	@GetMapping("adminmain/pass/{eno}")
	public String employeePass(@PathVariable int eno, EmployeeDTO dto, TeacherDTO tDTO, Model model) {
		
		//지원자 pass 처리
		int result = service.employeePass(eno);
		
		//지원자 정보를 선생님 테이블에 insert
		int result2 = service.employeeInsert(dto);
		
		//합격 문자 전송에 필요한 휴대폰 번호, 선생님 번호
		String employeePhone = service.getEmployeePhone(eno);
		int teacherNo = service.getTeacherNo(employeePhone);
		
		//합격 문자 전송
		AdminCoolSMS.sendSMS(employeePhone, teacherNo);
		
		model.addAttribute("result", result);
		model.addAttribute("result2", result2);
		
		return "admin/employeePass";
	}
}
