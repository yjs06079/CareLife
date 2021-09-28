package com.care.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.BookingParentsDTO;
import com.care.user.dto.TeacherDTO;
import com.care.user.dto.UserParentsDTO;

@Mapper
public interface BookingMapper {

	int parentsInsert(UserParentsDTO dto);

	int bookingInsert(BookingDTO dto);

	List<BookingDTO> selectTeacher(BookingDTO dto);

	List<BookingParentsDTO> bookingCheck(BookingParentsDTO DTO);

	int bookingDelete(BookingParentsDTO DTO);

	int getMyTotalCount(BookingParentsDTO DTO);

}
