package com.care.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.TeacherDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.user.mapper.BookingMapper;


@Service(value = "BookingService")
public class BookingServiceImple implements BookingService {

	@Autowired
	private BookingMapper mapper;
	
	@Override
	public int parentsInsert(UserParentsDTO dto) {
		
		return mapper.parentsInsert(dto);
		
	}

	@Override
	public int bookingInsert(BookingDTO dto) {
		
		return mapper.bookingInsert(dto);
	}

	@Override
	public List<BookingDTO> selectTeacher(BookingDTO dto) {

		return mapper.selectTeacher(dto);
	}

	
	
	
	
}