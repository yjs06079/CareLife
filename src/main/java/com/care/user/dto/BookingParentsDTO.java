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
public class BookingParentsDTO {
	
   private int pno;
   private String pname;
   private String pphone;
   private String psubphone;
   private int boNo;
   private int tno;
   private String boAddr;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date boDate;
   private int boTime;
   private int boHour;
   private String boRoadName;
   private String boRoadNameDetail;
   private String boRemarks;
   private int boCancel;
   private int boPayment;
   private int startrow;
   private int endrow;
}
