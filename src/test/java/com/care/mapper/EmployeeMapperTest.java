package com.care.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.care.config.DBConfig;
import com.care.config.EmployeeConfig;
import com.care.employee.mapper.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfig.class, EmployeeConfig.class})
public class EmployeeMapperTest {
	
	@Autowired
	private EmployeeMapper mapper;
	
	@Test
	public void test() {
		assertNotNull(mapper);
	}
	
	
}
