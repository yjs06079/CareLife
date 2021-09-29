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

	private int tno;
	private String tname;
	private String taddr;
	private String tphone;
	private String tinfo;
	private String tphoto;
	
	
}
