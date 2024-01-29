<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.tinyfarm.member.model.dao.MemberDao" %>
<%@ page import="com.kh.tinyfarm.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <title>아이디 찾기 결과</title>
    <% String contextPath = request.getContextPath(); %>

    <link rel="icon" href="/resources/img/core-img/favicon.ico">

    <link rel="stylesheet" href="<%= contextPath %>/resources/style.css">
    <style>
		    .center-input {
		        margin: 0 auto;
		        text-align: center;
		    }
		    
		    @font-face {
			  font-family: 'LotteMartDream';
			  font-style: normal;
			  font-weight: 400;
			  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
			}
	</style>
  
</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
			<div class="breadcrumb-area">
						<!-- Top Breadcrumb Area -->
						<div
							class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
							style="background-image: url(resources/img/bg-img/24.jpg); font-family:LotteMartDream">
							<h2>아이디 찾기</h2>
						</div>
				
						<div class="container">
							<div class="row">
								<div class="col-12">
									<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/"><i
												class="fa fa-home"></i> Home</a></li>
										<li class="breadcrumb-item"><a href="#">FIND ID</a></li>
										
									</ol>
									</nav>
								</div>
							</div>
						</div>
					</div>
	  <c:choose>
	    <c:when test="${not empty userId}">
	        <div class="found-success">
	            <h5 style="text-align: center; margin-bottom : 100px">회원님의 아이디는 ${userId} 입니다</h5>
	        </div>
	    </c:when>
	    <c:otherwise>
	        <div class="container found-fail">
	            <h4>등록된 정보가 없습니다</h4>
	            <div class="found-login">
	                <input type="button" id="btnback" value="다시 찾기" onClick="history.back()" />
	                <input type="button" id="btnjoin" value="회원가입">
	            </div>
	        </div>
	    </c:otherwise>
		</c:choose>

    <div class="col-8 center-input">
        <input type="button" id="btnLogin" class="btn mt-15" style = "height: 45px; width:300px; 
	        margin-bottom:100px; margin-top: -20px; color : white; background-color:#70c745;" value="로그인" 
	        onClick="location.href='loginGo.me'" />
    </div>

    </form>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

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