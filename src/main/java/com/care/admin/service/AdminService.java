package com.care.admin.service;

import java.util.ArrayList;
import java.util.List;

import com.care.admin.dto.AdminBookingDTO;
import com.care.admin.dto.KeyDTO;
import com.care.employee.dto.EmployeeDTO;
import com.care.teacher.dto.TeacherDTO;

public interface AdminService {
	
	//예약관리 리스트
	public List<AdminBookingDTO> bookingList(String search, String searchtxt, int startRow, int endRow);
	
	//예약 검색 + 페이징
	public int bookingTotalCount(String search,String searchtxt);
	
	//예약 상세 페이지
	public AdminBookingDTO adminBookingDetail(int bono);
	
	//예약 총액 계산하기
	public int bototal();
	
	//지원자 목록
	public ArrayList<EmployeeDTO> employeeList(int startRow, int endRow);
	
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

	//관리자 전용키
	public String login(KeyDTO dto);

	//지원자 전화번호
	public String getEmployeePhone(int eno);

	//선생님 번호
	public int getTeacherNo(String employeePhone);
	
}
