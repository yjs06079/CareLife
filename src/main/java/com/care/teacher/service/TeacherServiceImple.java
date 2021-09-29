package com.care.teacher.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.care.teacher.dto.TeacherDTO;
import com.care.teacher.mapper.TeacherMapper;

@Service("teacherservice")
public class TeacherServiceImple implements TeacherService{

	@Autowired @Qualifier("teacherMapper")
	private TeacherMapper mapper;
	
	@Override
	public List<TeacherDTO> teacherList(String searchtxt, int startRow, int endRow) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchtxt", searchtxt);
		hm.put("startrow", startRow);
		hm.put("endrow", endRow);
		
		return mapper.getList(hm);
	}

	@Override
	public int totalCount(String searchtxt) {
		// TODO Auto-generated method stub
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("searchtxt", searchtxt);
		
		int result = mapper.totalCount(hm);
		
		return result;
	}
	
	
}
