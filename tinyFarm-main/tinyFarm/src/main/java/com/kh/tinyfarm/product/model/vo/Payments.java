package com.kh.tinyfarm.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Payments {

	private String paymentNo;
	private String paymentMethod;
	private int paymentPrice;
	private int productNo;
	private int userNo;
	private String buyerAddress;
	private String orderNo;
	private String buyerEmail;
	private String buyerPhone;
	private String buyerName;
	private String orderRequired;
	private String orderDate;
	private String productTitle;
	private String paymentStatus;
	private String salesStatus;
	
	//마이페이지에서 사진 불러오는 용도로 사용!(지수)
	private String filePath;
	private String changeName;
	
	
	


}
