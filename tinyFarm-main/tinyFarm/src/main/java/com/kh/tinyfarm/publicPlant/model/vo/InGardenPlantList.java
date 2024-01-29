package com.kh.tinyfarm.publicPlant.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class InGardenPlantList {
	private int cntntsNo; //컨텐츠 번호 12938
	private String cntntsSj;//식물명 가울테리아
	private String rtnFileUrlStr;
	private String[] rtnFileUrl; //저장 파일 URL
	private String[] rtnImgSeCode; //파일구분코드 209002|209002|209002|209002|209002|209002|209006
	private String[] rtnThumbFileUrl; //썸네일 url
	
	private String detailImg;
	
}
