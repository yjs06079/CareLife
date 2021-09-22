package com.care.employee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.employee.dto.EmployeeDTO;
import com.care.employee.service.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired //service 주입
	private EmployeeService service;
	
	@RequestMapping("usermain/apply")
	public String apply() {
		
		return "employee/applyTeacher";
	}
	
	@GetMapping("usermain/download")
	public void download(HttpServletResponse response) throws Exception {
        try {
        	String path = "C:\\msa\\form.hwp"; // 이력서 양식 파일 경로
        	
        	File file = new File(path);
        	response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
        	
        	FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기 
        	OutputStream out = response.getOutputStream();
        	
        	int read = 0;
            byte[] buffer = new byte[1024]; //크기가 1024인 바이트 배열 객체 생성
            while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
                out.write(buffer, 0, read);
            }
                
        } catch (Exception e) {
            System.out.println(e);
            
        }
    }
	
	@PostMapping("usermain/applyresult")
	public String applyresult(EmployeeDTO dto, Model model) {
		int result = service.teacherApply(dto);
		
		model.addAttribute("result", result);
		
		return "employee/applyResult";
	}
	
}
