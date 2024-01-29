package com.kh.tinyfarm.mbti.model.service;

import java.util.ArrayList;

import com.kh.tinyfarm.mbti.model.vo.InGardenMbti;
import com.kh.tinyfarm.publicPlant.model.vo.InGardenPlantList;

public interface MbtiService {

	//추천식물리스트 컨텐츠번호 뽑기
	ArrayList<InGardenMbti> selectCntntsNo(InGardenMbti igm);
	
	
}
