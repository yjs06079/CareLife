package com.care.user.dto;

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
public class UserParentsDTO {

	private int pNo;
	private String pName;
	private String pPhone;
	private String pSubPhone;
}
