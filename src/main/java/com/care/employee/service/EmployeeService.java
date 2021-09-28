package com.care.employee.service;

import java.util.ArrayList;
import java.util.Map;

import com.care.employee.dto.ApplyCheckDTO;
import com.care.employee.dto.EmployeeDTO;

public interface EmployeeService {

	//지원자 insert
	public int teacherApply(EmployeeDTO dto);
	
	//지원자 합격 조회
	public ArrayList<ApplyCheckDTO> applyPassResult(ApplyCheckDTO dto);

	//중복 지원 체크
	public int checkInfo(Map<String, Object> map);

}
