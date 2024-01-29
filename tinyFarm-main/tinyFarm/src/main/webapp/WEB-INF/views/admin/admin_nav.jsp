<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

	<div class="col-12 col-md-3">
		<div class="post-sidebar-area">

			<!-- ##### Single Widget Area ##### -->
			<!-- 검색창 -->
<!-- 			<div class="single-widget-area"> -->
<!-- 				<form action="#" method="get" class="search-form"> -->
<!-- 					<input type="search" name="search" id="widgetsearch" placeholder="Search..."> -->
<!-- 					<button type="submit"><i class="icon_search"></i></button> -->
<!-- 				</form> -->
<!-- 			</div> -->

			<!-- ##### Single Widget Area ##### -->
			<div class="single-widget-area">
				<!-- Author Widget -->
				<div class="author-widget mb-30">
					<div class="author-thumb-name d-flex align-items-center">
						<div class="author-name">
							<h4><img src="${contextPath }/resources/img/icon/carrot_icon.png"> <b>회원관리</b></h4>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-content">
							<a href="memberList.ad" class="post-title">
								<h6>회원관리</h6>
							</a>
						</div>
					</div>
				</div>
				<div class="author-widget mb-30">
					<div class="author-thumb-name d-flex align-items-center">
						<div class="author-name">
							<h4><img src="${contextPath }/resources/img/icon/carrot_icon.png"> <b>1:1 문의하기</b></h4>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-content">
							<a href="qnaList.ad" class="post-title"><h6>답변 관리</h6></a>
						</div>
					</div>
				</div>

				<div class="author-widget mb-30">
					<div class="author-thumb-name d-flex align-items-center">
						<div class="author-name">
							<h4><img src="${contextPath }/resources/img/icon/carrot_icon.png"> <b>작성 글 관리</b></h4>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-content">
							<a href="boardReportList.ad" class="post-title"><h6>게시글 관리</h6></a>
							<a href="replyReportList.ad" class="post-title"><h6>댓글 관리</h6></a>
						</div>
					</div>
				</div>

				<div class="author-widget mb-30">
					<div class="author-thumb-name d-flex align-items-center">
						<div class="author-name">
							<h4><img src="${contextPath }/resources/img/icon/carrot_icon.png"> <b>도서 관리</b></h4>
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-content">
<!-- 							<a href="bookList.ad" class="post-title"><h6>도서 관리</h6></a> -->
							<a href="bookInsert.re" class="post-title"><h6>도서 등록</h6></a>
							<a href="bookList.ad" class="post-title"><h6>도서 관리</h6></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>