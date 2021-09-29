package com.care.user.service;

import java.util.List;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.TeacherDTO;
import com.care.user.dto.UserParentsDTO;

public interface BookingService {

	public int parentsInsert(UserParentsDTO userDTO);

	public int bookingInsert(BookingDTO bookingDTO);

	public List<BookingDTO> selectTeacher(BookingDTO bookingDTO);

	public List<BookingParentsDTO> bookingCheck(BookingParentsDTO bookingParentsDTO);

	public int bookingDelete(BookingParentsDTO bookingParentsDTO);

	public int getMyTotalCount(BookingParentsDTO bookingParentsDTO);


 
	
	
	
}
