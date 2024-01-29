package com.kh.tinyfarm.follow.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Follow {
	
	private String userId;
	private String followingId;
	private int userNo;
	private int boardNo;
}
