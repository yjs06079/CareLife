package com.care.user.controller;



import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
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
			model.addAttribute("pPhone", dto.getPPhone());
			model.addAttribute("pName", dto.getPName());
			
			
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
	
		int pno = Integer.parseInt(request.getParameter("pno"));
		String pName = request.getParameter("pName");
		String pPhone = request.getParameter("pPhone");
		String boAddr = request.getParameter("boAddr");
		
		bDTO.setPno(pno);
		
		model.addAttribute("bDTO", bDTO);

		List<BookingDTO> list  = service.selectTeacher(bDTO);
 
		model.addAttribute("list",list);
		model.addAttribute("pName",pName);
		model.addAttribute("pPhone",pPhone);
		

		return "user/bookingTeacher";
	}
	
	@RequestMapping(value="usermain/bookingteacherresult", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingteacherresult(HttpServletRequest request,  BookingDTO bDTO, Model model ) {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		String pName = request.getParameter("pName");
		String pPhone = request.getParameter("pPhone");	
	   
		model.addAttribute("bDTO", bDTO);
				
		
		return "user/bookingPay";
	}

	@RequestMapping(value="usermain/bookingpay", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingpay(HttpServletRequest request,  BookingDTO bDTO, Model model ) {
			
		model.addAttribute("bDTO", bDTO);
			
		
		return "user/bookingPay";
	}
	
	@RequestMapping(value="usermain/bookingpayresult", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookingpayresult(HttpServletRequest request,  BookingDTO bDTO, Model model ) {
		
		model.addAttribute("bDTO", bDTO);
		
		int result = service.bookingInsert(bDTO);
	
		
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
