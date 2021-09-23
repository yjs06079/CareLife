package com.care.user.service;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.UserParentsDTO;

public interface BookingService {

	public int parentsInsert(UserParentsDTO dto);

	public int bookingInsert(BookingDTO dto);
 
	
	
	
}
