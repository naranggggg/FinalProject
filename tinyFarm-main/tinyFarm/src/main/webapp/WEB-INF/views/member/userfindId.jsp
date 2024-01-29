<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<title>Insert title here</title>
	
		<% String contextPath = request.getContextPath(); %>
	 	
	 	<!-- Title -->
	    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>
	
	    <!-- Favicon -->
	    <link rel="icon" href="/resources/img/core-img/favicon.ico">
	
	    <!-- Core Stylesheet -->
	    <link rel="stylesheet" href="<%= contextPath %>/resources/style.css">
	    <style>
		    .center-input {
		        margin: 0 auto;
		        text-align: center;
		    }
		</style>
	    
	  
	</head>
	<body>
	
		<%@include file="/WEB-INF/views/common/header.jsp" %>
			
			<div class="breadcrumb-area">
						<!-- Top Breadcrumb Area -->
						<div
							class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
							style="background-image: url(resources/img/bg-img/24.jpg);">
							<h2>아이디 찾기</h2>
						</div>
				
						<div class="container">
							<div class="row">
								<div class="col-12">
									<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/"><i
												class="fa fa-home"></i> Home</a></li>
										<li class="breadcrumb-item"><a href="#">아이디찾기</a></li>
										
									</ol>
									</nav>
								</div>
							</div>
						</div>
					</div>
				<div align="center">
				    <form action="findIdResult.me" name="idfindscreen" method="post">
				        <div class="search-title">
				            <h4 style = "margin-bottom:40px">회원 정보에 등록된 이름과 전화번호로 찾기</h4>
				        </div>
				
				        <div class="row">
						    <div class="col-6 col-md-9">
						        <div class="form-group" style = "margin-left:430px"> 
						            <input type="text" class="form-control" id="userName" style="width:300px;" placeholder="Name" name="userName">
						        </div>
						    </div>
						    <div class="col-9">
						        <div class="form-group" style = "margin-left:430px">
						            <input type="text" class="form-control" id="phone" style="width:300px;" placeholder="Tel" name="phone">
						        </div>
						    </div>
						    <div class="col-8 center-input">
						        <button type="submit" onclick="return id_search()" class="btn mt-15" style="background-color:#70c745; color:white; height: 45px; width:300px">아이디 찾기</button>
						    </div>
						    <div class="col-9 center-input">
						        <button type="button" onclick="history.back()" class="btn mt-15" style="background-color:#D5D5D5; margin-bottom: 100px; color:white; height: 45px; width:300px">취소</button>
						    </div>
						</div>
				    </form>
				</div>
				<script>
					function id_search() { 
					 	var frm = document.idfindscreen;
				
						if (frm.userName.value.length < 1) {
								alert("이름을 입력해주세요");
								return false;
							}

						if (frm.phone.value.length != 11) {
							alert("핸드폰번호를 정확하게 입력해주세요");
							return false;
						}
					}
				</script>
			<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	      <!-- ##### All Javascript Files ##### -->
		    <!-- jQuery-2.2.4 js -->
		    <script src="<%= contextPath %>/resources/js/jquery/jquery-2.2.4.min.js"></script>
		    <!-- Popper js -->
		    <script src="<%= contextPath %>/resources/js/bootstrap/popper.min.js"></script>
		    <!-- Bootstrap js -->
		    <script src="<%= contextPath %>/resources/js/bootstrap/bootstrap.min.js"></script>
		    <!-- All Plugins js -->
		    <script src="<%= contextPath %>/resources/js/plugins/plugins.js"></script>
		    <!-- Active js -->
		    <script src="<%= contextPath %>/resources/js/active.js"></script>
		
	</body>
</html>