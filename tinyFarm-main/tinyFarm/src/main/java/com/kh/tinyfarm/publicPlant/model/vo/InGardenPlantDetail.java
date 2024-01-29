package com.kh.tinyfarm.publicPlant.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class InGardenPlantDetail {
	private int cntntsNo;//컨텐츠 번호 
	private String plntzrNm;//식물영 명
	private String distbNm; //유통 명
	private String fmlNm; //과 명
	private String fmlCodeNm;//과 코드명
	private String adviseInfo;//조언정보
	private String growthHgInfo; // Growth height information (성장 높이 정보)
	private String growthAraInfo; // Growth area information (성장 넓이 정보)
	private String lefStleInfo; // Leaf shape information (잎 형태 정보)
	private String smellCodeNm; // Smell code name (냄새 코드 명)
	private String prpgtEraInfo; // Propagation era information (번식 시기 정보)
	private String etcEraInfo; // Other era information (기타 시기 정보)
	private String managelevelCodeNm; // Management level code name (관리수준 코드명)
	private String grwtveCodeNm; // Growth velocity code name (생장속도 코드명)
	private String grwhTpCodeNm; // Growth temperature code name (생육 온도 코드명)
	private String winterLwetTpCodeNm; // Winter minimum temperature code name (겨울 최저 온도 코드명)
	private String hdCodeNm; // Humidity code name (습도 코드명)
	private String frtlzrInfo; // Fertilizer information (비료 정보)
	private String soilInfo; // Soil information (토양 정보)
	private String watercycleSprngCodeNm; // Water cycle in spring code name (물주기 봄 코드명)
	private String watercycleSummerCodeNm; // Water cycle in summer code name (물주기 여름 코드명)
	private String watercycleAutumnCodeNm; // Water cycle in autumn code name (물주기 가을 코드명)
	private String watercycleWinterCodeNm; // Water cycle in winter code name (물주기 겨울 코드명)
	private String dlthtsManageInfo; // Disease and pests management information (병충해 관리 정보)
	private String speclmanageInfo; // Special management information (특별관리 정보)
	private String fncltyInfo; // Functionality information (기능성 정보)
	private String managedemanddoCodeNm; // Management demand code name (관리요구도 코드명)
	private String clCodeNm; // Classification code name (분류 코드명)
	private String grwhstleCodeNm; // Growth style code name (생육형태 코드명)
	private String indoorpsncpacompositionCodeNm; // Indoor garden composition code name (실내정원구성 코드명)
	private String eclgyCodeNm; // Ecology code name (생태 코드명)

	
}
