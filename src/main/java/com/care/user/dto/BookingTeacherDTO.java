package com.care.user.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class BookingTeacherDTO {
	

	
   private String boAddr;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date boDate;
   private int boTime;
   private int tno;
   private String tname;
   private String taddr;
   private String tinfo;
   private String tphoto;
   

  
}
