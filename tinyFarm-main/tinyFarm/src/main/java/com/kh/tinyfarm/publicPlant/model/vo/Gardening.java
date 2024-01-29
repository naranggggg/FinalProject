package com.kh.tinyfarm.publicPlant.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Gardening {
	private String cntntsNo; //컨텐츠번호 
	private String cntntsSj; //컨텐츠명 
	private String updusrEsntlNm; //등록자 
	private String cntntsRdcnt;// 조회수 
	
	
}
