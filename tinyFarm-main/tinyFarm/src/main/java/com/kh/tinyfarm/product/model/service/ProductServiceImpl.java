package com.kh.tinyfarm.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.common.model.vo.Attachment;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.product.model.dao.ProductDao;
import com.kh.tinyfarm.product.model.vo.Category;
import com.kh.tinyfarm.product.model.vo.Like;
import com.kh.tinyfarm.product.model.vo.Payments;
import com.kh.tinyfarm.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//상품 전체 개수
	@Override
	public int listCount(HashMap<String, String> map) {
		
		return productDao.listCount(sqlSession, map);
	}
	


	//상품 리스트
	@Override
	public ArrayList<Product> selectList(PageInfo pi, HashMap<String, String> map) {
		
		return productDao.selectList(sqlSession, pi, map);
	}

	//상품 조회수 증가
	@Override
	public int increaseCount(int pno) {
		
		return productDao.increaseCount(sqlSession,pno);
	}

	//상품 조회
	@Override
	public Product selectProduct(int pno) {
		
		return productDao.selectProduct(sqlSession,pno);
	}
	
	//카테고리 조회
	@Override
	public ArrayList<Category> selectCategoryList() {
		
		return productDao.selectCategoryList(sqlSession);
	}

	//상품 등록
	@Override
	public int insertProduct(Product p) {
		
		return productDao.insertProduct(sqlSession,p);
	}


	@Override
	public int insertAttachment(Attachment a) {
		
		return productDao.insertAttachment(sqlSession,a);
	}


	//상품 수정
	@Override
	public int updateProduct(Product p) {
		
		return productDao.updateProduct(sqlSession,p);
	}

	@Override
	public int updateAttachment(Attachment a) {
		
		return productDao.updateAttachment(sqlSession, a);
	}

	//상품 삭제
	@Override
	public int deleteProduct(int pno) {
		
		return productDao.deleteProduct(sqlSession, pno);
	}


	//상품 결제 시 상품 상태 변경
	@Override
	public int productStatus(Payments pm) {

		return productDao.productStatus(sqlSession, pm);
	}


	//상품 좋아요 등록
	@Override
	public int insertLike(Like like) {
		
		return productDao.insertLike(sqlSession, like);
	}

	//상품 좋아요 해제
	@Override
	public int removeLike(Like like) {
		
		return productDao.removeLike(sqlSession, like);
	}

	
	//상품 좋아요 여부 조회	
	@Override
	public int selectLikeYn(Product product) {
		return productDao.selectLikeYn(sqlSession, product);
	}







}
