package com.care.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.care.admin.dto.AdminBookingDTO;
import com.care.admin.dto.KeyDTO;
import com.care.admin.mapper.AdminMapper;
import com.care.employee.dto.EmployeeDTO;
import com.care.teacher.dto.TeacherDTO;

@Service
public class AdminServiceImple implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	//예약관리 리스트
	@Override
	public List<AdminBookingDTO> bookingList(String search,String searchtxt, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);

		return mapper.getList(hm);
	}

	//예약 검색 + 페이징
	@Override
	public int bookingTotalCount(String search,String searchtxt) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("search", search);
		hm.put("searchtxt", searchtxt);

		int result = mapper.bookingTotalCount(hm);

		return result;
	}

	//예약 상세 페이지
	@Override
	public AdminBookingDTO adminBookingDetail(int bono) {
		// TODO Auto-generated method stub
		return mapper.adminBookingDetail(bono);
	}

	//예약 총액 계산하기
	@Override
	public int bototal() {
		// TODO Auto-generated method stub
		return mapper.bototal();
	}
	
	//지원자 목록
	@Override
	public ArrayList<EmployeeDTO> employeeList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		
		return mapper.employeeList(hm);
	}

	//전체 지원자 자료 수
	@Override
	public int emptotalCount() {
		// TODO Auto-generated method stub
		return mapper.emptotalCount();
	}

	//지원자 상세보기
	@Override
	public EmployeeDTO employeeDetail(int eno) {
		// TODO Auto-generated method stub
		return mapper.employeeDetail(eno);
	}

	//불합격
	@Override
	public int employeeNonPass(int eno) {
		// TODO Auto-generated method stub
		return mapper.employeeNonPass(eno);
	}

	//합격
	@Override
	public int employeePass(int eno) {
		// TODO Auto-generated method stub
		return mapper.employeePass(eno);
	}

	//선생님 테이블에 insert
	@Override
	public int employeeInsert(EmployeeDTO dto) {
		// TODO Auto-generated method stub
		return mapper.employeeInsert(dto);
	}

	//관리자 전용 키
	@Override
	public String login(KeyDTO dto) {
		// TODO Auto-generated method stub
		String result = null;
		
		if(dto.getKey().equals("admin")) {
			result = dto.getKey();
		}
		
		return result;
	}

	//지원자 전화번호
	@Override
	public String getEmployeePhone(int eno) {
		// TODO Auto-generated method stub
		return mapper.getEmployeePhone(eno);
	}

	//선생님 번호
	@Override
	public int getTeacherNo(String employeePhone) {
		// TODO Auto-generated method stub
		return mapper.getTeacherNo(employeePhone);
	}

	
}
