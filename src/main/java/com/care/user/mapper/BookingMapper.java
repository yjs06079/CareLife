package com.care.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.BookingTeacherDTO;
import com.care.user.dto.UserParentsDTO;

@Mapper
public interface BookingMapper {

	int parentsInsert(UserParentsDTO userDTO);

	int bookingInsert(BookingDTO bookingDTO);

	List<BookingTeacherDTO> selectTeacher(BookingTeacherDTO bookingTeacherDTO);

	List<BookingParentsDTO> bookingCheck(BookingParentsDTO bookingParentsDTO);

	int bookingDelete(BookingParentsDTO bookingParentsDTO);

	int getMyTotalCount(BookingParentsDTO bookingParentsDTO);


}
