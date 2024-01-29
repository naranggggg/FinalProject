package com.kh.tinyfarm.product.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tinyfarm.product.model.service.PaymentService;
import com.kh.tinyfarm.product.model.service.ProductService;
import com.kh.tinyfarm.product.model.vo.Payments;
import com.kh.tinyfarm.product.model.vo.Product;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService paymentservice;
	@Autowired
	private ProductService productservice;

	// 상품 결제 검증
	private IamportClient api;

	public PaymentController() { // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("4875025717472820",
				"8bn7YR4GpElv768ltDIlI58MyaAEsPFJz3C2QtAImrKEaqPjuswaPhU01b1CunViDvlz0OF8rnCBrchg");
	}

	@ResponseBody
	@RequestMapping(value = "verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
			@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		System.out.println(imp_uid);
		return api.paymentByImpUid(imp_uid);
	}

	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * orderForm() { return "product/productOrderForm"; }
	 */

	// 상품 결제 완료(DB에 넣기)
	@ResponseBody
	@RequestMapping(value = "paysuccess", method = RequestMethod.POST)
	public int paySuccess(@RequestBody Payments pm, HttpSession session) {

		int result = paymentservice.paySuccess(pm);

		// 상품 결제 시 상품 상태 변경
		int result2 = productservice.productStatus(pm);
		System.out.println("pm : " + pm);

		return result + result2;

	}

	  
	 

}
