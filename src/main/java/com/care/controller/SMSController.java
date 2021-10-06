package com.care.controller;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.util.Coolsms;


@Controller
public class SMSController {

	@GetMapping("/usermain/message/sendsms")
	public @ResponseBody String sendSMS(String phoneNumber) {
		
		
		Random rand = new Random();
		String numStr = "";
		
		for(int i=0; i<6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		
		Coolsms.certifiedPhoneNumber(phoneNumber, numStr);
		
		return numStr;
	}
	
}
