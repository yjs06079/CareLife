package com.care.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.admin.mapper.AdminMapper;

@Service
public class AdminServiceImple implements AdminService {

	@Autowired
	private AdminMapper mapper;
}
