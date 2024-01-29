package com.kh.tinyfarm.mbti.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InGardenMbti {
	private int cntntsNo; //컨텐츠 번호 
	private String managedemanddoCodeNm; // Management demand code name (관리요구도 코드명)
	private String grwtveCodeNm; // Growth velocity code name (생장속도 코드명)
}
