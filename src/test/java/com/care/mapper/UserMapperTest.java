package com.care.mapper;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.care.config.DBConfig;
import com.care.config.UserConfig;
import com.care.user.dto.BookingDTO;
import com.care.user.dto.UserParentsDTO;
import com.care.user.mapper.BookingMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfig.class, UserConfig.class})
@Log4j
public class UserMapperTest {

	
	@Autowired
	BookingMapper mapper;
	
	@Test
	public void insertTest() {
		
		UserParentsDTO dto = UserParentsDTO.builder().pname("h").pphone("0108560").psubPhone("123").build();
		mapper.parentsInsert(dto);
		log.info(mapper.parentsInsert(dto));
				
	}
	
	
	@Test
	public void seleteTeacherTest() {
		
		 //boAddr , bo_date as boDate , bo_time as boTime


		

		SimpleDateFormat format1 = new SimpleDateFormat ( "2021-09-22");
				
		Date time = new Date();
		
		time.getTimezoneOffset();
				
		String time1 = format1.format(time);
		
		
		BookingDTO dto = BookingDTO.builder()
				.boAddr("강동구")
				.boDate(time)
				.boTime(0)
				.build();
		
		
		List<BookingDTO> list = mapper.selectTeacher(dto);
		log.info(list.size());
		log.info(time);
		
		
				
	}

}
