<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>작은농장</title>

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${contextPath }/resources/style.css">

    <!-- Favicon -->
    <link rel="icon" href="${contextPath }/resources/img/core-img/favicon.ico">
    
    <style type="text/css">
    	.display__none{
			 display: none
    	}
    </style>
</head>
<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="${contextPath }/resources/img/core-img/leaf.png" alt="">
        </div>
    </div>


   
    <%@ include file="/WEB-INF/views/common/header.jsp" %>


    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${contextPath }/resources/img/bg-img/24.jpg);">
            <h2>Admin</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${contextPath }"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Admin</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
            
            
            	<%@ include file="admin_nav.jsp" %>

						
				<div class="col-12 col-md-9" id="pdfDiv">
					<!-- <div class="row"> -->
					<%-- <%@ include file="/WEB-INF/views/common/weather/weather_today.jsp" %> --%>
					
					<div class="text-right breadcrumb-item"><a href="#" id="savePdfBtn"><i class="fa fa-download" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;PDF DOWNLOAD</a></div>
					
					
					<section class="cool-facts-area bg-img ">
						<!-- style="background-image: url(${contextPath }/resources/img/bg-img/cool-facts.png);"> -->
						<div class="container">
							<div class="row col-12 col-lg-12">
								<div class="section-heading">
									<h2>사이트 통계</h2>
									<h5 class="py-2">
										<i class="fa fa-check" aria-hidden="true"></i> 오늘의 통계
									</h5>
								</div>
								<div class="d-flex col-12 col-lg-12">

									<div class="col-12 col-sm-3">
										<div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
											<div class="pr-3">
												<img src="${contextPath }/resources/img/core-img/statics.png" alt="">
											</div>
											<div class="cf-content text-center">
												<a href="#" onclick="showStatics(this.name)" name="mStatics">
													<h6 class="py-2">신규 가입</h6>
													<h2><span class="counter">${todayMap.mCount}</span></h2>
												</a>
											</div>
										</div>
									</div>
									<div class="col-12 col-sm-3">
										<div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
											<div class="pr-3">
												<!-- <i class="fa fa-comment fa-lg"></i> -->
												<img src="${contextPath }/resources/img/core-img/statics.png" alt="">
											</div>
											<div class="cf-content text-center">
												<a href="#" onclick="showStatics(this.name)" name="qStatics">
													<h6 class="py-2">신규 문의</h6>
													<h2><span class="counter">${todayMap.qCount}</span></h2>
												</a>
											</div>
										</div>
									</div>

									<div class="col-12 col-sm-3">
										<div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
											<div class="pr-3">
												<!-- <i class="fa fa-lemon-o fa-lg"></i> -->
												<img src="${contextPath }/resources/img/core-img/statics.png" alt="">
											</div>
											<div class="cf-content text-center">
												<a href="#" onclick="showStatics(this.name)" name="pStatics">
													<h6 class="py-2">신규 상품</h6>
													<h2><span class="counter">${todayMap.pCount}</span></h2>
												</a>
											</div>
										</div>
									</div>

									<div class="col-12 col-sm-3">
										<div
											class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
											<div class="pr-3">
												<!-- <i class="fa fa-pencil fa-lg" aria-hidden="true"></i> -->
												<img src="${contextPath }/resources/img/core-img/statics.png" alt="">
											</div>
											<div class="cf-content text-center">
												<a href="#" onclick="showStatics(this.name)" name="pmStatics">
													<h6 class="py-2">신규 주문</h6>
													<h2><span class="counter">${todayMap.pmCount}</span></h2>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="d-flex col-12 col-lg-12">

									<div class="col-12 col-sm-3">
										<div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
											<div class="pr-3">
												<img src="${contextPath }/resources/img/core-img/statics.png" alt="">
											</div>
											<div class="cf-content text-center">
												<a href="#" onclick="showStatics(this.name)" name="bStatics">
													<h6 class="py-2">신규 게시글</h6>
													<h2><span class="counter">${todayMap.bCount}</span></h2>
												</a>
											</div>
										</div>
									</div>
									<div class="col-12 col-sm-3">
										<div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
											<div class="pr-3">
												<!-- <i class="fa fa-comment fa-lg"></i> -->
												<img src="${contextPath }/resources/img/core-img/statics.png" alt="">
											</div>
											<div class="cf-content text-center">
												<a href="#" onclick="showStatics(this.name)" name="bStatics">
													<h6 class="py-2">신규 신고글</h6>
													<h2><span class="counter">${todayMap.breCount }</span></h2>
												</a>
											</div>
										</div>
									</div>

									<div class="col-12 col-sm-3">
										<div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
											<div class="pr-3">
												<!-- <i class="fa fa-lemon-o fa-lg"></i> -->
												<img src="${contextPath }/resources/img/core-img/statics.png" alt="">
											</div>
											<div class="cf-content text-center">
												<a href="#" onclick="showStatics(this.name)" name="bStatics">
													<h6 class="py-2">신규 신고댓글</h6>
													<h2><span class="counter">${todayMap.rreCount }</span></h2>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>




					<h6 class="py-2 text-center">
						<i class="fa fa-caret-down" aria-hidden="true"></i> 부문별 상세 통계
					</h6>

					<!-- 회원 -->
					<section class="cool-facts-area bg-img staticsSection" id="mStatics"> 
						<div class="container">

							<div class="py-3">
								<div class="section-heading mt-2">
									<h6 class="py-1"><img src="${contextPath }/resources/img/icon/peach_icon.png"> 전체 상세통계</h6>
								</div>
								<div class="clearfix mt-15" id="">
									<table class="table" width="100%">
										<colgroup>
											<col width="20%">
											<col width="20%">
											<col width="20%">
											<col width="20%">
											<col width="20%">
										</colgroup>
										<thead>
											<tr align="center">
												<th>전체 회원수</th>
												<th>활동 회원수</th>
												<th>탈퇴/활중 회원수</th>
												<th>가입 회원수(일반)</th>
												<th>가입 회원수(소셜)</th>
											</tr>
										</thead>
										<tbody>
											<tr align="center">
												<td>${mMap.allCount }</td>
												<td>${mMap.activeCount }</td>
												<td>${mMap.dropCount }</td>
												<td>${mMap.normalCount }</td>
												<td>${mMap.snsCount }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</section>


					<!-- QNA -->
					<section class="cool-facts-area bg-img staticsSection" id="qStatics">
						<div class="container">

							<div class="py-3">
								<div class="section-heading mt-2">
									<h6 class="py-1"><img src="${contextPath }/resources/img/icon/peach_icon.png"> 전체 상세통계</h6>
								</div>
								<div class="clearfix mt-15" id="">
									<table class="table" width="100%">
										<colgroup>
											<col width="25%">
											<col width="25%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<thead>
											<tr align="center">
												<th>전체 문의사항수</th>
												<th>신규 문의사항수</th>
												<th>미답변</th>
												<th>답변완료</th>
											</tr>
										</thead>
										<tbody>
											<tr align="center">
												<td>${qnaMap.qnaCount }</td>
												<td>${todayMap.qCount }</td>
												<td>${qnaMap.qnaCount - qnaMap.qnaAnswerCount}</td>
												<td>${qnaMap.qnaAnswerCount }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</section>


					<!-- 상품 -->
					<section class="cool-facts-area bg-img staticsSection" id="pStatics">
						<div class="container">

							<div class="py-3">
								<div class="section-heading mt-2">
									<h6 class="py-1"><img src="${contextPath }/resources/img/icon/peach_icon.png"> 전체 상세통계</h6>
								</div>
								<div class="clearfix mt-15" id="">
									<table class="table" width="100%">
										<colgroup>
											<col width="25%">
											<col width="25%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<tbody>
											<tr align="center">
												<th>전체 상품수</th>
												<th>신규 등록 상품수</th>
												<th>판매가능 상품수</th>
												<th>판매완료 상품수</th>
											</tr>
											<tr align="center">
												<td>${productMap.allCount }</td>
												<td>${todayMap.pCount }</td>
												<td>${productMap.onSaleCount }</td>
												<td>${productMap.allCount - productMap.onSaleCount }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<div class="py-3">
								<div class="section-heading">
									<h6 class="py-1"><img src="${contextPath }/resources/img/icon/peach_icon.png"> 상품 카테고리 비율</h6>
								</div>
								<div class="alazea-progress-bar mb-50">
									<!-- Single Progress Bar -->
									<div class="single_progress_bar">
										<p class="pb-3">채소</p>
										<div id="bar1" class="barfiller">
											<div class="tipWrap">
												<span class="tip"></span>
											</div>
											<span class="fill" data-percentage="${ productMap.vegetable * 100 / productMap.allCount }"></span>
										</div>
									</div>
									<!-- Single Progress Bar -->
									<div class="single_progress_bar">
										<p class="pb-3">과일</p>
										<div id="bar2" class="barfiller">
											<div class="tipWrap">
												<span class="tip"></span>
											</div>
											<span class="fill" data-percentage="${ productMap.fruit * 100 / productMap.allCount }"></span>
										</div>
									</div>
									<div class="single_progress_bar">
										<p class="pb-3">곡물</p>
										<div id="bar3" class="barfiller">
											<div class="tipWrap">
												<span class="tip"></span>
											</div>
											<span class="fill" data-percentage="${ productMap.grain * 100 / productMap.allCount }"></span>
										</div>
									</div>
									<div class="single_progress_bar">
										<p class="pb-3">기타</p>
										<div id="bar4" class="barfiller">
											<div class="tipWrap">
												<span class="tip"></span>
											</div>
											<span class="fill" data-percentage="0"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
					 
					
					<!-- 결제 -->
					<section class="cool-facts-area bg-img staticsSection" id="pmStatics">
						<div class="container">

							<div class="py-3">
								<div class="section-heading mt-2">
									<h6 class="py-1"><img src="${contextPath }/resources/img/icon/peach_icon.png"> 전체 상세통계</h6>
								</div>
								<div class="clearfix mt-15" id="">
									<table class="table" width="100%">
										<colgroup>
											<col width="25%">
											<col width="25%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<tbody>
											<tr align="center">
												<th>전체 결제수</th>
												<th>일일 결제수</th>
												<th>일일 평균 결제금액</th>
												<th>일일 누적 결제금액</th>
											</tr>
											<tr align="center">
												<td>${paymentMap.allCount }</td>
												<td>${todayMap.pmCount }</td>
												<td>${paymentMap.todayAvg} ₩</td>
												<td>${paymentMap.todaySum} ₩</td>
											</tr>
											<tr align="center">
												<th>최고 결제금액</th>
												<th>최저 결제금액</th>
												<th>평균 결제금액</th>
												<th>누적 결제금액</th>
											</tr>
											<tr align="center">
												<td>${paymentMap.max} ₩</td>
												<td>${paymentMap.min} ₩</td>
												<td>${paymentMap.avg} ₩</td>
												<td>${paymentMap.sum} ₩</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</section>
					
					
					<!-- 게시판/댓글 -->
					<section class="cool-facts-area bg-img staticsSection" id="bStatics">
						<div class="container">

							<div class="py-3">
								<div class="section-heading mt-2">
									<h6 class="py-1"><img src="${contextPath }/resources/img/icon/peach_icon.png"> 전체 상세통계</h6>
								</div>
								<div class="clearfix mt-15" id="">
									<table class="table" width="100%">
										<colgroup>
											<col width="25%">
											<col width="25%">
											<col width="25%">
											<col width="25%">
										</colgroup>
										<tbody>
											<tr align="center">
												<th>전체 게시글수</th>
												<th>전체 댓글수</th>
												<th>전체 신고 게시글수</th>
												<th>전체 신고 댓글수</th>
											</tr>
											<tr align="center">
												<td>${boardMap.boardCount }</td>
												<td>${boardMap.boardReplyCount }</td>
												<td>${boardMap.boardReportCount }</td>
												<td>${boardMap.replyReportCount }</td>
											</tr>
											<tr align="center">
												<th>일일 게시글수</th>
												<th>일일 댓글수</th>
												<th>일일 신고 게시글수</th>
												<th>일일 신고 댓글수</th>
											</tr>
											<tr align="center">
												<td>${todayMap.bCount }</td>
												<td>${todayMap.brCount }</td>
												<td>${todayMap.breCount }</td>
												<td>${todayMap.rreCount }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</section>
					
					
					
					<script type="text/javascript">
						$(function(){
							$(".staticsSection").hide();
						})
						
						function showStatics(data){
							$(".staticsSection").hide();
							$("#" + data).show();
						}
						
						
						
						$('#savePdfBtn').click(function() {
						    html2canvas($('#pdfDiv')[0]).then(function(canvas) {
						        // 캔버스를 이미지로 변환
						        let imgData = canvas.toDataURL('image/png');

						        let margin = 10;					// 출력 페이지 여백설정
						        let imgWidth = 210 - (10 * 2);		// 이미지 가로 길이(mm) A4 기준
						        let pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
						        let imgHeight = canvas.height * imgWidth / canvas.width;
						        let heightLeft = imgHeight;
						        
						        let doc = new jsPDF('p', 'mm');
						        let position = margin;

						        // 첫 페이지 출력
						        doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
						        heightLeft -= pageHeight;

						        // 한 페이지 이상일 경우 루프 돌면서 출력
						        while (heightLeft >= 20) {
						            position = heightLeft - imgHeight;
						            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
						            doc.addPage();
						            heightLeft -= pageHeight;
						        }

						        // 파일 저장
						        doc.save('stastic_sample.pdf');
						    });
						});
						
					</script>
					
				</div>
             </div>
         </div>
    </section>
    <!-- ##### Blog Area End ##### -->



    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
	 
	<script type="text/javascript" src="${contextPath}/resources/js/pdf/jspdf.min.js" rel="stylesheet"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/pdf/html2canvas.js" rel="stylesheet"></script>

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${contextPath }/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${contextPath }/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${contextPath }/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${contextPath }/resources/js/active.js"></script>
</body>

</html>