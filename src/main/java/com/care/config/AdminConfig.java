package com.care.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages = {"com.care.admin.service"})
@MapperScan(basePackages = {"com.care.admin.mapper"})
@EnableAspectJAutoProxy
@EnableTransactionManagement
public class AdminConfig {

}
