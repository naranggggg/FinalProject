package com.kh.tinyfarm.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Notice {
	private int noticeNo; //공지사항 번호
	private String noticeType; //공지사항 분류(중요/일반)
	private String noticeWriter; 
	private String noticeTitle;
	private String noticeContent;
	private int count;
	private Date createDate;
	private String status;	
}