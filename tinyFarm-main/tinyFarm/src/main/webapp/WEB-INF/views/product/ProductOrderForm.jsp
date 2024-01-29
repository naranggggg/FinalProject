<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>작은농장</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/scss/style.css">
    
    <!-- jQuery -->
  	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->


</head>

<body>

	<%@include file="/WEB-INF/views/common/header.jsp" %>

    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="img/core-img/leaf.png" alt="">
        </div>
    </div>

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
            <h2>작물 결제</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="plist.bo">작물거래</a></li>
                            <li class="breadcrumb-item active" aria-current="page">작물결제</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Cart Area Start ##### --> 
    <div class="cart-area section-padding-0-100 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="cart-table2 clearfix">
                        <table class="table table-responsive">
<!--                         	<colgroup>
                        		<col width="10%">
                        		<col width="auto%">
                        		<col width="5%">
                        		<col width="5%">
                        		<col width="5%">
                        		<col width="5%">
                        	</colgroup> -->
                            <thead align="center">
                                <tr>
                                    <th></th>
                                    <th>상품</th>
                                    <th>상품명</th>
                                    <th>가격</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody align="center">
                                <tr>
                                    
                                    <!-- 상품 수량 조절 -->
                                    
                                    <td class="qty">
                                    </td>
                                    <td class="cart_product_img">
                                        <img src="${p.filePath}${p.changeName}" alt="Product" style="width:200px; height: 250px;">
                                    </td>
                                    <td><h5 style="margin-left: 50px;">${p.productTitle}</h5></td>
                                    <td class="price"><span>${p.productPrice}</span></td>
                                    <td class="total_price"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
          </div>
        </div>

            <!-- ##### Checkout Area Start ##### -->
    <div class="checkout_area mb-100">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12 col-lg-7">
                    <div class="checkout_details_area clearfix">
                        <h5>배송 정보</h5>
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="first_name">수령인</label>
                                    <input type="text" class="form-control" id="first_name" value="${loginUser.userName}" placeholder="필수 입력 사항 입니다." required>
                                </div>
                                <div class="col-12 mb-4">
                                    <label for="phone_number">이메일</label>
                                    <input type="text" class="form-control" id="email" min="0" value="${loginUser.email}" placeholder="필수 입력 사항 입니다." required>
                                </div>
                                <div class="col-12 mb-4">
                                    <label for="phone_number">연락처</label>
                                    <input type="text" class="form-control" id="phone_number" min="0" value="${loginUser.phone}" placeholder="필수 입력 사항 입니다." required>
                                </div>
                                <div class="col-12 mb-4">
                                    <label for="company">주소</label>
                                    <input type="text" class="form-control" id="address" value="${loginUser.address}" placeholder="필수 입력 사항 입니다." required>
                                </div>
                                <div class="col-md-12 mb-4">
                                    <label for="order-notes">배송 메모</label>
                                    <textarea class="form-control" id="order-notes" cols="30" rows="10" placeholder="배송 시 전달 사항을 적어주세요." style = "resize: none;"></textarea>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-12 col-lg-4">
                    <div class="checkout-content">
                        <h5 class="title--">주문 정보</h5>
                        <div class="products">
                            <div class="products-data">
                                <h5>상품 가격</h5>
                                <br>
                                <div class="single-products d-flex justify-content-between align-items-center">
                                    <p>${p.productTitle}</p>
                                    <h5>${p.productPrice}원</h5>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="subtotal d-flex justify-content-between align-items-center">
                            <h5>Subtotal</h5>
                            <h5>$9.99</h5>
                        </div> -->
                        <div class="shipping d-flex justify-content-between align-items-center">
                            <h5>배송비</h5>
                            <h5>3000원</h5>
                        </div>
                        <div class="order-total d-flex justify-content-between align-items-center">
                            <h5>총 주문 금액</h5>
                            <h5 id="totalPrice">${3000+p.productPrice}원</h5>
                        </div>
                        <div class="checkout-btn mt-30">
                            <a href="javascript:void(0)" class="btn alazea-btn w-100" onclick="requestPay()">결제하기</a>
                            <%--    <button class="kdg-detailPost-btn" onclick="requestPay()" >${post.immediatly}원으로 즉시구매 클릭</button> --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Checkout Area End ##### -->
    
    <!--------------------------- script 구문 -------------------------------->
    
    <!-- 결제하기 팝업 -->
    <script>

           	function requestPay() {

  				var deliveryName  = $("#first_name").val();
  				var deliveryEmail  = $("#email").val();
  				var deliveryPhonenumber  = $("#phone_number").val();
  				var deliveryAddress  = $("#address").val();
 				
 				console.log(deliveryAddress);
 				
 				if(deliveryName == ''){
 					alert('수령인을 입력하세요');
 					$("#first_name").focus();
 					return false;
 				}
 				if(deliveryEmail == ''){
 					alert('메일 주소를 입력하세요');
 					$("#address").focus();
 					return false;
 				}
 				if(deliveryPhonenumber == ''){
 					alert('연락처를 입력하세요');
 					$("#address").focus();
 					return false;
 				}
 				if(deliveryAddress == ''){
 					alert('주소를 입력하세요');
 					$("#address").focus();
 					return false;
 				}
 				
 				
           		var totalPrice = ${3000 + p.productPrice};
     			var IMP = window.IMP;
        		IMP.init("imp42520578");

           	   //iamport 대신 자신의 "가맹점 식별코드"를 사용
           	  	IMP.request_pay({
           	    pg: "kakaopay",
           	 	/* pg: "html5_inicis", */
           	    pay_method: "card",
           	    merchant_uid : 'merchant_'+new Date().getTime(),
           	    name : "${p.productTitle}",
           	    amount : totalPrice, //"${p.productPrice}", //${3000+p.productPrice}
           	    buyer_email : "${loginUser.email}",
           	    buyer_name : "${loginUser.userName}",
           	    buyer_tel : "${loginUser.phone}",
           	    buyer_addr : "${loginUser.address}"
           	    /* buyer_postcode : '123-456' */

           	  }, function(rsp) {
           		 console.log("chk");
      			console.log(rsp);
    			// 결제검증
    			$.ajax({
    	        	type : "POST",
    	        	url : "verifyIamport/" + rsp.imp_uid,
    	        	success : function(result){
    	        		
    	        		console.log(result);
    	        		
    	        	}
    	        	
    	        }).done(function(data) {
    	        	
    	        	console.log("data1"+data);
  
    	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
    	        	if(rsp.paid_amount == data.response.amount){
    		        	
    		        	var orderRequired = document.getElementById('order-notes');
    		        	var name = document.getElementById('first_name');
    		        	var email = document.getElementById('email');
    		        	var phone = document.getElementById('phone_number');
    		        	var address = document.getElementById('address');  		        	
    		        	
    		        	data = JSON.stringify({
    		        		"paymentNo" : rsp.imp_uid,
    		        		"paymentMethod" : "card",
       		        		"paymentPrice" : totalPrice,
    		        		"orderNo" : 'merchant_'+new Date().getTime(),
   		        			"userNo" : ${loginUser.userNo},
   		        			"productTitle" : "${p.productTitle}",
   		        			"buyerAddress" : address.value,
   		        			"buyerEmail" : email.value,
   		        			"buyerPhone" : phone.value,
   		        			"buyerName" : name.value,
   		        			"orderRequired" : orderRequired.value,
   		        			"productNo" : ${p.productNo}
    		        	});
    		        	
    		        	$.ajax({
    		        		type : "POST",
    		        		url : "paysuccess/",
                            dataType: 'json',
                            contentType: 'application/json',
    		        		data : data,
    		        		success : function(result){

    		        				     if(result>0){
    		        					   alert("결제가 완료되었습니다. \n"+"주문 상품 : ${p.productTitle} \n"+"총 결제 가격 : "+totalPrice+"원");
    		        				       return location.href = "plist.bo";
    		        				     
    		        				     }else{
    		        					   alert("결제에 실패했습니다.");
    		        				     }
    		        				   },
    		        		
    		        		error : function(){
    		        			console.log("통신오류");
    		        		}

    		        	});

    	        	} 
    	        		
    	        	
    	        });
    		});
    	}
           	  
	</script>

    

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    <!-- iamport.payment.js -->
  	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</body>

</html>