
package com.kh.tinyfarm.product.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.product.model.dao.PaymentDao;
import com.kh.tinyfarm.product.model.vo.Payments;
import com.kh.tinyfarm.product.model.vo.Product;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDao paymentDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	//결제 정보 등록
	@Override
	public int paySuccess(Payments pm) {
		
		return paymentDao.paySuccess(sqlSession, pm);

	}



}
 
