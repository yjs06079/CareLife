package com.care.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.TeacherDTO;
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
		
		System.out.println(dto.getPName());
		System.out.println("pno-->"+dto.getPNo());

		if(dto.getPName()==null || dto.getPName().equals("")) {

			//세션 확인필요! 
			session.invalidate();
			
			return "user/bookingParents";
		}else {
			
			int result = service.parentsInsert(dto);
			
			model.addAttribute("pno", dto.getPNo());
			
			System.out.println("????");
			
			return "user/bookingInfo";
			
		}
		
	}
	
	@RequestMapping(value="usermain/bookinginfo", method = {RequestMethod.GET, RequestMethod.POST})
	//@PostMapping("usermain/bookinginfo")
	public String bookingInfo(HttpServletRequest request) {
		
		//도로명주소  api
		
		return "user/bookingInfo";
	}

//	@RequestMapping(value="usermain/bookinginforesult", method = {RequestMethod.GET, RequestMethod.POST})
//	public String bookinginforesult(HttpServletRequest request, BookingDTO dto, Model model ) {
//		
//		//String pPhone = request.getParameter("pPhone");
//		
//		
//		return "user/bookingteacher";
//	}
	
	
	//@PostMapping("usermain/bookingteacher")
	@RequestMapping(value="usermain/bookingteacher", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingTeacher(HttpServletRequest request, TeacherDTO tDTO,  BookingDTO bDTO, Model model ) {

		List<BookingDTO> list  = service.selectTeacher(bDTO);
		
		return "user/bookingTeacher";
	}
	
	@RequestMapping(value="usermain/bookingteacherresult", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingteacherresult(HttpServletRequest request,  BookingDTO bDTO, Model model ) {
		
		String boAddr1 = request.getParameter("boAddr");
		bDTO.getBoAddr();
		//int result = service.bookingInsert(bDTO);
		
		System.out.println("bookingPay 페이지"+boAddr1);
		System.out.println("bookingPay 페이지2"+bDTO.getBoAddr());
		
		return "user/bookingPay";
	}

	@RequestMapping(value="usermain/bookingpay", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingpay(HttpServletRequest request,  BookingDTO bDTO, Model model ) {
		
	   System.out.println("bookingPay insert");
		String boAddr1 = request.getParameter("boAddr");
		
		//int result = service.bookingInsert(bDTO);
		System.out.println("bookingPay 페이지"+boAddr1);
		
		System.out.println(bDTO.toString());
		System.out.println(bDTO.getBoAddr());
		System.out.println(bDTO.getBoDate());
		
		model.addAttribute("bDTO",bDTO);
		
		return "user/bookingPay";
	}
	
	@RequestMapping(value="usermain/bookingpayresult", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingpayresult(HttpServletRequest request,  BookingDTO bDTO, Model model ) {
		
		
		//String boAddr1 = request.getParameter("boAddr");
		
		int result = service.bookingInsert(bDTO);
		
		return "user/bookingCompletion";
	}
	
	
	
}