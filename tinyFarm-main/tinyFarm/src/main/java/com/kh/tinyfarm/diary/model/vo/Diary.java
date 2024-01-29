package com.kh.tinyfarm.diary.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Diary {
	private int diaryNo;
	private String categoryNo; //조회시엔 이름으로
	private int diaryWriter;
	private String selectDate;
	private String diaryTitle;
	private String diaryContent;
	private String selectOpen;
	private String createDate;
	private String status;
	private int likeCount;
}


