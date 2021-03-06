package com.care.teacher.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.care.teacher.dto.LoginDTO;
import com.care.teacher.dto.TeacherBookingListDTO;
import com.care.teacher.dto.TeacherCancelDTO;
import com.care.teacher.dto.TeacherDTO;

@Mapper
public interface TeacherMapper {

	public List<TeacherDTO> getList(HashMap<String, Object> hm);
	
	public int totalCount(HashMap<String, Object> hm);

	//선생님 개수
	public int teacherCount(HashMap<String, Object> hm);
	
	//선생님 예약조회
	public ArrayList<TeacherBookingListDTO> teacherBookingList(HashMap<String, Object> hm);

	//예약 자료 개수
	public int bookingTotalCount(HashMap<String, Object> hm);
	
	//예약 상세 페이지
	public TeacherBookingListDTO teacherBookingDetail(int boNo);

	//예약 취소
	public int teacherBookingCancel(int boNo);

	//취소 문자
	public TeacherCancelDTO bookingCancelSMS(int boNo);

}
