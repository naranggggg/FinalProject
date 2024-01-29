
package com.kh.tinyfarm.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.product.model.vo.Payments;
import com.kh.tinyfarm.product.model.vo.Product;

@Repository public class PaymentDao {

	//결제 정보 등록
	public int paySuccess(SqlSessionTemplate sqlSession, Payments pm) {
		
		return sqlSession.insert("productMapper.paySuccess", pm);
	}


	 
  

  
  }
 
