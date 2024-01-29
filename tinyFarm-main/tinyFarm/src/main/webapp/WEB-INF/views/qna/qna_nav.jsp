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
<!-- 					<input type="search" name="search" id="widgetsearch" -->
<!-- 						placeholder="Search..."> -->
<!-- 					<button type="submit"> -->
<!-- 						<i class="icon_search"></i> -->
<!-- 					</button> -->
<!-- 				</form> -->
<!-- 			</div> -->
	
			<!-- ##### Single Widget Area ##### -->
			<div class="single-widget-area">
				<!-- Author Widget -->
				<div class="author-widget mb-30">
					<div class="author-thumb-name d-flex align-items-center">
						<div class="author-name">
							<h4><img src="${pageContext.request.contextPath }/resources/img/icon/carrot_icon.png"> <b>문의하기</b></h4>
							<!-- <p>Editor</p> -->
						</div>
					</div>
					<div class="single-latest-post d-flex align-items-center">
						<div class="post-content">
							<a href="qnaForm.qa" class="post-title"><h6>문의사항 작성</h6></a>
							<a href="qnaList.qa" class="post-title"><h6>나의 문의내역</h6></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>