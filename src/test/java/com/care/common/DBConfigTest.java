package com.care.common;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.care.common.config.DBConfig;
import com.zaxxer.hikari.HikariDataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfig.class})
public class DBConfigTest {

	@Autowired
	private HikariDataSource ds;
	
//	@Autowired
//	private SqlSessionFactory factory;
	
	@Test
	public void dsTest() {
		assertNotNull(ds);
		assertEquals("mydb", ds.getUsername());
//		assertNotNull(factory);
	}
}
