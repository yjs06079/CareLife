package com.care.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.care.admin.dto.AdminBookingDTO;
import com.care.employee.dto.EmployeeDTO;

@Mapper
public interface AdminMapper {
	
	//예약 리스트
	public List<AdminBookingDTO> getList(HashMap<String, Object> hm);
	
	//예약 검색 + 페이징
	public int bookingTotalCount(HashMap<String, Object> hm);
	
	//예약 상세보기
	public AdminBookingDTO adminBookingDetail(int bono);
	
	//총액 계산하기
	public int bototal();
	
	//지원자 목록
	public ArrayList<EmployeeDTO> employeeList(HashMap<String, Object> hm);
	
	//전체 지원자 자료 수
	public int emptotalCount();

	//지원자 상세보기
	public EmployeeDTO employeeDetail(int eno);

	//불합격
	public int employeeNonPass(int eno);
	
	//합격
	public int employeePass(int eno);

	//선생님 테이블에 insert
	public int employeeInsert(EmployeeDTO dto);

	//지원자 전화번호
	public String getEmployeePhone(int eno);

	//선생님 번호
	public int getTeacherNo(String employeePhone);

}
