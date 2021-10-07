package com.care.teacher.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.care.teacher.dto.LoginDTO;
import com.care.teacher.dto.TeacherBookingListDTO;
import com.care.teacher.dto.TeacherCancelDTO;
import com.care.teacher.dto.TeacherDTO;
import com.care.teacher.mapper.TeacherMapper;
import com.care.util.MakePage;

@Service("teacherservice")
public class TeacherServiceImple implements TeacherService{

	@Autowired @Qualifier("teacherMapper")
	private TeacherMapper mapper;
	
	@Override
	public List<TeacherDTO> teacherList(String searchtxt, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		
		return mapper.getList(hm);
	}

	@Override
	public int totalCount(String searchtxt) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchtxt", searchtxt);
		
		int result = mapper.totalCount(hm);
		
		return result;
	}

	//선생님 로그인
	@Override
	public ArrayList<LoginDTO> getBookingList(LoginDTO dto) {
		// TODO Auto-generated method stub
		return mapper.getBookingList(dto);
	}

	//선생님 예약 조회
	@Override
	public ArrayList<TeacherBookingListDTO> teacherBookingList(TeacherBookingListDTO dto, int startRow, int pageSize) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("dto", dto);
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		
		return mapper.teacherBookingList(hm);
	}

	//예약 자료 개수
	@Override
	public int bookingTotalCount() {
		// TODO Auto-generated method stub
		return mapper.bookingTotalCount();
	}
		
	//예약 상세 페이지
	@Override
	public TeacherBookingListDTO teacherBookingDetail(int boNo) {
		// TODO Auto-generated method stub
		return mapper.teacherBookingDetail(boNo);
	}

	//예약 취소
	@Override
	public int teacherBookingCancel(int boNo) {
		// TODO Auto-generated method stub
		return mapper.teacherBookingCancel(boNo);
	}

	//취소 문자
	@Override
	public TeacherCancelDTO bookingCancelSMS(int boNo) {
		// TODO Auto-generated method stub
		return mapper.bookingCancelSMS(boNo);
	}


}
