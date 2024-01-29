<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Title -->
<title>작은농장</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

<link rel="stylesheet" href="resources/font-awesome.min.css"
	type="text/css">
<style>
.green-icon-img {
	width: 25px;
	height: 25px;
}

.plantImg {
	width: 500px;
	height: 500px;
}

#reviews {
	width: 700px;
	margin: 0 auto;
}

.comment-p {
	margin: 10px 0;
}

.reviews_area {
	margin: 50px 0;
}

.comment-footer, .update-comment-div, .send-comment-btn-div {
	display: flex;
	justify-content: space-between;
}

.update-comment-div {
	width: 50px;
}

.update-comment-btn:hover, .delete-comment-btn:hover {
	cursor: pointer;
	color: #FF6C30;
}

.send-comment-btn-div h4 {
	margin: 4px 0;
}

.plant-info {
	width: 900px;
	margin: 0 auto;
}

.plant-info-top, .plant-info-middle, .plant-info-bottom {
	display: flex;
	height: auto;
	padding: 30px 0;
}

.plant-info-top div, .plant-info-middle div, .plant-info-bottom div {
	width: 50%;
	padding: 0 10px;
}

.plant-info-top p, .plant-info-middle p, .plant-info-bottom p {
	margin: 0;
}

.plant-info-top b, .plant-info-middle b, .plant-info-bottom b {
	color: #FF6C30;
}

.plant-info-top {
	border-top: 1px solid black;
	border-bottom: 1px solid #d4d4d4;
}

.plant-info-middle {
	border-bottom: 1px solid #d4d4d4;
}

.plant-info-bottom {
	border-bottom: 1px solid black;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>

<body>

	<!-- 상단 -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<div class="breadcrumb-area">
		<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>실내정원용 식물</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/"><i class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="${contextPath}/inGardenPlantList.pp">실내정원용 식물</a></li>
							<li class="breadcrumb-item active" aria-current="page">상세보기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- ##### Single Product Details Area Start ##### -->
	<section class="single_product_details_area mb-50">
		<div class="produts-details--content mb-50">
			<div class="container">
				<div class="row justify-content-between">
					<div class="col-12 col-md-6 col-lg-5">
						<div class="single_product_thumb">
							<div id="product_details_slider" class="carousel slide" data-ride="carousel">
								<div class="carousel-inner">
									<!-- 
                                	<c:forEach items="${imgArr}" var="i" varStatus="vs">
                                		<c:choose>
	                                		<c:when test="${vs.index eq 0}">
			                                    <div class="carousel-item active">
			                                        <a class="product-img" href="${i}" title="Product Image">
			                                        	<img class="d-block w-100 plantImg" src="${i}" alt="1">
			                                    	</a>
			                                    </div>
	                                		</c:when>
	                                		<c:otherwise>
			                                    <div class="carousel-item">
			                                        <a class="product-img" href="${i}" title="Product Image">
			                                        <img class="d-block w-100 plantImg" src="${i}" alt="1">
			                                    </a>
			                                    </div>
	                                		
	                                		</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                    -->
									<div class="carousel-item active">
										<a class="product-img" href="${i}" title="Product Image">
											<img class="d-block w-100 plantImg" src="${detailImg }" alt="1">
										</a>
									</div>
								</div>
								<%--  <ol class="carousel-indicators">
                                	<c:forEach items="${imgArr}" var="i" varStatus="vs">
                                		<c:choose>
	                                		<c:when test="${vs.index eq 0}">
			                                   <li class="active" data-target="#product_details_slider" data-slide-to="${vs.index}" style="background-image: url(${i});"></li>
	                                		</c:when>
	                                		<c:otherwise>
			                                    <li data-target="#product_details_slider" data-slide-to="${vs.index}" style="background-image: url(${i});"></li>
	                                		
	                                		</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </ol> --%>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="single_product_desc">
							<p class="title" style="font-size: 20px; font-weight: 900;">${plantInfo.cntntsSj}</p>
							<p class="price" style="font-size: 16px; font-weight: 700;">${plntzrNm}</p>
							<div class="short_overview">
								<p style="font-size: 14px; font-weight: 600;">꽃말 : ${adviseInfo}</p>
								<p style="font-size: 14px; font-weight: 600;">${speclmanageInfo}</p>
							</div>

							<%--  <a href="#" class="wishlist-btn ml-15"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                            <div class="products--meta" style="padding-top: 30px;">
                                <p><span>잎 형태 정보 :</span> <span>${lefStleInfo}</span></p>
                                <p><span>냄새 정보 :</span> <span>${smellCodeNm}</span></p>
                                <p><span>관리수준 :</span> <span>${managelevelCodeNm}</span></p>
 								
                            </div> --%>

						</div>
						<div class="alazea-benefits-area">
							<div class="row">
								<!-- Single Benefits Area -->
								<div class="col-12 col-sm-6">
									<div class="single-benefits-area">
										<img class="green-icon-img" src="resources/img/icon/temperature_icon.png" alt="">
										<h5>생육 온도</h5>
										<p style="font-weight: 500;">${grwhTpCodeNm}</p>
									</div>
								</div>

								<!-- Single Benefits Area -->
								<div class="col-12 col-sm-6">
									<div class="single-benefits-area">
										<img class="green-icon-img" src="resources/img/icon/water_icon.png" alt="">
										<h5>습도</h5>
										<p style="font-weight: 500;">${hdCodeNm}</p>
									</div>
								</div>

								<!-- Single Benefits Area -->
								<div class="col-12 col-sm-6">
									<div class="single-benefits-area">
										<img class="green-icon-img" src="resources/img/icon/stopwatch_icon.png" alt="">
										<h5>생장속도</h5>
										<p style="font-weight: 500;">${grwtveCodeNm}</p>
									</div>
								</div>

								<!-- Single Benefits Area -->
								<div class="col-12 col-sm-6">
									<div class="single-benefits-area">
										<img class="green-icon-img" src="resources/img/icon/snowman_icon.png" alt="">
										<h5>겨울 최저 온도</h5>
										<p style="font-weight: 500;">${winterLwetTpCodeNm}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="product_details_tab clearfix">
						<!-- Tabs -->
						<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							<li class="nav-item"><a href="#description" class="nav-link active" data-toggle="tab" role="tab" style="font-weight: 800;">식물 정보</a></li>
							<li class="nav-item"><a href="#addi-info" class="nav-link" data-toggle="tab" role="tab" style="font-weight: 800;">위키백과</a></li>
							<li class="nav-item"><a href="#reviews" class="nav-link" data-toggle="tab" role="tab" style="font-weight: 800;">의견 <span class="text-muted"></span></a></li>
						</ul>
						<!-- Tab Content -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade show active" id="description">
								<div class="plant-info">
									<div class="plant-info-top">
										<div>
											<p>
												<b>과 명</b>
											</p>
											<p>${fmlCodeNm}</p>
										</div>
										<div>
											<p>
												<b>조언 정보</b>
											</p>
											<p>${adviseInfo}</p>
										</div>
									</div>
									<div class="plant-info-middle">
										<div>
											<p>
												<b>성장 높이 정보&nbsp&nbsp&nbsp</b>
											</p>
											<p>${growthHgInfo}</p>
										</div>
										<div>
											<p>
												<b>성장 넓이 정보&nbsp&nbsp&nbsp</b>
											</p>
											<p>${growthAraInfo}</p>
										</div>
									</div>
									<div class="plant-info-middle">
										<div>
											<p>
												<b>번식 시기 정보&nbsp&nbsp&nbsp</b>
											</p>
											<p>${prpgtEraInfo}</p>
										</div>
										<div>
											<p>
												<b>생장속도&nbsp&nbsp&nbsp</b>
											</p>
											<p>${grwtveCodeNm}</p>
										</div>
									</div>
									<div class="plant-info-middle">
										<div>
											<p>
												<b>생육 온도&nbsp&nbsp&nbsp</b>
											</p>
											<p>${grwhTpCodeNm}</p>

										</div>
										<div>
											<p>
												<b>겨울 최저 온도&nbsp&nbsp&nbsp</b>
											</p>
											<p>${winterLwetTpCodeNm}</p>
										</div>
									</div>
									<div class="plant-info-middle">
										<div>
											<p>
												<b>습도&nbsp&nbsp&nbsp</b>
											</p>
											<p>${hdCodeNm}</p>
										</div>
										<div>
											<p>
												<b>비료 정보&nbsp&nbsp&nbsp</b>
											</p>
											<p>${frtlzrInfo}</p>
										</div>
									</div>
									<div class="plant-info-middle">
										<div>
											<p>
												<b>토양 정보&nbsp&nbsp&nbsp</b>
											</p>
											<p>${soilInfo}</p>
										</div>
										<div>
											<p>
												<b>물주기 봄&nbsp&nbsp&nbsp</b>
											</p>
											<p>${watercycleSprngCodeNm}</p>
										</div>
									</div>
									<div class="plant-info-middle">
										<div>
											<p>
												<b>물주기 여름&nbsp&nbsp&nbsp</b>
											</p>
											<p>${watercycleSummerCodeNm}</p>
										</div>
										<div>
											<p>
												<b>물주기 가을&nbsp&nbsp&nbsp</b>
											</p>
											<p>${watercycleAutumnCodeNm}</p>
										</div>
									</div>
									<div class="plant-info-middle">
										<div>
											<p>
												<b>물주기 겨울&nbsp&nbsp&nbsp</b>
											</p>
											<p>${watercycleWinterCodeNm}</p>
										</div>
										<div>
											<p>
												<b>특별관리 정보&nbsp&nbsp&nbsp</b>
											</p>
											<p>${speclmanageInfo}</p>
										</div>
									</div>
									<div class="plant-info-middle">
										<div>
											<p>
												<b>기능성 정보&nbsp&nbsp&nbsp</b>
											</p>
											<p>${fncltyInfo}</p>
										</div>
										<div>
											<p>
												<b>관리요구도&nbsp&nbsp&nbsp</b>
											</p>
											<p>${managedemanddoCodeNm}</p>
										</div>
									</div>
									<div class="plant-info-middle">
										<div>
											<p>
												<b>분류명&nbsp&nbsp&nbsp</b>
											</p>
											<p>${clCodeNm}</p>
										</div>
										<div>
											<p>
												<b>생육형태명&nbsp&nbsp&nbsp</b>
											</p>
											<p>${grwhstleCodeNm}</p>
										</div>
									</div>
									<div class="plant-info-bottom">
										<div>
											<p>
												<b>실내정원구성&nbsp&nbsp&nbsp</b>
											</p>
											<p>${indoorpsncpacompositionCodeNm}</p>
										</div>
										<div>
											<p>
												<b>생태명&nbsp&nbsp&nbsp</b>
											</p>
											<p>${eclgyCodeNm}</p>
										</div>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="addi-info">
								<div class="additional_info_area">
									<object data="https://ko.wikipedia.org/wiki/${plantInfo.cntntsSj}" width="1100" height="800" type="text/html">
										<p align="center">해당 식물정보가 위키백과에 존재하지 않습니다.</p>
									</object>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="reviews">
								<!-- Button trigger modal -->
								<c:choose>
									<c:when test="${not empty loginUser.userId}">
										<div class="submit_a_review_area mt-50">
											<h4>소중한 의견을 남겨주세요</h4>
											<!-- form태그를 없애고 싶었으나 bootstrap 템플릿 스타일 코드가 form .stars 이런식으로 적용되어있어서 둠. -->
											<form action="#" style="margin-top: 20px;">
												<div class="row">
													<div class="col-12 col-md-6">
														<div class="form-group">
															<label for="name">아이디</label> <input type="text" class="form-control" id="userId" value="${loginUser.userId}" readonly>
														</div>
													</div>
													<div class="col-12">
														<div class="form-group d-flex align-items-center">
															<span class="mr-15">별점: </span>
															<div class="stars">
																<input type="radio" name="star" class="star-1" id="star-1" value="1"> 
																<label class="star-1" for="star-1">1</label> 
																<input type="radio" name="star" class="star-2" id="star-2" value="2"> 
																<label class="star-2" for="star-2">2</label> 
																<input type="radio" name="star" class="star-3" id="star-3" value="3"> 
																<label class="star-3" for="star-3">3</label>
																<input type="radio" name="star" class="star-4" id="star-4" value="4"> 
																<label class="star-4" for="star-4">4</label> 
																<input type="radio" name="star" class="star-5" id="star-5" value="5" checked> 
																<label class="star-5" for="star-5">5</label> 
																<span></span>
															</div>
														</div>
													</div>

													<div class="col-12">
														<div class="form-group">
															<label for="comments">의견</label>
															<textarea class="form-control" id="commentContent" rows="5" maxlength="200" data-max-length="150" style="resize: none;"></textarea>
														</div>
													</div>
													<div class="col-12 send-comment-btn-div">
														<button onclick="return false;" class="btn alazea-btn send-comment">의견 남기기</button>
														<h4>
															총 <b class="commentCount"></b>개의 의견
														</h4>
													</div>
												</div>
											</form>
										</div>
									</c:when>
									<c:otherwise>
										<div class="submit_a_review_area mt-50">
											<h4>소중한 의견을 남겨주세요</h4>
											<!-- form태그를 없애고 싶었으나 bootstrap 템플릿 스타일 코드가 form .stars 이런식으로 적용되어있어서 둠. -->
											<form action="#" style="margin-top: 20px;">
												<div class="row">
													<div class="col-12 col-md-6">
														<div class="form-group">
															<label for="name">아이디</label> 
															<input type="text" class="form-control" id="userId" value="${loginUser.userId}" readonly>
														</div>
													</div>
													<div class="col-12">
														<div class="form-group d-flex align-items-center">
															<span class="mr-15">별점: </span>
															<div class="stars">
																<input type="radio" name="star" class="star-1" id="star-1" value="1"> 
																<label class="star-1" for="star-1">1</label> 
																<input type="radio" name="star" class="star-2" id="star-2" value="2"> 
																<label class="star-2" for="star-2">2</label> 
																<input type="radio" name="star" class="star-3" id="star-3" value="3"> 
																<label class="star-3" for="star-3">3</label>
																<input type="radio" name="star" class="star-4" id="star-4" value="4"> 
																<label class="star-4" for="star-4">4</label> 
																<input type="radio" name="star" class="star-5" id="star-5" value="5" checked> 
																<label class="star-5" for="star-5">5</label> 
																<span></span>
															</div>
														</div>
													</div>

													<div class="col-12">
														<div class="form-group">
															<label for="comments">의견</label>
															<textarea class="form-control" id="commentContent" placeholder="로그인 후 이용 가능합니다." readonly rows="5" maxlength="200" data-max-length="150" style="resize: none;"></textarea>
														</div>
													</div>
													<div class="col-12 send-comment-btn-div">
														<button onclick="return false;" class="btn alazea-btn send-comment">의견 남기기</button>
														<h4>
															총 <b class="commentCount"></b>개의 의견
														</h4>
													</div>
												</div>
											</form>
										</div>
									</c:otherwise>
								</c:choose>

								<div class="reviews_area">
									<ul>
										<li class="reviews_area-li"></li>
									</ul>
									<div style="width: 100%; display: flex; justify-content: center;">
										<button class="btn alazea-btn more-comment-btn" onclick="selectComment();">의견 더보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--수정 p태그를 눌렀을 때 modal을 띄우기 위해 아래 버튼을 숨겨두고 p태그를 누르면 이 버튼을 클릭하는 이벤트를 발생 -->
	<button type="button" id="updateModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="display: none;"></button>


	<!-- 수정 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">의견 수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="submit_a_review_area">
						<form action="#">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">아이디 :
								</label> <input type="text" class="form-control" id="updateCommentId" readonly>
							</div>
							<div class="col-12">
								<div class="form-group d-flex align-items-center">
									<span class="mr-15">별점: </span>
									<div class="stars">
										<input type="radio" name="updateStar" class="star-1" id="updateStar-1" value="1"> 
										<label class="star-1" for="updateStar-1">1</label> 
										<input type="radio" name="updateStar" class="star-2" id="updateStar-2" value="2">
										<label class="star-2" for="updateStar-2">2</label> 
										<input type="radio" name="updateStar" class="star-3" id="updateStar-3" value="3"> 
										<label class="star-3" for="updateStar-3">3</label> 
										<input type="radio" name="updateStar" class="star-4" id="updateStar-4" value="4">
										<label class="star-4" for="updateStar-4">4</label> 
										<input type="radio" name="updateStar" class="star-5" id="updateStar-5" value="5" checked> 
										<label class="star-5" for="updateStar-5">5</label> 
										<span></span>
									</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">의견:</label>
								<textarea class="form-control" id="updateCommentTextarea"></textarea>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modalCloseBtn">닫기</button>
					<button type="button" class="btn btn-primary" onclick="updateComment(this);">수정</button>
					<input type="hidden" id="updateCtpNo">
				</div>
			</div>
		</div>
	</div>
	<input id="currentPage" type="hidden" value="1">
	
	<script>

    	$(function(){
    		//총 의견 개수 세기
    		getCommentCount();
    		//페이지에 들어왔을때 의견 가져오기
    		selectComment();
    	});
    	//의견 남기기 버튼 클릭 이벤트
    	$(".send-comment").click(function(){
    		var content = $("#commentContent").val();
    		var star = $('input[type="radio"][name="star"]:checked').val();
    		var loginUser = "${loginUser.userId}";

    		if(loginUser == ""){
    			alert("로그인 후 이용 가능합니다.");
    		}
    		else if(content == ""){
    			alert("의견을 작성해주세요");
    		}else {
	    		$.ajax({
		   			url : "insertCommentToPlant.pp",
		   			data : {
		   				cntntsNo : ${cntntsNo},
		   				star : star,
		   				commentWriter : $("#userId").val(),
		   				commentContent : content
		   			},
		   			success : function(result){
		   				if(result == "NNNNY"){
			   				alert("의견 작성 완료");
			   				afterUpdateComment();
		   					
		   				}else{
		   					alert("의견 작성 실패");
		   				}
		   			},
		   			error : function(){
		   				console.log("의견 작성 통신 실패");
		   			}
	    		});
    		}  
    		  		
    	});
    	
    	//의견 가져오기
    	function selectComment(){
    		
    		$.ajax({
    			url : "selectComment.pp",
    			data : {
    				currentPage : $("#currentPage").val(),
    				cntntsNo : ${cntntsNo}
    			},
    			success : function(result){
    				 /* <div class="single_user_review mb-15">
	                     <div class="review-rating">	                     	
	                         <i class="fa fa-star" aria-hidden="true"></i>
	                         <i class="fa fa-star" aria-hidden="true"></i>
	                         <i class="fa fa-star" aria-hidden="true"></i>
	                         <i class="fa fa-star" aria-hidden="true"></i>
	                         <i class="fa fa-star" aria-hidden="true"></i>	                        
	                     </div>
	                     <div class="review-details">
	                     	<p class="comment-p">의견</p>
	                     	<div>
	                        	<p>by 이름 on 등록일</p>
	                        	//작성자와 로그인유저가 일치하면 append
	                        	<div class="update-comment-div">
	                        		<p class="update-comment-btn">수정</p>
	                        		<p class="delete-comment-btn">삭제</p>
	                        	</div>
	                     	</div>
	                     </div>
	                 </div> */
	                 
	                 var currentPage = $("#currentPage").val();
	                 var commentCount = $(".commentCount").text();

	                 //5개씩 보여주는데 페이지수 * 5가 총 개수를 넘으면 (ex 총개수가 19인데 현재 페이지가 4페이지라면 20개까지 보여줄 수 있음. 버튼 숨겨야됨.)
	                 if(currentPage*5 > commentCount){
	                	 $(".more-comment-btn").css("display","none");
	                 }
	                 
     		         var incrementedValue = parseInt(currentPage) + 1; // 가져온 값에 1을 더함 (숫자로 변환 후 덧셈)
     		         $("#currentPage").val(incrementedValue); // 변경된 값을 다시 input 요소에 설정함
     		         
     		         if(result.length == 0){
     		        	 var outDiv = $("<div class='single_user_review mb-15' style='text-align:center;'></div>").text("의견이 존재하지 않습니다.");
     		        	$(".reviews_area-li").append(outDiv);
     		         }else {
		                 for(var i=0;i<result.length;i++){
		                	 var outDiv = $("<div class='single_user_review mb-15'></div>");
		                	 var starDiv = $("<div class='review-rating'></div>");
		                	 var detailDiv = $("<div class='review-details'></div>");
		                	 var commentP = $("<p class='comment-p'></p>").text(result[i].commentContent);
		                	 var footerDiv = $("<div class='comment-footer'></div>");
		                	 var writerDateP = $("<p></p>");
		                	 var by = $("<small></small>").text("by");
		           			 var on = $("<small></small>").text("on");
		                	 var writerA = $("<b style='margin:0 5px'></b>").text(result[i].commentWriter);
		                	 var createDateSpan = $("<span style='margin:0 5px'></span>").text(new Date(result[i].createDate).toLocaleString());
		                	 var hiddenCtpNo = $("<input type='hidden' class='ctpNo'>").val(result[i].ctpNo);
		                	 
		                	 writerDateP.append(by).append(writerA).append(on).append(createDateSpan);
		                	 
		                	 footerDiv.append(writerDateP);	                	 
		                	 //로그인 유저와 작성자와 id가 같다면 수정 삭제 버튼 추가
		                	 var userId = "${loginUser.userId}";
		                	 if(result[i].commentWriter == userId){
		                		 var updateCommentDiv = $("<div class='update-comment-div'></div>");
		                		 var updateCommentBtn = $("<p class='update-comment-btn' onclick='updateCommentClick(this);'></p>").text("수정");
		                		 var deleteCommentBtn = $("<p class='delete-comment-btn' onclick='deleteComment(this);'></p>").text("삭제");
		                		 updateCommentDiv.append(updateCommentBtn).append(deleteCommentBtn);
		                		 footerDiv.append(updateCommentDiv);
		                	 }
		                	 
		                	 detailDiv.append(commentP).append(footerDiv).append(hiddenCtpNo);
		                	
		                	
		                	 for(var j=0;j<result[i].star;j++){
		                		 starDiv.append($("<i class='fa fa-star' aria-hidden='true'></i>"));
		                	 }
		                	 outDiv.append(starDiv).append(detailDiv);
		                	 
		                	 
		                	 $(".reviews_area-li").append(outDiv);
		                 }
     		        	 
     		         }
     		         
    			},
    			error : function(){
    				console.log("통신 오류");
    			}
    		});
    		
    	}
    	//의견 총 개수
    	function getCommentCount(){
    		$.ajax({
    			url : "getCommentCount.pp",
    			data : {
    				cntntsNo : ${cntntsNo}
    			},
    			success : function(result){
    				$(".commentCount").text(result);
    			},
    			error : function(){
    				console.log("통신 오류");
    			}
    		});
    	}
    	
   		//의견 업데이트(추가/수정/삭제) 후 해야할 작업 메소드
   		function afterUpdateComment(){
   			//현재페이지 1로 초기화
			$("#currentPage").val(1);
			//의견 들어가있는 li 비우기
			$(".reviews_area-li").empty();
			//숨겨져있을 수도 있던 '의견더보기'버튼 다시 보이게하기
			$(".more-comment-btn").css("display","inline-block");
			//textarea 텍스트 비우기
			$("#commentContent").val("");
			//별점 5점으로 초기화
			$(".star-5").click();
			//다시 의견 목록 불러오기
			selectComment();
			//총 개수 세기
			getCommentCount();
   		}
   		//수정 버튼 클릭 이벤트
   		function updateCommentClick(el){
   			var ctpNo = $(el).parents(".review-details").find(".ctpNo").val(); //댓글 고유번호
   			var userId = "${loginUser.userId}";
   			var content = $(el).parents(".review-details").find(".comment-p").text();
   			//모달창에 아이디 입력
   			$("#updateCommentId").val(userId);
   			//모달창에 의견 입력
   			$("#updateCommentTextarea").val(content);
   			//모달창에 있는 hidden input에 ctnNo(의견 고유 번호) 입력
   			$("#updateCtpNo").val(ctpNo);
   			//모달창 띄우는 버튼 클릭
   			$("#updateModalBtn").click();
   			
   		}
   		
   		//의견 수정 내용 입력 후 수정 진행 이벤트
   		function updateComment(el){
   			var content = $("#updateCommentTextarea").val();
    		var star = $('input[type="radio"][name="updateStar"]:checked').val();
    		var ctpNo = $(el).siblings("#updateCtpNo").val();
    		
    		if(content == ""){
    			alert("의견을 작성해주세요");
    		}else {
	    		$.ajax({
		   			url : "updateComment.pp",
		   			data : {
		   				ctpNo : ctpNo,
		   				star : star,
		   				commentContent : content
		   			},
		   			success : function(result){
		   				if(result == "NNNNY"){
			   				alert("의견 수정 완료");
			   				afterUpdateComment();
			   				//모달 닫기 버튼 클릭이벤트로 모달 닫기
			   				$("#modalCloseBtn").click();

		   				}else{
		   					alert("의견 수정 실패");
		   				}
		   			},
		   			error : function(){
		   				console.log("의견 작성 통신 실패");
		   			}
	    		});
    			
    		}    		
   		}
   		//삭제 이벤트
   		function deleteComment(el){
   			var ctpNo = $(el).parents(".review-details").find(".ctpNo").val(); //댓글 고유번호
   			
   			if(confirm('정말로 삭제하시겠습니까?')){
   				
   				$.ajax({
   					url : "deleteComment.pp",
   					data : {
   						ctpNo : ctpNo
   					},
   					success : function(result){
   						if(result == "NNNNY"){
			   				alert("의견 삭제 완료");
			   				afterUpdateComment();
			   				
		   				}else{
		   					alert("의견 삭제 실패");
		   				}
   					},
   					error : function(){			
   					}
   				});	
   			}
   		}
    </script>
	<!-- ##### Single Product Details Area End ##### -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- ##### Footer Area End ##### -->

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