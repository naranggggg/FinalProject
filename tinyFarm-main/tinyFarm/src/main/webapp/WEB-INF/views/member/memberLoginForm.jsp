<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%
String contextPath = request.getContextPath();
%>

<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Alazea - Gardening &amp; Landscaping HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="/resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="<%=contextPath%>/resources/style.css">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>로그인</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">로그인</a></li>

						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>


	<!-- ##### Contact Area Start ##### -->
	<section class="contact-area">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-12 col-lg-5">
					<!-- Section Heading -->
					<div class="section-heading">
						<h2>로그인</h2>
					</div>
					<!-- Contact Form Area -->
					<div class="contact-form-area mb-100">
						<form action="login.me" method="post">
							<div class="row">
								<div class="col-6 col-md-9">
									<div class="form-group">
										<input type="text" class="form-control" id="contact-name"
											style="width: 300px" placeholder="ID" name="userId">
									</div>
								</div>
								<div class="col-9">
									<div class="form-group">
										<input type="password" class="form-control"
											id="contact-subject" style="width: 300px" placeholder="PW"
											name="userPwd">
									</div>
									<input type="checkbox" id="checkId" name="checkId"> <label
										for="checkId"><span></span></label> 아이디 저장
								</div>
								<div class="col-8">
									<button type="submit" class="btn mt-15"
										style="background-color: #70c745; color: white; height: 45px; width: 300px">로그인</button>
								</div>
								<div class="col-9 mt-100">
									<div>
										<a href="javascript:loginWithKakao()"><img
											style="margin-top: -150px"
											src="<%=contextPath%>/resources/kakao_login.png"
											style="width:286px"></a>
									</div>
								</div>
								<br>
							</div>
						</form>
						<div style="margin-top: -45px; margin-left: 125px">
							<a href="userfind.me">아이디 찾기 /</a> 
							<a href="findPw.me">비밀번호 찾기</a>
						</div>
						<!-- 로그아웃 버튼 
						<a href="javascript:kakaoLogout();">로그아웃</a>-->
					</div>
				</div>

				<div class="col-12 col-lg-6">
					<!-- Google Maps -->
					<div class="map-area mb-100">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.9016726418326!2d126.89440347572295!3d37.533815072047126!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec3afcd675b%3A0x1d3b8e50a735e00a!2z7J2066CI67mM65Sp!5e0!3m2!1sko!2skr!4v1702889538581!5m2!1sko!2skr"
							width="600" height="450" style="border: 0;" allowfullscreen=""
							loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		//아이디 저장
	    $(document).ready(function () {
	        var key = getCookie("key");
	        $("#contact-name").val(key);
	
	        if ($("#contact-name").val() != "") {
	            $("#checkId").prop("checked", true);
	        }
	
	        $("#checkId").change(function () {
	            if ($("#checkId").is(":checked")) {
	                setCookie("key", $("#contact-name").val(), 7);
	            } else {
	                deleteCookie("key");
	            }
	        });
	
	        $("#contact-name").keyup(function () {
	            if ($("#checkId").is(":checked")) {
	                setCookie("key", $("#contact-name").val(), 7);
	            }
	        });
	
	        function setCookie(cookieName, value, exdays) {
	            var exdate = new Date();
	            exdate.setDate(exdate.getDate() + exdays);
	            var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	            document.cookie = cookieName + "=" + cookieValue;
	        }
	
	        function deleteCookie(cookieName) {
	            var expireDate = new Date();
	            expireDate.setDate(expireDate.getDate() - 1);
	            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	        }
	
	        function getCookie(cookieName) {
	            cookieName = cookieName + '=';
	            var cookieData = document.cookie;
	            var start = cookieData.indexOf(cookieName);
	            var cookieValue = '';
	            if (start != -1) {
	                start += cookieName.length;
	                var end = cookieData.indexOf(';', start);
	                if (end == -1)
	                    end = cookieData.length;
	                console.log("end 위치  : " + end);
	                cookieValue = cookieData.substring(start, end);
	            }
	            return unescape(cookieValue);
	        }
	    });
	</script> 
	
	
	<script>
    //카카오 초기화
        Kakao.init('aef906bc476f983341072fc51f3c5b36');
        console.log( Kakao.isInitialized() ); // 초기화 판단여부
	
        function loginWithKakao() {
            Kakao.Auth.login({
                success: function (authObj) {
                    console.log(authObj); // access토큰 값
                    Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

                    getInfo();
                },
                fail: function (err) {
                    console.log(err);
                }
            });
        }
        
     // 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
       function getInfo() {
		    Kakao.API.request({
		        url: '/v2/user/me',
		        success: function (res) {
		            console.log(res);
		            var id = res.id;  // 사용자 아이디
		            var profile_nickname = res.kakao_account.profile.nickname;
		            var profile_image = res.kakao_account.profile.thumbnail_image_url;
		
		            insertKakaoUserInfo(id, profile_nickname, profile_image);
		
		            console.log(id, profile_nickname, profile_image);
		        },
		        fail: function (error) {
		            alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
		        }
		    });
		}
    
     
	  // 카카오 사용자 정보를 서버로 전송하여 데이터베이스에 저장
		function insertKakaoUserInfo(id, nickname, profile_image) {
		    console.log('전달된 id:', id);
		
		    $.ajax({
		        type: "POST",
		        url: "insertKakaoUserInfo",
		        data: {
		            userId: id,
		            userName: nickname,
		            originName: profile_image,
		            changeName: profile_image
		        },
		        success: function (response) {
		            console.log('카카오 회원 정보 저장 성공><');
		
		            // 세션에 사용자 정보 저장
		            var loginUser = {
		                userId: id,
		                userName: nickname,
		                originName: profile_image,
		                changeName: profile_image
		            };
		            sessionStorage.setItem("loginUser", JSON.stringify(loginUser));
		
		            // 로그인 성공 후 메인 페이지로 이동
		            window.location.href = "<%=contextPath%>/";
	

				},
				error : function(error) {
					console.error('카카오 회원 정보 저장 실패ㅜㅡㅜ', error);
				}
			});
		}
	</script>
	<!-- ##### All Javascript Files ##### -->
	<!-- Popper js -->
	<script src="<%=contextPath%>/resources/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="<%=contextPath%>/resources/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="<%=contextPath%>/resources/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="<%=contextPath%>/resources/js/active.js"></script>
</body>

</html>