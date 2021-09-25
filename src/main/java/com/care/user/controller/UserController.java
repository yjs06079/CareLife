package com.care.user.controller;



import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.user.service.BookingService;

@SessionAttributes("pPhone")
@Controller
public class UserController {
	
	  @Resource(name="BookingService")
	  private BookingService service;
	
	
	@GetMapping("usermain/bookingparents")
	public String bookingParents(HttpServletRequest request) {

		return "user/bookingParents";
	} 
	
//	@PostMapping("usermain/bookingparentsresult")
	@RequestMapping(value="usermain/bookingparentsresult", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingParentsResult(HttpServletRequest request, UserParentsDTO dto,Model model ) {
		
		String pPhone = request.getParameter("pPhone");
			
		HttpSession session =request.getSession();//세션정보를 가지고와서 id를 묶어주기
		
		session.setAttribute("pPhone", pPhone); 
		session.setMaxInactiveInterval(60*30); //로그인유지 시간 30분 
		
	

		if(dto.getPName()==null || dto.getPName().equals("")) {

			//세션 확인필요! 
			session.invalidate();
			
			return "user/bookingParents";
		}else {
			
			int result = service.parentsInsert(dto);
			
			model.addAttribute("pno", dto.getPNo());
			
			System.out.println("bookingparentsresult page");
			
			return "user/bookingInfo";
			
		}
		
	}
	
	@RequestMapping(value="usermain/bookinginfo", method = {RequestMethod.GET, RequestMethod.POST})
	//@PostMapping("usermain/bookinginfo")
	public String bookingInfo(HttpServletRequest request,  BookingDTO bDTO, Model model ){
		
		return "user/bookingInfo";
	}

	//@PostMapping("usermain/bookingteacher")
	@RequestMapping(value="usermain/bookingteacher", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingTeacher(HttpServletRequest request,   BookingDTO bDTO, Model model ){
	
		System.out.println("dto>>" +bDTO.getBoAddr());
		System.out.println("dto>>" +bDTO.getBoDate());
		System.out.println("dto>>" +bDTO.getBoTime());
		System.out.println("dto>>" +bDTO.getBoHour());
		System.out.println("dto>>" +bDTO.getBoRoadName());
		System.out.println("dto>>" +bDTO.getBoRoadNameDetail());
		System.out.println("dto>>" +bDTO.getBoRemarks());
		
		model.addAttribute("bDTO", bDTO);

		List<BookingDTO> list  = service.selectTeacher(bDTO);
 
		model.addAttribute("list",list);
		

		return "user/bookingTeacher";
	}
	
	@RequestMapping(value="usermain/bookingteacherresult", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingteacherresult(HttpServletRequest request,  BookingDTO bDTO, Model model ) {
		
		model.addAttribute("bDTO", bDTO);
		
		return "user/bookingPay";
	}

	@RequestMapping(value="usermain/bookingpay", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingpay(HttpServletRequest request,  BookingDTO bDTO, Model model ) {
		
		//사이다페이 api 
		
		model.addAttribute("bDTO", bDTO);
		
		return "user/bookingPay";
	}
	
	@RequestMapping(value="usermain/bookingpayresult", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingpayresult(HttpServletRequest request,  BookingDTO bDTO, Model model ) {
		
		model.addAttribute("bDTO", bDTO);
		
		int result = service.bookingInsert(bDTO);
		
		return "user/bookingCompletion";
	}
	
	
	
}
