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
<!-- Title -->
<title>마이페이지</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">
<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/jisu/css/mypage.css">
<style>
#updateMe, #myDiary, #myActive, #myTrade {
	border-radius: 10px 10px 10px 10px;
	padding-top: 50px;
	background-color: #f7f5f5;
}

#gradeImg {
	margin: auto;
	width: 50px;
	height: 50px;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

	<div class="breadcrumb-area">
		<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>마이페이지</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ul class="breadcrumb" id="navi">
							<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i>작은농장</a></li>
							<li class="breadcrumb-item"><a href="mypage.me">마이페이지</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-8">
                    <div class="row">
                        	<div class="myInfo">
                        		<c:choose>
                        			<c:when test="${loginUser.grade eq '씨앗'}">
		                        		<img src="resources/jisu/img/seed.png" id="gradeImg"> <br>
                        			</c:when>
                        			<c:when test="${loginUser.grade eq '새싹'}">
		                        		<img src="resources/jisu/img/shoot.png" id="gradeImg"> <br>
                        			</c:when>
                        			<c:when test="${loginUser.grade eq '잎새'}">
		                        		<img src="resources/jisu/img/leaf.png" id="gradeImg"> <br>
                        			</c:when>
                        			<c:when test="${loginUser.grade eq '열매'}">
		                        		<img src="resources/jisu/img/fruit.png" id="gradeImg"> <br>
                        			</c:when>
                        		</c:choose>
                        		<!-- 등급은 굵은 글씨로 나타내기 -->
                        		<span>작은농장의 '<span style="font-weight: bold;">${loginUser.grade } </span>' ${loginUser.userName }님</span>
                        	</div>
                        <div class="myPageMain">
                            <div id="updateMe">
                                <a href="update.me">정보수정 <br>
                                <img alt="update-icon" src="resources/jisu/img/update-icon.png">
                                </a>
                            </div>
                            <div id="myDiary">
                                <a href="diary.me">영농일지 <br>
                                <img alt="diary-icon" src="resources/jisu/img/diary-icon.png">
                                </a>'
                            </div>
                            <div id="myActive">
                                <a href="active.me">활동내역 <br>
                                <img alt="active-icon" src="resources/jisu/img/active-icon.png">
                                </a>
                            </div>
                            <div id="myTrade">
                                <a href="trade.me">거래내역 <br>
                                <img alt="trade-icon" src="resources/jisu/img/trade-icon.png">
                                </a>
                            </div>
                       </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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