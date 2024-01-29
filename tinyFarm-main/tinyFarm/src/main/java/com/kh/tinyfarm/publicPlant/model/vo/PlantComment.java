package com.kh.tinyfarm.publicPlant.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PlantComment {
	private int ctpNo;//의견번호	CTP_NO NUMBER PRIMARY KEY,
	private int cntntsNo;//식물 컨텐츠 번호    CNTNTS_NO NUMBER NOT NULL,
	private int star;//    STAR NUMBER NOT NULL,
	private String commentWriter;//작성자    COMMENT_WRITER VARCHAR2(30) NOT NULL,
	private String commentContent;//내용    COMMENT_CONTENT VARCHAR2(1000) NOT NULL,
	private Date createDate;//작성일    CREATE_DATE DATE DEFAULT SYSDATE,
	private int totalCount;//총 리뷰 개수
}
