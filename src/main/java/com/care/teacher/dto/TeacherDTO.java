package com.care.teacher.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TeacherDTO {

	private int tno;
	private String tname;
	private String taddr;
	private String tphone;
	private String tinfo;
	private String tphoto;
}
