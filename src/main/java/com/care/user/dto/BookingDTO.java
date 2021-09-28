package com.care.user.dto;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class BookingDTO {
   
   private int boNo;
   private int tNo;
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
   private int pno;
   
   


}