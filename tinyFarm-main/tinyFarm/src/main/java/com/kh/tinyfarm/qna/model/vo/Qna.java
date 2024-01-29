package com.kh.tinyfarm.qna.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Qna {

	//QNA
	private int qnaNo;
	private String userNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaCreatedate;
	
	//QNA_ANSWER
	private String qnaAnswerContent;
	private String qnaAnswerCreatedate;

}
