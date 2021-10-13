package com.care.employee.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeDTO {
	private int eno;
	private String ephoto;
	private String ename;
	private String ebirth;
	private String ephone;
	private String eaddr;
	private String eedu;
	private String ecareer;
	private String elicense;
	private String einfo;
	private int epass;
	
	//파일 업로드
	private MultipartFile ephotofile;
}
