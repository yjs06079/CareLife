package com.care.user.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.care.teacher.dto.TeacherDTO;
import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.user.service.BookingService;

@SessionAttributes("pPhone")
@Controller
public class UserController {
	
	  @Resource(name="BookingService")
	  private BookingService service;
	
	//예약자정보 입력
	@GetMapping("usermain/bookingparents")
	public String bookingParents(HttpServletRequest request) {
		
		System.out.println("=====bookingparents======");

		return "user/bookingParents";
	} 
	
	//예약내용 입력
	@RequestMapping(value="usermain/bookinginfo")
	public String bookingParentsResult(HttpServletRequest request, @ModelAttribute("userDTO")  UserParentsDTO userDTO,Model model ) {
		
		System.out.println("=====bookinginfo  start======");
		
		HttpSession session =request.getSession();//세션정보를 가지고와서 id를 묶어주기
		
		session.setAttribute("pphone", userDTO.getPphone()); 
		session.setMaxInactiveInterval(60*30); //로그인유지 시간 30분 
		
	

		if(userDTO.getPphone()==null || userDTO.getPphone().equals("")) {

			//세션 확인필요! 
			//session.invalidate(); 로그아웃
			
			return "redirect:/usermain/bookingparents";

		}else {
			
			
			int result = service.parentsInsert(userDTO);
			
			System.out.println("=====bookinginfo  end======");
			
			return "user/bookingInfo";
			
		}//else
		
		
		
//		//session check
//	      if(userDTO.getPname()==null || userDTO.getPname().equals("")) {
//	         return "redirect:/hello";
//	         
//	      } else {
//	         return "main/adminMain";
//	      }
	      
	}
	

	//예약 선생님 선택
	@RequestMapping(value="usermain/bookingteacher")
	public String bookingTeacher(HttpServletRequest request ,BookingTeacherDTO bookingTeacherDTO,BookingDTO bookingDTO,TeacherDTO teacherDTO, Model model ){

		
		System.out.println("=====booking teacher  start======");
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		String pname = request.getParameter("pname");
		String pphone = request.getParameter("pphone");	
		
		
		System.out.println("pno-->" + pno);
		System.out.println("pname-->" + pname);
		System.out.println("date-->" +bookingDTO.getBoDate());
		
		bookingDTO.setPno(pno);
				 		
		List<BookingTeacherDTO> list  = service.selectTeacher(bookingTeacherDTO);
		
	
		model.addAttribute("list",list);
		model.addAttribute("bookingDTO",bookingDTO);
		model.addAttribute("pno", pno);
		model.addAttribute("pname", pname);
		model.addAttribute("pphone", pphone);
		
		System.out.println("=====booking teacher  end======");
		


		return "user/bookingTeacher";
	}
	
	//예약결제
	@RequestMapping(value="usermain/bookingpay")
	public String bookingteacherresult(HttpServletRequest request,@ModelAttribute("bookingDTO")  BookingDTO bookingDTO, Model model ) {
		
		System.out.println("======booking pay start========");
		int pno = Integer.parseInt(request.getParameter("pno"));
		String pname = request.getParameter("pname");
		String pphone = request.getParameter("pphone");	
		int tno = Integer.parseInt(request.getParameter("tno"));	
		
		model.addAttribute("pno",pno);
		model.addAttribute("pname",pname);
		model.addAttribute("pphone",pphone);
		model.addAttribute("tno",tno);
		model.addAttribute("bookingDTO",bookingDTO);
	   
		System.out.println("======booking pay start========");
		System.out.println("getBoAddr--->" + bookingDTO.getBoAddr());
		System.out.println("pname--->" + pname);
		System.out.println("getPno--->" + bookingDTO.getPno());
		System.out.println("getBoHour --->" + bookingDTO.getBoHour());
		
		System.out.println("=====booking pay  end======");
				
		
		return "user/bookingPay";
	}


	//예약확인
	@RequestMapping(value="usermain/bookingcompletion")
	public String bookingpayresult(HttpServletRequest request,@ModelAttribute("bookingDTO")  BookingDTO bookingDTO, Model model ) {
	
		
	//	int pno = Integer.parseInt(request.getParameter("pno"));
		String pname = request.getParameter("pname");
		
	//	bookingDTO.setPno(pno);
	//	model.addAttribute("pno",pno);
		model.addAttribute("pname",pname);
		model.addAttribute("bookingDTO", bookingDTO);

		//int pno = Integer.parseInt(request.getParameter("pno"));
		//bookingDTO.setPno(pno);
		

		
		System.out.println("======bookingcompletion ========");
		System.out.println("getBoAddr--->" + bookingDTO.getBoAddr());
		System.out.println("getPno--->" + bookingDTO.getPno());

		int result = service.bookingInsert(bookingDTO);
	
		
		return "user/bookingCompletion";
	}
	
	@RequestMapping(value="usermain/bookingCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingCheck(HttpServletRequest request,  BookingDTO bDTO, Model model ){
		
		return "user/bookingCheck";
	}

	@RequestMapping(value="usermain/bookingCheckResult", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingCheckResult(HttpServletRequest request,  BookingParentsDTO DTO, Model model ){
		
		String curr=request.getParameter("curr");
	
		
		   int currpage=1;
		   if(curr!=null)
		   {
			   currpage=Integer.parseInt(curr);
		   }
			
	    //전체 자료갯수
		 int totalcount= service.getMyTotalCount(DTO);
		 int pagepercount= 10;  //1페이지에 보여줄 자료수
		 
		 System.out.println("total => " + totalcount);
		 
		 int totalpage=(int) Math.ceil((float)totalcount/pagepercount);
				 
		 int startrow=(currpage-1)*pagepercount+1;
		 int endrow=startrow+pagepercount-1;
		 

		 if(endrow>totalcount)
			 endrow=totalcount;
		 
		 
		 int blockcount=3;
		 int startblock=(currpage-1)/blockcount*blockcount+1;
		 int endblock=startblock+blockcount-1;
		 
		 if(endblock>totalpage)
		 {
			 endblock=totalpage;
		 }

		 DTO.setStartrow(startrow);
		 DTO.setEndrow(endrow);
		
		List<BookingParentsDTO> list = service.bookingCheck(DTO);
		model.addAttribute("list" , list);
		model.addAttribute("currpage", currpage);
		model.addAttribute("datacount", list.size());
		model.addAttribute("startblock", startblock);
		model.addAttribute("endblock", endblock);
		model.addAttribute("totalpage", totalpage);
		
		System.out.println("size => " + list.size()); //사이즈이상함..
//		
//		for(int i=0; i<=list.size(); i++) {
//			System.out.println(list.get(i).getPname());
//		}

		
		return "user/bookingCheckResult";
	}

	@RequestMapping(value="usermain/bookingDelete", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingDelete(HttpServletRequest request,  BookingParentsDTO DTO, Model model ){
		
		System.out.println(DTO.getPno());
		
		int result = service.bookingDelete(DTO);
		return "user/bookingCheck";  //list로 돌아가야함..
	}
	
	
}
