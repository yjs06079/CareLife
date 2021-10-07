package com.care.user.controller;

import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.care.teacher.dto.TeacherDTO;
import com.care.teacher.service.TeacherService;
import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.user.service.BookingService;
import com.care.util.MakePage;
import com.care.util.PageNation;

@SessionAttributes("pPhone")
@Controller
public class UserController {

   @Resource(name = "BookingService")
   private BookingService service;

   @Autowired
   private TeacherService teacherService;

   // 예약자정보 입력
   @GetMapping("usermain/bookingparents")
   public String bookingParents(HttpServletRequest request) {

      System.out.println("=====bookingparents======");

      return "user/bookingParents";
   }

   // 예약내용 입력
   @RequestMapping(value = "usermain/bookinginfo")
   public String bookingParentsResult(HttpSession session, @ModelAttribute("userDTO") UserParentsDTO userDTO,
         Model model) {

      System.out.println("=====bookinginfo  start======");

      session.setAttribute("pphone", userDTO.getPphone());
      session.setMaxInactiveInterval(60 * 30); // 로그인유지 시간 30분

      if (userDTO.getPphone() == null || userDTO.getPphone().equals("")) {

         // 세션 확인필요!
         // session.invalidate(); 로그아웃

         return "redirect:/usermain/bookingparents";

      } else {

         int result = service.parentsInsert(userDTO);

         System.out.println("=====bookinginfo  end======");

         return "user/bookingInfo";

      } // else

//      //session check
//         if(userDTO.getPname()==null || userDTO.getPname().equals("")) {
//            return "redirect:/hello";
//            
//         } else {
//            return "main/adminMain";
//         }

   }

   // 예약 선생님 선택
   @RequestMapping(value = "usermain/bookingteacher")
   public String bookingTeacher(HttpServletRequest request, BookingDTO bookingDTO, Model model) {

      System.out.println("=====booking teacher  start======");

      int pno = Integer.parseInt(request.getParameter("pno"));
      String pname = request.getParameter("pname");
      String pphone = request.getParameter("pphone");

      System.out.println("pno-->" + pno);
      System.out.println("pname-->" + pname);
      System.out.println("date-->" + bookingDTO.getBoDate());
      System.out.println("time-->" + bookingDTO.getBoTime());
      System.out.println("addr-->" + bookingDTO.getBoAddr());
      bookingDTO.setPno(pno);

      List<BookingTeacherDTO> list = service.selectTeacher(bookingDTO);

      model.addAttribute("list", list);
      model.addAttribute("bookingDTO", bookingDTO);
      model.addAttribute("pno", pno);
      model.addAttribute("pname", pname);
      model.addAttribute("pphone", pphone);

      System.out.println("list" + list.size());

      System.out.println("=====booking teacher  end======");

      return "user/bookingTeacher";
   }

   // 예약결제
   @RequestMapping(value = "usermain/bookingpay")
   public String bookingteacherresult(HttpServletRequest request, @ModelAttribute("bookingDTO") BookingDTO bookingDTO,
         Model model) {

      System.out.println("======booking pay start========");
      int pno = Integer.parseInt(request.getParameter("pno"));
      String pname = request.getParameter("pname");
      String pphone = request.getParameter("pphone");
      int tno = Integer.parseInt(request.getParameter("tno"));

      model.addAttribute("pno", pno);
      model.addAttribute("pname", pname);
      model.addAttribute("pphone", pphone);
      model.addAttribute("tno", tno);
      model.addAttribute("bookingDTO", bookingDTO);

      System.out.println("======booking pay start========");
      System.out.println("getBoAddr--->" + bookingDTO.getBoAddr());
      System.out.println("getBoHour --->" + bookingDTO.getBoHour());
      System.out.println("getBoCancel--->" + bookingDTO.getBoCancel());
      System.out.println("=====booking pay  end======");

      return "user/bookingPay";
   }

   @RequestMapping(value = "usermain/bookingcompletion")
   public String bookingpayresult(HttpServletRequest request, @ModelAttribute("bookingDTO") BookingDTO bookingDTO,
         Model model) {
      System.out.println("getBoCancel--->" + bookingDTO.getBoCancel());

      return "user/bookingCompletion";
   }

   // 예약확인
   @RequestMapping(value = "usermain/bookingcompletionresult")
   public String bookingcompletionResult(HttpServletRequest request,
         @ModelAttribute("bookingDTO") BookingDTO bookingDTO, Model model) {

      System.out.println("======bookingcompletion ========");
      String pname = request.getParameter("pname");

      int pno = Integer.parseInt(request.getParameter("pno"));
      bookingDTO.setPno(pno);

      int result = service.bookingInsert(bookingDTO);
      System.out.println("no" + bookingDTO.getBoNo());
      String tname = service.checkTeacher(bookingDTO.getBoNo());
      System.out.println(tname);
      model.addAttribute("tname", tname);

      System.out.println("insert" + result);
      System.out.println("getBoCancel--->" + bookingDTO.getBoCancel());

      model.addAttribute("pname", pname);
      model.addAttribute("bookingDTO", bookingDTO);
      System.out.println("getBoCancel--->" + bookingDTO.getBoCancel());

      System.out.println("getBoAddr--->" + bookingDTO.getBoAddr());
      System.out.println("getPno--->" + bookingDTO.getPno());
      System.out.println("getBoCancel--->" + bookingDTO.getBoCancel());
      System.out.println("======bookingcompletion end========");

      return "user/bookingCompletion";
   }

   @RequestMapping(value = "usermain/bookingcheck")

   public String bookingCheck() {

      return "user/bookingCheck";
   }

   @RequestMapping(value = "usermain/bookingchecklist")
   public String bookingCheckList(@RequestParam(required = false, defaultValue = "1") int currPage,
         UserParentsDTO userParentsDTO, BookingParentsDTO bookingParentsDTO, Model model) {

   
       
      
      
      
      int totalCount = service.getMyTotalCount(bookingParentsDTO); // 전체 자료 수
      int pageSize = 10; // 한페이지 게시글 수
      int blockSize = 5;// 페이지네이션

      System.out.println("total >> " + totalCount);
      PageNation page = new PageNation(currPage, totalCount, pageSize, blockSize);

      System.out.println("page >> " + page.getStartRow());

      List<BookingParentsDTO> list = service.checkUser(userParentsDTO.getPname(), userParentsDTO.getPphone(),
            page.getStartRow(), pageSize);

      model.addAttribute("list", list);
      model.addAttribute("size", list.size());
      model.addAttribute("dto", userParentsDTO);
      model.addAttribute("page", page);
      /*
       * System.out.println("page1>>" + page.getCurrPage());
       * System.out.println("page1>>" + page.getStartRow());
       * System.out.println("page1>>" + page.getStartBlock());
       * System.out.println("pno" + bookingParentsDTO.getBoNo());
       */

      System.out.println("size => " + list.size()); // 사이즈이상함..
      
      

      
      return "user/bookingCheckList";
      
   }

   @RequestMapping(value = "usermain/bookingcancel/{boNo}")
   public String bookingDelete(@PathVariable int boNo, Model model) {

      int bookingCancel = teacherService.teacherBookingCancel(boNo);
      model.addAttribute("bookingCancel",bookingCancel);
      
      

      
      
      
      return "user/bookingCancelPay";
   }


}