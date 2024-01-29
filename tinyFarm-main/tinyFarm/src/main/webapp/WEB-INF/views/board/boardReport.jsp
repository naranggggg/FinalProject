<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<!-- Title -->
<title>작은농장</title>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- alert창 꾸미기 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

<style>
.pl {
	width: 200px;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 12px 13px;
	font-family: 'Roboto';
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
}

.pl:focus {
	border: 1px solid #9B51E0;
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid #F8E4FF;
	border-radius: 10px;
}
</style>

</head>

<body>
	<%@include file="../common/header.jsp"%>

	<!-- 상단 -->
	<div class="breadcrumb-area">
		<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>이야기 공간</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/tinyfarm"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">신고하기</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 끝 -->

	<!-- 신고 영역 -->
	<section class="blog-content-area section-padding-0-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-8">
					<div class="blog-posts-area">
						<div class="leave-comment-area clearfix">
							<div class="comment-form">
								<form action="report.bo" method="post">
									<h4 class="headline">
										<span>신고</span> 
									</h4>
									<input type="hidden" name="reportWriter" value="${reportWriter }"> 
									<input type="hidden" name="refBno" value="${refBno }">
									<table>
										<tr>
											<th><label for="category">카테고리</label>&nbsp;&nbsp;</th>
											<td><select name="category" class="pl">
													<option value="스팸" selected>1: 스팸</option>
													<option value="욕설">2: 욕설</option>
													<option value="광고">3: 광고</option>
													<option value="음란물">4: 음란물</option>
											</select></td>
										</tr>

										<tr>
											<th><label for="reportContent">신고내용</label>&nbsp;&nbsp;</th>
											<td>
												<div class="contact-form-area">
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<textarea class="form-control" name="reportContent" id="reportContent" cols="70" rows="10" style="resize: none;" placeholder="Report Comment"></textarea>
															</div>
														</div>
														<div class="col-12">
															<button type="submit" class="btn alazea-btn " id="reportBtn">신고하기</button>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</form>
							</div>

							<div class="comment_area clearfix">
								<ol>
									<li class="single_comment_area"></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>







	<jsp:include page="../common/footer.jsp"></jsp:include>

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