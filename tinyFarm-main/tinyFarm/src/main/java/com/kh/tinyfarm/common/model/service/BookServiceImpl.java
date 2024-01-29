package com.kh.tinyfarm.common.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.common.model.dao.BookDao;
import com.kh.tinyfarm.common.model.vo.Book;
import com.kh.tinyfarm.common.model.vo.PageInfo;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao bookDao;
	
	 @Autowired
	 private SqlSessionTemplate sqlSession;
	
	 // 생성자 추가
    public BookServiceImpl() {
        System.out.println("MemberServiceImpl 생성자 호출");
    }

	@Override
	public int insertBook(Book b) {
		return bookDao.insertBook(sqlSession, b);
	}

	
	
	//책 개수
	@Override
	public int bookListCount(HashMap<String, String> bookMap) {
		return bookDao.bookListCount(sqlSession, bookMap);
	}

	//책 목록
	@Override
	public ArrayList<Book> selectBookList(PageInfo pi, HashMap<String, String> bookMap) {
		return bookDao.selectBookList(sqlSession, pi, bookMap);
	}

	
	
	//책 상세 조회
	@Override
	public Book bookDetail(int bookNo) {
		return bookDao.bookDetail(sqlSession, bookNo);
	}

	
	//조회수 증가
	@Override
	public int increaseCount(int bookNo) {
		return bookDao.increaseCount(sqlSession, bookNo);
	}

	
	//책 수정
	@Override
	public int bookUpdate(Book book) {
		return bookDao.bookUpdate(sqlSession, book);
	}

	
	//책 삭제
	@Override
	public int bookDelete(int bookNo) {
		return bookDao.bookDelete(sqlSession, bookNo);
	}
	
	
	
	
	
	
	
}
