package com.kh.tinyfarm.experience.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Experience {

	private String cntntsNo; //컨텐츠 번호
	private String cntntsSj; //제목
	private String locplc; //소재지
	private String thema; //주제
	private String appnYear; //지정연도
	private String url; //홈페이지 주소
	private String telno; //연락처
	private String crtfcYearInfo; //품질인증연도
	private String cn; //내용
	private String imgUrl1; //이미지 주소 1
	private String imgUrl2; //이미지 주소 1
	private String imgUrl3; //이미지 주소 1
	private String imgUrl4; //이미지 주소 1
	private String imgUrl5; //이미지 주소 1
	private String imgUrl6; //이미지 주소 1

}
