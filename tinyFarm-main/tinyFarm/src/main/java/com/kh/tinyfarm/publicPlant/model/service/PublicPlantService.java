package com.kh.tinyfarm.publicPlant.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tinyfarm.publicPlant.model.vo.PlantComment;

public interface PublicPlantService {
	
	//식물 의견 추가
	int insertCommentToPlant(PlantComment pc);
	
	//식물 의견 리스트 가져오기
	ArrayList<PlantComment> selectComment(HashMap map);
	
	//식물 의견 테이블 내 해당 식물에 적힌 댓글 개수 가져오기
	int getCommentCount(int cntntsNo);
	
	//식물 의견 수정
	int updateComment(PlantComment pc);
	
	//식물 의견 삭제
	int deleteComment(int ctpNo);

}
