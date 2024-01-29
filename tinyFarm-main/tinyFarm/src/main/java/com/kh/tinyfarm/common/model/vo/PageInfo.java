package com.kh.tinyfarm.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageInfo {
	private int listCount; //총 게시글 개수
	private int currentPage; //현재 페이지
	private int pageLimit; //페이지 하단에 보여질 페이징바의 최대 갯수
	private int boardLimit; //한페이지에 보여질 게시글 개수
	
	private int maxPage; //가장 마지막 페이징바가 몇번인지 (총 페이지수)
	private int startPage; //페이지 하단에 보여질 페이징바의 시작수
	private int endPage; //페이지 하단에 보여질 페이징바의 끝수
	
	
}
