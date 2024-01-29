package com.kh.tinyfarm.experience.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ExperienceListVo {

	private String cntntsNo;//cntntsNo 컨텐츠 번호
	private String cntntsSj;//cntntsSj 제목
	private String adstrdName;//adstrdName 지역명
	private String locplc;//locplc 소재지
	private String thema;//thema 주제
	private String telno;//telno 연락처
	private String thumbImgUrl;//thumbImgUrl 썸네일 이미지 파일경로
	private String imgUrl;//imgUrl 이미지 파일경로

}
