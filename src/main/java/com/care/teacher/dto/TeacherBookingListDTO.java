package com.care.teacher.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TeacherBookingListDTO {

	private int tno;
	private String tname;
	private String pname;
	private String pphone;
	private String psubphone;
	private int boNo;
	private String boAddr;
	private Date boDate;
	private int boTime;
	private int boHour;
	private String boRoadName;
	private String boRoadNameDetail;
	private String boRemarks;
	private String boCancel;
	
}
