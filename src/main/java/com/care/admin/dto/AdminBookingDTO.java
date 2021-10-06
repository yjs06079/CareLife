package com.care.admin.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminBookingDTO {

   private int bono; //예약번호
   private int pno; //회원번호
   private String pname; //부모이름(예약자명)
   private int tno; //선생님 사원번호
   private String tname; //선생님이름
   private String bopayment; //결제금액
   
   private int bototal; //총액 구하기
   
   private String pphone;
   private String psubphone;
   private Date bodate;
   private int botime;
   private int bohour;
   private String boroadname;
   private String boremarks;
}