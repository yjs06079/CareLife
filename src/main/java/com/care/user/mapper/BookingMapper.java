package com.care.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.care.user.dto.BookingDTO;
import com.care.user.dto.UserParentsDTO;

@Mapper
public interface BookingMapper {

	int parentsInsert(UserParentsDTO dto);

	int bookingInsert(BookingDTO dto);

}
