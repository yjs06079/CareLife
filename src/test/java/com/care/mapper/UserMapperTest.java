package com.care.mapper;

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
		
		UserParentsDTO dto = UserParentsDTO.builder().pName("h").pPhone("0108560").pSubPhone("123").build();
		mapper.parentsInsert(dto);
		log.info(mapper.parentsInsert(dto));
				
	}
	
	
	
	@Test
	public void payTest() {
		
		BookingDTO dto = BookingDTO.builder().boHour(1).build();

		 mapper.payment(dto);
		 log.info("payyyyyy"+dto.getBoHour());
			log.info("payyyyyy"+dto.getBoPayment());
	}
}
