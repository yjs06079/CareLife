package com.care.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
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
	public List<BookingParentsDTO> bookingList(BookingParentsDTO bookingParentsDTO) {
		return mapper.bookingList(bookingParentsDTO);
	}

	@Override
	public int bookingDelete(BookingParentsDTO bookingParentsDTO) {
		return mapper.bookingDelete(bookingParentsDTO);
	}

	@Override
	public int getMyTotalCount(BookingParentsDTO bookingParentsDTO) {
		
		return mapper.getMyTotalCount(bookingParentsDTO);
	}
	

	@Override
	public BookingDTO selectBooking(int pno) {
		
		return mapper.selectBooking(pno);
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







	
	
	
}
