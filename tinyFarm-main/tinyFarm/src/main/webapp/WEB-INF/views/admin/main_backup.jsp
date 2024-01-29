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

    <!-- Favicon -->
    <link rel="icon" href="${contextPath }/resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${contextPath }/resources/style.css">
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
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
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

                
                <div class="col-12 col-md-9">
                    <!-- <div class="row"> -->
<%-- 					<%@ include file="/WEB-INF/views/common/weather/weather_today.jsp" %> --%>
                    	
                    	 <section class="cool-facts-area bg-img">
                            <!-- style="background-image: url(${contextPath }/resources/img/bg-img/cool-facts.png);"> -->
                            <div class="container">
                                <div class="row col-12 col-lg-12">
<!--                        				<div class="mb-50"><h2>Today's Schedule</h2></div> -->
<!--                        				<p>오늘의 통계</p> -->
                       				
                                    <!-- Section Heading -->
                                    <div class="section-heading">
                                        <h2>사이트 통계</h2>
                                        <h5 class="py-1"><i class="fa fa-check" aria-hidden="true"></i> 오늘의 통계</h5>
                                    </div>
<!--                                     <div><p>Quisque orci quam, vulputate non commodo finibus, molestie ac ante. Duis in sceleri quesem. Nulla sit amet varius nunc. Maecenas dui, tempeu ullam corper in.</p></div> -->
                        
									
									<div class="d-flex col-12 col-lg-12">

										<!-- Single Cool Facts Area -->
	                                    <div class="col-12 col-sm-3">
	                                        <div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
	                                            <div class="pr-3">
<!-- 	                                            <i class="fa fa-user fa-lg"></i> -->
	                                                <img src="${contextPath }/resources/img/core-img/statics.png" alt="">
	                                            </div>
	                                            <div class="cf-content text-center" >
	                                            	<a href="#" onclick="">
		                                                <h6 class="py-2">신규 가입</h6>
		                                                <h2><span class="counter">${todayMap.mCount}</span></h2>
	                                                </a>
	                                            </div>
	                                        </div>
	                                    </div>
										<!-- Single Cool Facts Area -->
	                                    <div class="col-12 col-sm-3">
	                                        <div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
	                                            <div class="pr-3">
<!-- 	                                            <i class="fa fa-comment fa-lg"></i> -->
	                                                <img src="${contextPath }/resources/img/core-img/statics.png" alt="">
	                                            </div>
	                                            <div class="cf-content text-center">
	                                            	<a href="#" onclick="">
		                                                <h6 class="py-2">신규 문의</h6>
		                                                <h2><span class="counter">${todayMap.qCount}</span></h2>
		                                            </a>
	                                            </div>
	                                        </div>
	                                    </div>
										<!-- Single Cool Facts Area -->
	                                    <div class="col-12 col-sm-3">
	                                        <div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
	                                            <div class="pr-3">
<!-- 	                                            <i class="fa fa-lemon-o fa-lg"></i> -->
	                                                <img src="${contextPath }/resources/img/core-img/statics.png" alt="">
	                                            </div>
	                                            <div class="cf-content text-center">
	                                            	<a href="#" onclick="">
		                                                <h6 class="py-2">신규 상품</h6>
		                                                <h2><span class="counter">${todayMap.pCount}</span></h2>
		                                            </a>
	                                            </div>
	                                        </div>
	                                    </div>
										<!-- Single Cool Facts Area -->
	                                    <div class="col-12 col-sm-3">
	                                        <div class="single-cool-fact d-flex align-items-center justify-content-center mb-100">
	                                            <div class="pr-3">
	                                            	
<!-- 	                                            <i class="fa fa-pencil fa-lg" aria-hidden="true"></i> -->
	                                                <img src="${contextPath }/resources/img/core-img/statics.png" alt="">
	                                            </div>
	                                            <div class="cf-content text-center">
	                                            	<a href="#" onclick="">
		                                                <h6 class="py-2">신규 게시글</h6>
		                                                <h2><span class="counter">${todayMap.bCount}</span></h2>
		                                            </a>
	                                            </div>
	                                        </div>
	                                    </div>
	                        
									</div>
                        			
                                </div>
                            </div>
                        </section>

						<section class="about-us-area">
                            <div class="container">
                                <div class="row justify-content-between">
                                    <div class="col-12 col-lg-12">
                                        <!-- Section Heading -->
	                                    <div class="section-heading">
<!-- 	                                        <h2>전체 상세 통계</h2> -->
	                                        <h6 class="py-1">🌱 전체 상세통계</h6>
	                                    </div>
                    
                                         <div class="clearfix mt-15 mb-15" id="memberListTable">
				                            <table class="table " width="100%">
				                                <colgroup>
				                                    <col width="20%">
				                                    <col width="20%">
				                                    <col width="20%">
				                                    <col width="20%">
				                                    <col width="20%">
				                                </colgroup>
				                                <thead>
				                                    <tr align="center">
				                                        <th>활동 회원수</th>
				                                        <th>탈퇴/활중 회원수</th>
				                                        <th>가입 회원수(일반)</th>
				                                        <th>가입 회원수(소셜)</th>
				                                        <th>전체 회원수</th>
				                                    </tr>
				                                    <tr align="center">
				                                        <td>${mMap.activeCount }</td>
				                                        <td>${mMap.dropCount }</td>
				                                        <td>${mMap.normalCount }</td>
				                                        <td>${mMap.snsCount }</td>
				                                        <td>${mMap.allCount }</td>
				                                    </tr>
				                                </thead>
				                                <tbody></tbody>
				                            </table>
				                        </div>
				                        
                                        <div class="section-heading">
	                                        <h6 class="py-1">🌱 가입 PERCENTAGE</h6>
	                                    </div>
				                        <!-- Progress Bar Content Area -->
                                        <div class="alazea-progress-bar mb-50">
                                            <!-- Single Progress Bar -->
                                            <div class="single_progress_bar">
                                                <p>일반 회원</p>
                                                <div id="bar1" class="barfiller">
                                                    <div class="tipWrap">
                                                        <span class="tip"></span>
                                                    </div>
                                                    <span class="fill" data-percentage="${ mMap.normalPercentage }"></span>
                                                </div>
                                            </div>
                                            <!-- Single Progress Bar -->
                                            <div class="single_progress_bar">
                                                <p>소셜 가입 회원</p>
                                                <div id="bar2" class="barfiller">
                                                    <div class="tipWrap">
                                                        <span class="tip"></span>
                                                    </div>
                                                    <span class="fill" data-percentage="${ 100 - mMap.normalPercentage }"></span>
                                                </div>
                                            </div>
                                        </div>
				                        
                                        <div class="section-heading">
	                                        <h6 class="py-1">🌱 활동 PERCENTAGE</h6>
	                                    </div>
				                        <!-- Progress Bar Content Area -->
                                        <div class="alazea-progress-bar mb-50">
                                            <!-- Single Progress Bar -->
                                            <div class="single_progress_bar">
                                                <p>활동 회원</p>
                                                <div id="bar3" class="barfiller">
                                                    <div class="tipWrap">
                                                        <span class="tip"></span>
                                                    </div>
                                                    <span class="fill" data-percentage="${ mMap.activePercentage }"></span>
                                                </div>
                                            </div>
                                            <!-- Single Progress Bar -->
                                            <div class="single_progress_bar">
                                                <p>비활동 회원</p>
                                                <div id="bar4" class="barfiller">
                                                    <div class="tipWrap">
                                                        <span class="tip"></span>
                                                    </div>
                                                    <span class="fill" data-percentage="${ 100 - mMap.activePercentage }"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                   
                                </div>
                            </div>
                        </section>
                        

<!--                         <section class="about-us-area section-padding-100-0"> -->
<!--                             <div class="container"> -->
<!--                                 <div class="row justify-content-between"> -->
<!--                                     <div class="col-12"> -->
<!--                                         Section Heading -->
<!--                                         <div class="section-heading"> -->
<!--                                             <h2>ABOUT US</h2> -->
<!--                                             <p>We are leading in the plants service fields.</p> -->
<!--                                         </div> -->
<!--                                         <p>Quisque orci quam, vulputate non commodo finibus, molestie ac ante. Duis in sceleri quesem. Nulla sit amet varius nunc. Maecenas dui, tempeu ullam corper in.</p> -->
<!--                                     </div> -->
                    
<!--                                     <div class="col-12"> -->
<!--                                         <div class="alazea-benefits-area"> -->
<!--                                             <div class="row"> -->
<!--                                                 Single Benefits Area -->
<!--                                                 <div class="col-12 col-sm-6"> -->
<!--                                                     <div class="single-benefits-area"> -->
<%--                                                         <img src="${contextPath }/resources/img/core-img/b1.png" alt=""> --%>
<!--                                                         <h5>Quality Products</h5> -->
<!--                                                         <p>Intiam eu sagittis est, at commodo lacini libero. Praesent dignissim sed odio vel aliquam manta lagorn.</p> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
                    
<!--                                                 Single Benefits Area -->
<!--                                                 <div class="col-12 col-sm-6"> -->
<!--                                                     <div class="single-benefits-area"> -->
<%--                                                         <img src="${contextPath }/resources/img/core-img/b2.png" alt=""> --%>
<!--                                                         <h5>Perfect Service</h5> -->
<!--                                                         <p>Intiam eu sagittis est, at commodo lacini libero. Praesent dignissim sed odio vel aliquam manta lagorn.</p> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
                    
<!--                                                 Single Benefits Area -->
<!--                                                 <div class="col-12 col-sm-6"> -->
<!--                                                     <div class="single-benefits-area"> -->
<%--                                                         <img src="${contextPath }/resources/img/core-img/b3.png" alt=""> --%>
<!--                                                         <h5>100% Natural</h5> -->
<!--                                                         <p>Intiam eu sagittis est, at commodo lacini libero. Praesent dignissim sed odio vel aliquam manta lagorn.</p> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
                    
<!--                                                 Single Benefits Area -->
<!--                                                 <div class="col-12 col-sm-6"> -->
<!--                                                     <div class="single-benefits-area"> -->
<%--                                                         <img src="${contextPath }/resources/img/core-img/b4.png" alt=""> --%>
<!--                                                         <h5>Environmentally friendly</h5> -->
<!--                                                         <p>Intiam eu sagittis est, at commodo lacini libero. Praesent dignissim sed odio vel aliquam manta lagorn.</p> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </section> -->

                       

                </div>
            </div>
        </div>
    </section>
    <!-- ##### Blog Area End ##### -->



    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
 
 
 	<script type="text/javascript">
 		
 	
 	
 	</script>
 

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