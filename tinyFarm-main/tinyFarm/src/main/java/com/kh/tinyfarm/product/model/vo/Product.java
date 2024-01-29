package com.kh.tinyfarm.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.text.SimpleDateFormat;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Product {
	
//	PRODUCT_NO	NUMBER
//	USER_NO	NUMBER
//	CATEGORY_NO	NUMBER
//	PRODUCT_TITLE	VARCHAR2(100 BYTE)
//	PRODUCT_CONTENT	VARCHAR2(4000 BYTE)
//	PRODUCT_PRICE	NUMBER
//	COUNT	NUMBERRpo
//	REGI_DATE	DATE
//	MODI_DATE	DATE
//	STATUS	VARCHAR2(1 BYTE)
//	SALES_STATUS	VARCHAR2(1 BYTE)
	
	private int productNo;
	private int userNo;
	private int categoryNo;
	private String productTitle;
	private String productContent;
	private String productPrice;
	private int count;
	private String regiDate;
	private String modiDate;
	private String salesStatus;
	private String filePath;
	private String changeName;
	private String originName;
	private int likeCount;
	private String userId;
	private String categoryName;
	
	
	

	
}
