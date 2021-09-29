package com.care.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.TeacherDTO;
import com.care.user.dto.UserParentsDTO;

@Mapper
public interface BookingMapper {

	int parentsInsert(UserParentsDTO userDTO);

	int bookingInsert(BookingDTO bookingDTO);

	List<BookingDTO> selectTeacher(BookingDTO bookingDTO);

	List<BookingParentsDTO> bookingCheck(BookingParentsDTO bookingParentsDTO);

	int bookingDelete(BookingParentsDTO bookingParentsDTO);

	int getMyTotalCount(BookingParentsDTO bookingParentsDTO);


}
