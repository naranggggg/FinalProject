package com.kh.tinyfarm.mbti.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class GardenFile {
	private int cntntsNo;  //컨텐츠 번호
	private String cntntsSj;  //식물 이름
	private String rtnFileUrlStr;
	private String[] rtnFileUrl; //저장 파일 URL
	private String[] rtnImgSeCode; //이미지구분코드
	private String[] rtnThumbFileUrl; //썸네일 파일 URL
}
