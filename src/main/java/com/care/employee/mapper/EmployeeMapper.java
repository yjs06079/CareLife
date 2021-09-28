package com.care.employee.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.care.employee.dto.ApplyCheckDTO;
import com.care.employee.dto.EmployeeDTO;

@Mapper
public interface EmployeeMapper {

	//지원자 insert
	public int teacherApply(EmployeeDTO dto);

	//지원자 합격조회
	public ArrayList<ApplyCheckDTO> applyPassResult(ApplyCheckDTO dto);

	//중복 지원 체크
	public int checkInfo(Map<String, Object> map);
}
