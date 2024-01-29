package com.kh.tinyfarm.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Category {
//	CATEGORY_NO	NUMBER
//	CATEGORY_NAME	VARCHAR2(30 BYTE)
	
	private int categoryNo;
	private String categoryName;

}
