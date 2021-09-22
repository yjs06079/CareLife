package com.care.employee.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.care.employee.dto.EmployeeDTO;

@Mapper
public interface EmployeeMapper {

	public int teacherApply(EmployeeDTO dto);

}
