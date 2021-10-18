package com.care.teacher.service;

import java.util.ArrayList;
import java.util.List;

import com.care.teacher.dto.LoginDTO;
import com.care.teacher.dto.TeacherBookingListDTO;
import com.care.teacher.dto.TeacherCancelDTO;
import com.care.teacher.dto.TeacherDTO;
import com.care.util.MakePage;

public interface TeacherService {

	//선생님소개 리스트
	public List<TeacherDTO> teacherList(String searchtxt, int startRow, int endRow);
		
	public int totalCount(String searchtxt);

	//선생님 개수
	public int teacherCount(int tno, String tname);
		
	//선생님 예약 조회
	public ArrayList<TeacherBookingListDTO> teacherBookingList(TeacherBookingListDTO dto, int startRow, int pageSize);
	
	//예약 자료 개수
	public int bookingTotalCount();

	//예약 상세 페이지
	public TeacherBookingListDTO teacherBookingDetail(int boNo);

	//예약 취소
	public int teacherBookingCancel(int boNo);

	//취소 문자
	public TeacherCancelDTO bookingCancelSMS(int boNo);

}
