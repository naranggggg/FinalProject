package com.kh.tinyfarm.publicPlant.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class GardeningDetail {
	private String cntntsSj; //제목
	private String cn; //내용
	private String updusrEsntlNm; //작성자
	private String svcDtx; //등록일
	private String cntntsRdcnt; //조회수

}
