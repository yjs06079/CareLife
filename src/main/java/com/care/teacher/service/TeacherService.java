package com.care.teacher.service;

import java.util.List;

import com.care.teacher.dto.TeacherDTO;

public interface TeacherService {

	//선생님소개 리스트
	public List<TeacherDTO> teacherList(String searchtxt, int startRow, int endRow);
		
	public int totalCount(String searchtxt);
}
