package com.care.user.service;

import java.util.List;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.util.MakePage;

public interface BookingService {

	public int parentsInsert(UserParentsDTO userDTO);

	public int bookingInsert(BookingDTO bookingDTO);

	public List<BookingTeacherDTO> selectTeacher(BookingDTO bookingTeacherDTO);

	public List<BookingParentsDTO> bookingList(BookingParentsDTO bookingParentsDTO);

	public int bookingDelete(BookingParentsDTO bookingParentsDTO);

	public int getMyTotalCount(BookingParentsDTO bookingParentsDTO);

	public BookingDTO selectBooking(int boNO);

	public List<BookingParentsDTO> checkUser(String pname, String pphone,int startRow, int pageSize );

	public String checkTeacher(int boNo);

	public int bookingCancel(int boNo);
	

 
	
	
	
}
