package com.care.employee.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class ApplyCheckDTO {
	private String ename;
	private String ebirth;
	private String ephone;
	private int epass;
}
