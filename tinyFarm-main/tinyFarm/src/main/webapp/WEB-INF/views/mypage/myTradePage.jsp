<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Title -->
<title>거래내역</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">
<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/jisu/css/tradePage.css">
<link rel="stylesheet" href="resources/style.css">
<script src="resources/jisu/js/myPage.js"></script>
<!-- alert창 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
.widget-title, .dateSearch {
	display: inline-block;
}
.dateSearch {
	width: 20%;
	float: right;
	text-align: right;
}
table.ui-datepicker-calendar {
	display: none;
}
.ui-datepicker-header.ui-widget-header.ui-helper-clearfix.ui-corner-all{
	background-color: #70c745;
}
.ui-datepicker-year, .ui-datepicker-month {
	-o-appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	text-align: center;
	font-weight: bold;
	border: none;
	width: 10%;
	background-color: #70c745;
}
.ui-datepicker-year>option, .ui-datepicker-month>option {
	background-color: #fff;
}
.hasDatepicker {
	width: 50%;
}
.searchOutDiv{
	width: 100%;
	height:100%;
	vertical-align:middle;
	border: 2px #70c745 solid ;
	margin-bottom: 2%;
}
.searchOutDiv img{
	width:15px;
	height:15px;
}
#orderDate, #sellDate {
	width: 70%;
	height: 30px;
	border: none;
	font-size: 1em;
	padding-left: 5px;
	font-style: oblique;
	display: inline;
	outline: none;
	box-sizing: border-box;
	color: black;
}
#orderBtn, #sellBtn {
	width: 40px;
	height: 30px;
	border: none;
	margin-bottom: 2%;
	background-color:transparent;
	outline: none;
	display: inline;
	box-sizing: border-box;
	cursor: pointer;
}
#wishBtn {
	width: 40px;
	height: 30px;
	border: none;
	background-color: #70c745;
	color: #fff;
	outline: none;
	margin: auto;
}
#wishBtn:hover {
	background-color: #ebebeb;
}
.pagingArea {
	margin-top: 1%;
}
table {
	border: none;
	font-size: 14px;
}
thead, tbody {
	height: 40px;
}
.page-item.current-page a{
	background-color: #70c745;
}
#wishListTableContainer {
	margin-top: -15px;
}
#nowish{
	text-align: center;
}
#wishListTableContainer table tbody {
	max-height: 450px;
	overflow-y: scroll;
	overflow-x: hidden;
	text-align: left;
	font-size: 14px;
	text-overflow: ellipsis;
}
#wishTable tbody tr {
	border-bottom: 1px solid grey;
}
/* 찜내역 스크롤바 css */
#wishListTableContainer table tbody::-webkit-scrollbar{
	width: 7px;
}
#wishListTableContainer table tbody::-webkit-scrollbar-thumb{
	 background: #70c745;
    border-radius: 100px;
}
#wishListTableContainer table tbody::-webkit-scrollbar-track{
background-color: none;
}
#proImg {
	width: 100px;
	height: 100px;
	padding: 0px 0px 0px 0px;
}
#imgTd {
	width: 25%;
	height: 25%;
}
#wInfoTd{
	padding-left: 15px;
}
#btnTd {
	width: 20%;
	text-align: center;
}
#wishImg {
	width: 100px;
    height: 100px;
	padding: 10px 0px 10px 10px;
}
#wishCount,#orderCount,#sellCount{
	font-size: 14px;
}
#orderTd, #sellTd{
	max-width: 200px;
	overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

    <!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>거래내역</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i>작은농장</a></li>
						<li class="breadcrumb-item"><a href="mypage.me">마이페이지</a></li>
						<li class="breadcrumb-item"><a href="trade.me">거래내역</a></li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
    <!-- 활동내역 -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-8">
                    <div class="row">
                    	<div id="orderList">
                    		<div class="widget-title">
                                <h4>구매내역<span id="orderCount"></span></h4>
                            </div>
                            <div class="dateSearch">
                            	<div class="searchOutDiv"> 
		                            <input type="search" id="orderDate" placeholder="검색날짜">
						  			<button id="orderBtn" onclick="loadOrderSearch(1);"><img src="${contextPath}/resources/img/icon/search.svg"></button>
					  			</div> 
                            </div>
                            <!-- 구매목록 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">구매번호</td>
                    					<td style="width: 15%">구매날짜</td>
                    					<td style="width: 15%">제품이미지</td>
                    					<td style="width: 30%">제품명</td>
                    					<td style="width: 10%">가격</td>
                    					<td style="width: 10%">결제수단</td>
                    				</tr>
                    			</thead>
                    			<tbody>
                    			</tbody>
                    		</table>
                    		<!-- 구매목록 페이징바 -->
                    		<div id="orderPageArea" class="pagingArea">
								<ul class="pagination" id="orderPage">
									<!-- 페이지 영역 -->
								</ul>
							</div>
                    	</div>
                    	
                    	<div id="sellList">
                    		<div class="widget-title">
                                <h4>판매내역<span id="sellCount"></span></h4>
                            </div>
                            <div class="dateSearch">
                            	<div class="searchOutDiv"> 
	                            	<input type="search" id="sellDate" placeholder="검색날짜">
	                            	<button id="orderBtn" onclick="loadSellSearch(1);"><img src="${contextPath}/resources/img/icon/search.svg"></button>
                            	</div>
                            </div>
                            <!-- 판매내역 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">판매번호</td>
                    					<td style="width: 10%">등록날짜</td>
                    					<td style="width: 20%">제품이미지</td>
                    					<td style="width: 30%">제품명</td>
                    					<td style="width: 10%">가격</td>
                    					<td style="width: 10%">판매상태</td>
                    				</tr>
                    			</thead>
                    			<tbody>
                    			</tbody>
                    		</table>
                    		<!-- 판매목록 페이징바 -->
                    		<div id="sellPageArea" class="pagingArea">
								<ul class="pagination" id="sellPage">
									<!-- 판매목록 페이지 영역 -->
								</ul>
							</div>
                    	</div>
                    </div>
                </div>
    			<div class="col-12 col-md-4">
                    <div class="post-sidebar-area">
                        <div class="single-widget-area">
                            <div id="wishList">
	                            <div class="widget-title">
	                                <h4>찜내역<span id="wishCount"></span></h4>
	                            </div>
	        					<div id="wishListTableContainer">
			                    	<table id="wishTable">
										<thead>
											<tr><td colspan='3'>찜목록</td></tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</section>
		
	<script>
			
	let myNo = ${loginUser.userNo}; //로그인유저 번호 미리 추출
	let curPage = 0; //현재페이지
    let startPage = 0; //시작페이지
    let endPage = 0; //마지막페이지
	let maxPage = 0; //최대페이지
	let count = 0; //개수
	
	//구매내역
	function loadOrderPage(page){
    	$.ajax({
    		url : "orderPage.me",
    		type: "post",
    		data : {
    			userNo : myNo,
    			currentPage : page
    		},
    		success : function(result){
	    		let oList = result.oList; //리스트
	    		let str = ""; //게시글
	    	    let pStr = ""; //페이징
	    	    let cStr = ""; //개수
    			curPage = result.oPi.currentPage;
	    		startPage = result.oPi.startPage;
	    		endPage = result.oPi.endPage;
	    		maxPage = result.oPi.maxPage;
				count = oList.length;
	    	    if(count == 0){
	    			str += "<tr>"
		    			+ "<td colspan='6'>구매내역이 존재하지 않습니다.</td>"
		    			+ "</tr>";
	    		}else{
		    		$.each(oList, function(key, o){
		    			
		    			str += '<tr>'
		    				+ "<td>"+o.paymentNo+"</td>"
			   				+ "<td>"+o.orderDate.substring(0,10)+"</td>"
			   				+ '<td><img id="proImg" src="'+o.filePath+o.changeName+'"></td>'
			   				+ "<td id='orderTd'>"+o.productTitle+"</td>"
			   				+ "<td>￦ "+o.paymentPrice+"</td>"
			   				+ "<td>"+o.paymentMethod+"</td>"
			   				+ "</tr>";
		    			});
	    		}
	    	    
	    	    cStr = "("+count+")";
	    	    
	    		$("#orderList tbody").html(str); //구매내역 리스트 띄워주기
	    		$("#orderCount").html(cStr);
	    			
	    		//페이징 처리
    			if(startPage==1){ //시작이 1이면 이전버튼 비활성
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
    			}else{
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderPage('+(startPage-5)+')">이전</a></li>';
    			}

	    		for(var i=startPage; i<endPage+1; i++){
	    			if (i==curPage) { //현재페이지일때 current-page class 추가
	    		        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadOrderPage('+i+')">'+i+'</a></li>';
	    		    } else {
	    		        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderPage('+i+')">'+i+'</a></li>';
	    		    }
	    		}
	    		
	    		if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
	    		}else{
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderPage('+(startPage+5)+')">다음</a></li>';
	    		}
	    		
		    	$("#orderPageArea>#orderPage").html(pStr);
	    		
    		},error : function(){
    			console.log("구매내역 ajax 통신 실패");
    		}
    	});
	}

	//판매내역 리스트
    function loadSellPage(page){
    	$.ajax({
    		url : "sellPage.me",
    		type: "post",
    		data : {
    			userNo : myNo,
    			currentPage : page
    		},
    		success : function(result){
	    		let sList = result.sList;
	    		let str = ""; //게시글
	    	    let pStr = ""; //페이징
    			curPage = result.sPi.currentPage;
	    		startPage = result.sPi.startPage;
	    		endPage = result.sPi.endPage;
	    		maxPage = result.sPi.maxPage;
	    		count = sList.length;
	    	    
	    	    if(count == 0){
	    			str += "<tr>"
		    			+ "<td colspan='6'>판매내역이 존재하지 않습니다.</td>"
		    			+ "</tr>";
	    		}else{
		    		$.each(sList, function(key, s){ 
		    			str += '<tr onclick="productDatail(this);">' //클릭시 해당 제품 글로 이동
			   				+ "<td class='pNo'>"+s.productNo+"</td>"
			   				+ "<td>"+s.regiDate.substring(0,10)+"</td>"
			   				+ '<td><img id="proImg" src="'+s.filePath+s.changeName+'"></td>'
			   				+ "<td id='sellTd'>"+s.productTitle+"</td>"
			   				+ "<td>￦ "+s.productPrice+"</td>"
			   				+ "<td class='status'>"+s.salesStatus+"</td>"
			   				+ "</tr>";
			   				
			   				
		    			});
		    			
	    		}
	    	    
	    	    //cStr 문구 작성
	    	    cStr = "("+count+")";
	    	    
	    		$("#sellList tbody").html(str); //판매내역 리스트 띄워주기
	    		$("#sellCount").html(cStr);	//판매내역 수
	    		//페이징 처리
    			if(startPage==1){ //시작이 1이면 이전버튼 비활성
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
    			}else{
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellPage('+(startPage-5)+')">이전</a></li>';
    			}
	    		for(var i=startPage; i<endPage+1; i++){
	    			if (i==curPage) { //현재페이지일때 current-page class 추가
	    		        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadSellPage('+i+')">'+i+'</a></li>';
	    		    } else {
	    		        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellPage('+i+')">'+i+'</a></li>';
	    		    }
	    		}
	    		if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
	    		}else{
    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellPage('+(startPage+5)+')">다음</a></li>';
	    		}
    			$("#sellPageArea>#sellPage").html(pStr);
    		}
    	});
    }	
	
	//삭제/판매된 거래내역은 detail 볼 수 없도록 막기
    function productDatail(el){
    	let pNo = $(el).children(".pNo").text();
    	let status = $(el).children(".status").text();
		if(status == 'Y'){
			location.href="pdetail.bo?pno="+pNo;
		}else{
			swal('존재하지 않는 게시글', '판매되거나 삭제된 게시글은 \n볼 수 없습니다.😢', 'error');
		}
	}
	
	
	//구매내역 날짜검색
    function loadOrderSearch(page){
    	let date = $("#orderDate").val(); //검색날짜
		$.ajax({
    		url : "searchOrder.me",
    		type : "post",
    		data : {
    			userNo : myNo,
    		    searchDate : date,
    		    currentPage : page
    		},success : function(result){
    			$("#orderList tbody").empty();  //기존 리스트 비워주기
    			let oList = result.oList;
    			let str = ""; //게시글
    			let pStr = ""; //페이징
    			let cStr = ""; //개수
    		    curPage = result.oPi.currentPage;
    			startPage = result.oPi.startPage;
    			endPage = result.oPi.endPage;
    			maxPage = result.oPi.maxPage;
    			count = oList.length;
    				if(oList.length == 0){
    			    	str += "<tr>"
    				    	+ "<td colspan='6'>해당 기간 구매내역이 존재하지 않습니다.</td>"
    				    	+ "</tr>";
    			    }else{
    					$.each(oList, function(key, o){
    						str += '<tr>'
			    				+ "<td>"+o.paymentNo+"</td>"
				   				+ "<td>"+o.orderDate.substring(0,10)+"</td>"
				   				+ '<td><img id="proImg" src="'+o.filePath+o.changeName+'"></td>'
				   				+ "<td id='orderTd'>"+o.productTitle+"</td>"
				   				+ "<td>￦"+o.paymentPrice+"</td>"
				   				+ "<td>"+o.paymentMethod+"</td>"
				   				+ "</tr>";
    				    	});
    			    	}
    					
    					//구매내역 개수
    					cStr = "("+count+")";
    				
    					//화면에 보여주기
    			    	$("#orderList tbody").html(str); //구매내역 리스트 띄워주기
    			    	$("#orderCount").html(cStr); //개수
    			    //페이징 처리
    		    	if(startPage==1){ //시작이 1이면 이전버튼 비활성
    		    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
    		    	}else{
    		    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderSearch('+(startPage-5)+')">이전</a></li>';
    		    	}
    			    for(var i=startPage; i<endPage+1; i++){
    			    	if (i==curPage) { //현재페이지일때 current-page class 추가
    			    		pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadOrderSearch('+i+')">'+i+'</a></li>';
    			    	} else {
    			    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderSearch('+i+')">'+i+'</a></li>';
    			    	}
    			    }
    			    if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
    			    	pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
    			    }else{
    		    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadOrderSearch('+(startPage+5)+')">다음</a></li>';
    			    }
    		    	$("#orderPageArea>#orderPage").html(pStr);

    		},error : function(){
    			console.log("구매내역 검색 ajax 통신 실패");
    		}
    	});
   	}

	//판매내역 날짜검색
	function loadSellSearch(page){
		let date = $("#sellDate").val(); //String
		
		$.ajax({
	    	url : "searchSell.me",
	    	type: "post",
	    	data : {
	    		userNo : myNo,
	    		searchDate : date,
	    		currentPage : page
	    	},
	    	success : function(result){
	    		$("#sellList tbody").empty(); 
	    		curPage = result.sPi.currentPage;
		    	startPage = result.sPi.startPage;
		    	endPage = result.sPi.endPage;
		    	maxPage = result.sPi.maxPage;
		    	let sList = result.sList;
		    	let count = sList.length;
		    	let str = ""; //게시글
		        let pStr = ""; //페이징
		        let cStr = ""; //개수
		        
		        if(count == 0){
		    		str += "<tr>"
			   			+ "<td colspan='6'>해당 기간 판매내역이 존재하지 않습니다.</td>"
			   			+ "</tr>";
		    	}else{
			   		$.each(sList, function(key, s){
			   			str += '<tr onclick="productDatail(this);">' //클릭시 해당 제품 글로 이동
		   				+ "<td class='pNo'>"+s.productNo+"</td>"
		   				+ "<td>"+s.regiDate.substring(0,10)+"</td>"
		   				+ '<td><img id="proImg" src="'+s.filePath+s.changeName+'"></td>'
		   				+ "<td id='sellTd'>"+s.productTitle+"</td>"
		   				+ "<td>￦"+s.productPrice+"</td>"
		   				+ "<td class='status'>"+s.salesStatus+"</td>"
		   				+ "</tr>";
			   		});
		    	}
		        
		      	//cStr에 판매내역 개수
    			cStr = "("+count+")";
		      	
		    	$("#sellList tbody").html(str); //게시글 리스트 띄워주기
		    	$("#sellCount").html(cStr);
		    	//페이징 처리
	    		if(startPage==1){ //시작이 1이면 이전버튼 비활성
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
	    		}else{
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellSearch('+(startPage-5)+')">이전</a></li>';
	    		}
		    	for(var i=startPage; i<endPage+1; i++){
		    		if (i==curPage) { //현재페이지일때 current-page class 추가
		    	        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadSellSearch('+i+')">'+i+'</a></li>';
		    	    } else {
		    	        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellSearch('+i+')">'+i+'</a></li>';
		    	    }
		    	}
		    	if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
		    		pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
		    	}else{
	    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadSellSearch('+(startPage+5)+')">다음</a></li>';
		    	}
	    		$("#sellPageArea>#sellPage").html(pStr);
	    		
	    	}
    	});
	}
	
    $(function(){ //초기 페이지 로딩은 1페이지
		loadOrderPage(1); //구매내역
    	loadSellPage(1); //판매내역
    	loadOrderSearch(1); //구매검색내역
    	loadSellSearch(1); //판매검색내역
	});
    
    //찜목록
    $(function(){
    	$.ajax({
    		url : "wishList.me",
    		data : {
    			userNo : myNo
    		},
    		success : function(result){ //wishList
    			let wishList = result.wishList; //찜내역
    			let count = wishList.length; //찜개수
    			let str = "";
    			let cStr = "";
    			//개수 0이면
    			if(count == 0){
    				str += "<tr id='nowish'><td colspan='3'>찜내역이 없습니다.</td></tr>";
    			}else{ //있으면 목록 뽑아주기
	    			$.each(wishList, function(key, w){
	    				str += "<tr>"
	    					+ '<td id="imgTd"><img id="wishImg" alt="제품이미지" src="'+w.filePath+w.changeName+'"></td>'
							+ "<td id='wInfoTd'>"+w.productTitle+"<br>￦ "+w.productPrice+"</td>"
							+ '<td id="btnTd"><input type="button" id="wishBtn" value="보기" onclick="location.href=\'pdetail.bo?pno=\' + '+w.productNo+'"></td>'
	    					+ "</tr>";
	    			});
    			}
    			
    			//cStr에 찜내역 개수
    			cStr = "("+count+")";
    			
    			//화면에 보여주기
    			$("#wishTable tbody").html(str);
    			$("#wishCount").html(cStr);
    		},error : function(){
    			console.log("찜목록 ajax 요청 실패");
    		}
    		
    	});
    });
    
	</script>
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
</body>

</html>