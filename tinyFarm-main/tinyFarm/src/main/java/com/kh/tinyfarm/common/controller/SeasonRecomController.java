package com.kh.tinyfarm.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SeasonRecomController {

	// 계절 선택 페이지
	 @RequestMapping("/season.re")
	    public String loginPage() {
	        return "season/seasonBlog";  
	    }
	 
	// 봄 페이지
	@RequestMapping("/spring.re")
	public String springPage() {
		return "season/springRec";  
	}
		 
	// 여름 페이지
	@RequestMapping("/summer.re")
	public String summerPage() {
		return "season/summerRec";  
	}
	 
	// 가을 페이지
	@RequestMapping("/fall.re")
	public String fallPage() {
		return "season/fallRec";  
	}
	 	 
	// 겨울 페이지
	@RequestMapping("/winter.re")
	public String winterPage() {
		return "season/winterRec";  
	}
}
