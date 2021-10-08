package com.care.user.service;

import java.util.List;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
import com.care.user.dto.SessionUserDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.util.MakePage;

public interface BookingService {

	public int parentsInsert(UserParentsDTO userDTO);

	public int bookingInsert(BookingDTO bookingDTO);

	public List<BookingTeacherDTO> selectTeacher(BookingDTO bookingTeacherDTO);

	public int getMyTotalCount(SessionUserDTO sessionUserDTO);

	public BookingDTO selectBooking(int boNO);

	public List<BookingParentsDTO> checkUser(String pname, String pphone,int startRow, int pageSize );

	public String checkTeacher(int boNo);

	public int sessionCheck(String pname, String pphone);


	
	
	
}
