package com.kh.tinyfarm.common.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tinyfarm.common.model.vo.Book;
import com.kh.tinyfarm.common.model.vo.PageInfo;

public interface BookService {

	//책 등록 메소드
	int insertBook(Book b);

	//책 개수
	int bookListCount(HashMap<String, String> bookMap);

	//책 리스트 조회
	ArrayList<Book> selectBookList(PageInfo pi, HashMap<String, String> bookMap);

	//책 상세 조회
	Book bookDetail(int bookNo);

	//조회수 증가
	int increaseCount(int bookNo);

	//책 수정
	int bookUpdate(Book book);

	//책 삭제
	int bookDelete(int bookNo);
}
