package com.care.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.user.mapper.BookingMapper;


@Service(value = "BookingService")
public class BookingServiceImple implements BookingService {

	@Autowired
	private BookingMapper mapper;
	
	@Override
	public int parentsInsert(UserParentsDTO userDTO) {
		
		return mapper.parentsInsert(userDTO);
		
	}

	@Override
	public int bookingInsert(BookingDTO dto) {
		
		return mapper.bookingInsert(dto);
	}

	@Override
	public List<BookingTeacherDTO> selectTeacher(BookingTeacherDTO bookingTeacherDTO) {

		return mapper.selectTeacher(bookingTeacherDTO);
	}


	@Override
	public List<BookingParentsDTO> bookingCheck(BookingParentsDTO bookingParentsDTO) {
		return mapper.bookingCheck(bookingParentsDTO);
	}

	@Override
	public int bookingDelete(BookingParentsDTO bookingParentsDTO) {
		return mapper.bookingDelete(bookingParentsDTO);
	}

	@Override
	public int getMyTotalCount(BookingParentsDTO bookingParentsDTO) {
		
		return mapper.getMyTotalCount(bookingParentsDTO);
	}




	
	
	
}
