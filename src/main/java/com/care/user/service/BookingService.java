package com.care.user.service;

import java.util.List;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.TeacherDTO;
import com.care.user.dto.UserParentsDTO;

public interface BookingService {

	public int parentsInsert(UserParentsDTO dto);

	public int bookingInsert(BookingDTO dto);

	public List<BookingDTO> selectTeacher(BookingDTO dto);
 
	
	
	
}
