package com.kh.tinyfarm.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.tinyfarm.common.model.vo.Attachment;
import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.product.model.vo.Category;
import com.kh.tinyfarm.product.model.vo.Like;
import com.kh.tinyfarm.product.model.vo.Payments;
import com.kh.tinyfarm.product.model.vo.Product;

public interface ProductService {

	//상품 수 조회
	int listCount(HashMap<String, String> map);

	//상품 리스트
	ArrayList<Product> selectList(PageInfo pi, HashMap<String, String> map);

	//상품 조회수 증가
	int increaseCount(int pno);

	//상품 조회
	Product selectProduct(int pno);
	
	//카테고리 조회
	ArrayList<Category> selectCategoryList();

	//상품등록
	int insertProduct(Product p);
	int insertAttachment(Attachment a);

	//상품 수정
	int updateProduct(Product p);
	int updateAttachment(Attachment a);

	//상품 삭제
	int deleteProduct(int pno);

	//상품 결제 시 상품 상태 변경
	int productStatus(Payments pm);

	//상품 좋아요 등록
	int insertLike(Like like);

	//상품 좋아요 해제
	int removeLike(Like like);

	//상품 좋아요 여부 조회하기
	int selectLikeYn(Product product);


	


	



}
