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
public class BookingDTO {
   
   private int boNo;
   private int tNo;
   private String boAddr;
   private Date boDate;
   private int boTime;
   private int boHour;
   private String boRoadName;
   private String boRemarks;
   private int boCancel;
   private int boPayment;
   


}