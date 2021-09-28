package com.care.user.service;

import java.util.List;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.TeacherDTO;
import com.care.user.dto.UserParentsDTO;

public interface BookingService {

	public int parentsInsert(UserParentsDTO dto);

	public int bookingInsert(BookingDTO dto);

	public List<BookingDTO> selectTeacher(BookingDTO dto);

	public BookingDTO payment(BookingDTO bDTO);

	public List<BookingParentsDTO> bookingCheck(BookingParentsDTO DTO);

	public int bookingDelete(BookingParentsDTO DTO);

	public int getMyTotalCount(BookingParentsDTO DTO);

 
	
	
	
}
