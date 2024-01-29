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
public class Board {
	private int boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private int count;
	private int likeCount;
	private String createDate;
	private String status;
	private String hashTag;
	
	private String titleImg;
	private String profile;
	private int replyCount;
	private String email;
	private String userName;
	private String searchText;
	private String searchHash;
}
