package com.care.teacher.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.care.teacher.dto.TeacherDTO;

@Mapper
public interface TeacherMapper {

	public List<TeacherDTO> getList(HashMap<String, Object> hm);
	
	public int totalCount(HashMap<String, Object> hm);

}
