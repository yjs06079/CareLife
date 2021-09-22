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

	private int boNo;
	private String boName;
	private String boPhone;
	private String boSubPhone;
}
