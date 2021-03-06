package com.care.user.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
import com.care.user.dto.SessionUserDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.util.MakePage;

@Mapper
public interface BookingMapper {

	int parentsInsert(UserParentsDTO userDTO);

	int bookingInsert(BookingDTO bookingDTO);

	List<BookingTeacherDTO> selectTeacher(BookingDTO BookingDTO);

	int getMyTotalCount(SessionUserDTO sessionUserDTO);
	
	BookingDTO selectBooking(int boNO);

	List<BookingParentsDTO> checkUser(HashMap<String, Object> hashMap);

	String checkTeacher(int tno);

	int sessionCheck(HashMap<String, String> hashMap);



	


}
