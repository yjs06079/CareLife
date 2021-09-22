package com.care.employee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.employee.dto.EmployeeDTO;
import com.care.employee.mapper.EmployeeMapper;

@Service
public class EmployeeServiceImple implements EmployeeService {
	
	@Autowired //mapper 주입
	private EmployeeMapper mapper;

	@Override
	public int teacherApply(EmployeeDTO dto) {
		// TODO Auto-generated method stub
		int result = mapper.teacherApply(dto);
		
		return result;
	}

}
