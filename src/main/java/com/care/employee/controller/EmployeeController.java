package com.care.employee.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.care.employee.dto.ApplyCheckDTO;
import com.care.employee.dto.EmployeeDTO;
import com.care.employee.service.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired //service 주입
	private EmployeeService service;
	
	//////////////////////////////// 선생님 지원 /////////////////////////////////////////
	
	private String path = "teacher";
	
	@GetMapping("usermain/apply")
	public String applyTeacher() {
		
		return "employee/applyTeacher";
	}
	
	//파일 업로드
	@PostMapping("usermain/applyresult")
	public String applyResult(EmployeeDTO dto, HttpServletRequest request,Model model) {
		
		MultipartFile multi = dto.getEphotofile();
		
		String uploadpath = request.getSession().getServletContext().getRealPath(path);
		System.out.println(uploadpath);

		try {
			if(!multi.isEmpty()) {
				File file = new File(uploadpath, multi.getOriginalFilename());
				multi.transferTo(file);
			}

		} catch (IOException e) {
			System.out.println(e);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ename", dto.getEname());
		map.put("ebirth", dto.getEbirth());
		
		int cnt = service.checkInfo(map);
		
		if (cnt == 0) { //cnt가 0이라면 db에 없는 것 -> 지원 가능
			int result = service.teacherApply(dto);
			model.addAttribute("result", result);
			
			return "employee/applyResult";
		
		} else {
			model.addAttribute("result", cnt);
			
			return "employee/applyFail";
		}
	}
	
	//////////////////////////////// 합격 조회 //////////////////////////////////////////
	
	@GetMapping("usermain/passcheck")
	public String applyPassCheck() {
		
		return "employee/applyPassCheck";
	}
	
	@PostMapping("usermain/passresult")
	public String applyPassCheckResult(ApplyCheckDTO dto, Model model) {
		
		//select한 컬럼 수를 view에 뿌려주기 위해 ArrayList로 사용
		ArrayList<ApplyCheckDTO> list = service.applyPassResult(dto);
		
		model.addAttribute("dto", list);
		model.addAttribute("size", list.size());
		
		return "employee/applyPassResult";
	}
	
}
