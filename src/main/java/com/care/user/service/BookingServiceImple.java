package com.care.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
import com.care.user.dto.SessionUserDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.user.mapper.BookingMapper;
import com.care.util.MakePage;


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
	public List<BookingTeacherDTO> selectTeacher(BookingDTO BookingDTO) {

		return mapper.selectTeacher(BookingDTO);
	}

	@Override
	public int getMyTotalCount(SessionUserDTO sessionUserDTO) {
		
		return mapper.getMyTotalCount(sessionUserDTO);
	}
	

	@Override
	public BookingDTO selectBooking(int boNO) {
		
		return mapper.selectBooking(boNO);
	}

	@Override
	public List<BookingParentsDTO> checkUser(String pname, String pphone,int startRow, int pageSize) {
		
		HashMap<String, Object> hashMap = new HashMap<>();
		
		hashMap.put("pname", pname);
		hashMap.put("pphone", pphone);
		hashMap.put("startRow", startRow);
		hashMap.put("pageSize", pageSize);
		
		
		return mapper.checkUser(hashMap);
	}

	@Transactional
	@Override
	public String checkTeacher(int boNo) {	
	BookingDTO dto = mapper.selectBooking(boNo);
	 String tname  = mapper.checkTeacher(dto.getTno());
		return tname;
	}

	@Override
	public int sessionCheck(String pname, String pphone) {
		
		//파라미터 2개는 hashMap
		HashMap<String, String> hashMap = new HashMap<>();
		
		hashMap.put("pname", pname);
		hashMap.put("pphone", pphone);

		
		return mapper.sessionCheck(hashMap);
	}



	
	
}
