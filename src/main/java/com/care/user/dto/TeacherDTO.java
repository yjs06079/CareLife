package com.care.user.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TeacherDTO {

	private int tNo;
	private String tName;
	private String tAddr;
	private String tPhone;
	private String tInfo;
	private String tPhoto;
	
	
}
