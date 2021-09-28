package com.care.employee.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.employee.dto.ApplyCheckDTO;
import com.care.employee.dto.EmployeeDTO;
import com.care.employee.mapper.EmployeeMapper;

@Service
public class EmployeeServiceImple implements EmployeeService {
	
	@Autowired //mapper 주입
	private EmployeeMapper mapper;

	//지원자 insert
	@Override
	public int teacherApply(EmployeeDTO dto) {
		// TODO Auto-generated method stub
		int result = mapper.teacherApply(dto);
		
		return result;
	}

	//지원자 합격조회
	@Override
	public ArrayList<ApplyCheckDTO> applyPassResult(ApplyCheckDTO dto) {
		// TODO Auto-generated method stub
		ArrayList<ApplyCheckDTO> result = mapper.applyPassResult(dto);
		
		return result;
	}

	//중복 지원 체크
	@Override
	public int checkInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int cnt = mapper.checkInfo(map);
		
		return cnt;
	}
}
