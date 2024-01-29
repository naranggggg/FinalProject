package com.kh.tinyfarm.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ReplyReport {
	private int reportNo;//REPORT_NO
	private String reportWriter;//	REPORT_WRITER
	private int refRno;//	REF_RNO
	private String category;//	CATEGORY
	private String reportContent;//	REPORT_CONTENT
	private String createDate;//	CREATE_DATE
	private String status;//	STATUS
	
	


}
