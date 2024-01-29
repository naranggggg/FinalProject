package com.kh.tinyfarm.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Like {
	
//	PRODUCT_NO	NUMBER
//	USER_NO	NUMBER
//	LIKE_NO
	
	private int productNo;
	private int userNo;
	private int likeNo;
	
	

}
