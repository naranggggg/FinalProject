package com.kh.tinyfarm.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Book {
	private int bookNo;
	private String bookTitle;
	private String bookCategory;
	private String bookInfo;
	private String bookAuthor;
	private String publisher;
	private String bookPrice;
	private String bookOriginName;
	private String bookChangeName;
	private Date bookDate;
	private int bookCount;
}
