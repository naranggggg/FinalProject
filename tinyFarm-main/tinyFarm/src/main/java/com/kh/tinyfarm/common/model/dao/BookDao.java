package com.kh.tinyfarm.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.common.model.vo.Book;
import com.kh.tinyfarm.common.model.vo.PageInfo;

@Repository 
public class BookDao {

	//회원가입
	public int insertBook(SqlSessionTemplate sqlSession, Book b) {
		return sqlSession.insert("bookMapper.insertBook", b);
	}

	
	//책 개수 세기
	public int bookListCount(SqlSessionTemplate sqlSession, HashMap<String, String> bookMap) {
		return sqlSession.selectOne("bookMapper.bookListCount", bookMap);
	}


	
	//책 목록
	public ArrayList<Book> selectBookList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> bookMap) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectBookList", bookMap, rowBounds);
	}

	
	//책 상세 조회하기
	public Book bookDetail(SqlSessionTemplate sqlSession, int bookNo) {
		return sqlSession.selectOne("bookMapper.bookDetail", bookNo);
	}


	//조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int bookNo) {
		return sqlSession.update("bookMapper.increaseCount", bookNo);
	}

	
	//책 수정
	public int bookUpdate(SqlSessionTemplate sqlSession, Book book) {
		return sqlSession.update("bookMapper.bookUpdate", book);
	}
	

	//책 삭제
	public int bookDelete(SqlSessionTemplate sqlSession, int bookNo) {
		return sqlSession.delete("bookMapper.bookDelete", bookNo);
	}


	
	
	
	
	
}
