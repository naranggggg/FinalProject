package com.kh.tinyfarm.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class BoardReply {
	private int replyNo;
	private int refBno;
	private String replyWriter;
	private String replyContent;
	private int likeCount;
	private String createDate;
	private String status;
	private String profile;
	
	
}
