package com.care.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.care.teacher.service.TeacherService;
import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
import com.care.user.dto.SessionUserDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.user.service.BookingService;
import com.care.util.PageNation;

@SessionAttributes("pPhone")
@Controller
public class UserController {

	@Resource(name = "BookingService")
	private BookingService service;

	@Autowired
	private TeacherService teacherService;
	
	private String path = "/resources/teacher";

	// 예약자정보 입력
	@GetMapping("usermain/bookingparents")
	public String bookingParents(HttpServletRequest request) {

		return "user/bookingParents";
	}

	// 예약내용 입력
	@RequestMapping(value = "usermain/bookinginfo")
	public String bookingParentsResult(HttpSession session, @ModelAttribute("userDTO") UserParentsDTO userDTO,
			Model model) {

		session.setAttribute("pphone", userDTO.getPphone());
		session.setMaxInactiveInterval(60 * 30); // 로그인유지 시간 30분

		if (userDTO.getPphone() == null || userDTO.getPphone().equals("")) {

			// 세션 확인필요! 로그아웃
			 session.invalidate(); 

			return "redirect:/usermain/bookingparents";

		} else {

			int result = service.parentsInsert(userDTO);

			return "user/bookingInfo";

		} // else


	}

	// 예약 선생님 선택
	@RequestMapping(value = "usermain/bookingteacher")
	public String bookingTeacher(HttpServletRequest request, BookingDTO bookingDTO, Model model) {

		int pno = Integer.parseInt(request.getParameter("pno"));
		String pname = request.getParameter("pname");
		String pphone = request.getParameter("pphone");

		bookingDTO.setPno(pno);

		List<BookingTeacherDTO> list = service.selectTeacher(bookingDTO);

		model.addAttribute("list", list);
		model.addAttribute("bookingDTO", bookingDTO);
		model.addAttribute("pno", pno);
		model.addAttribute("pname", pname);
		model.addAttribute("pphone", pphone);
		model.addAttribute("path",path);

		return "user/bookingTeacher";
	}

	// 예약결제
	@RequestMapping(value = "usermain/bookingpay")
	public String bookingteacherresult(HttpServletRequest request, @ModelAttribute("bookingDTO") BookingDTO bookingDTO,Model model) {

		int pno = Integer.parseInt(request.getParameter("pno"));
		String pname = request.getParameter("pname");
		String pphone = request.getParameter("pphone");
		int tno = Integer.parseInt(request.getParameter("tno"));

		model.addAttribute("pno", pno);
		model.addAttribute("pname", pname);
		model.addAttribute("pphone", pphone);
		model.addAttribute("tno", tno);
		model.addAttribute("bookingDTO", bookingDTO);

		return "user/bookingPay";
	}

	//예약결제 확인
	@RequestMapping(value = "usermain/bookingcompletion")
	public String bookingpayresult(HttpServletRequest request, @ModelAttribute("bookingDTO") BookingDTO bookingDTO,
			Model model) {
		
		return "user/bookingCompletion";
	}

	// 예약확인 마무리
	@RequestMapping(value = "usermain/bookingcompletionresult")
	public String bookingcompletionResult(HttpServletRequest request,
			@ModelAttribute("bookingDTO") BookingDTO bookingDTO, Model model) {

		String pname = request.getParameter("pname");

		int pno = Integer.parseInt(request.getParameter("pno"));
		bookingDTO.setPno(pno);

		int result = service.bookingInsert(bookingDTO);
		String tname = service.checkTeacher(bookingDTO.getBoNo());
		model.addAttribute("tname", tname);

		model.addAttribute("pname", pname);
		model.addAttribute("bookingDTO", bookingDTO);

		return "user/bookingCompletion";
	}

	//로그인화면
	@GetMapping(value = "usermain/bookingcheck")
	public String bookingCheck() {

		return "user/bookingCheck";
	}
	
	//세션보내기
	@PostMapping(value = "usermain/bookingcheck")
	public String bookingkResult(SessionUserDTO sessionUserDTO, HttpSession session, Model model) {
		
		//세션있으면 삭제	
 		if(session.getAttribute("user") != null) {
			session.removeAttribute("user");
		}

 		int result=0;
		if(sessionUserDTO !=null) {
			result = service.sessionCheck(sessionUserDTO.getPname(), sessionUserDTO.getPphone());
		}
		
		if (result > 0) {
			session.setAttribute("user", sessionUserDTO);
			return "redirect:/usermain/bookingchecklist";
		}
		else {
			return "redirect:/usermain/bookingcheck";
		}
    }
	
	
	
	//예약확인리스트
	@RequestMapping(value = "usermain/bookingchecklist")
	public String bookingCheckList(@RequestParam(required = false, defaultValue = "1") int currPage, Model model ,HttpSession session) {

       SessionUserDTO sessionUserDTO= (SessionUserDTO) session.getAttribute("user");
         
       //세션받은거 체크
         if(sessionUserDTO!=null)
         {
       	 
          int totalCount = service.getMyTotalCount(sessionUserDTO); // 전체 자료 수 int
		  int pageSize = 10; // 한페이지 게시글 수 int blockSize = 5;// 페이지네이션
		  int blockSize=5;
		  
		  PageNation page = new PageNation(currPage, totalCount, pageSize, blockSize);
		  
		  List<BookingParentsDTO> list = service.checkUser(sessionUserDTO.getPname(),
		  sessionUserDTO.getPphone(), page.getStartRow(), pageSize);
		  
		  model.addAttribute("list", list);
		  model.addAttribute("size", list.size()); 
		  model.addAttribute("sessionUserDTO",sessionUserDTO); 
		  model.addAttribute("page", page);
		  
		  return "user/bookingCheckList";

         }
         else {
        	 return "redirect:/usermain/bookingcheck";
         }
	}

	@RequestMapping(value = "usermain/bookingdetail/{boNo}")
	public String bookingDetail(@PathVariable int boNo, Model model) {
		BookingDTO bookingDTO = service.selectBooking(boNo);

		String tname = service.checkTeacher(boNo);
		model.addAttribute("bookingDTO", bookingDTO);
		model.addAttribute("tname", tname);

		return "user/bookingDetail";
	}
	
	
	@RequestMapping(value = "usermain/bookingremove/{boNo}")
	public String bookingRemove(@PathVariable int boNo, Model model) {

		int bookingCancel = teacherService.teacherBookingCancel(boNo);
		model.addAttribute("bookingCancel", bookingCancel);

		return "user/bookingDetail";
	}
	
	//이용요금 안내
	   @RequestMapping(value = "usermain/moneyinfo")
	   public String moneyInfo() {
	      return "user/moneyInfo";
	   }

}