package com.kh.tinyfarm.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberModalController {

	@GetMapping("/modalDetail.me")
	public String memberModal() {
		return "member/memberModal";
		
	}
}
