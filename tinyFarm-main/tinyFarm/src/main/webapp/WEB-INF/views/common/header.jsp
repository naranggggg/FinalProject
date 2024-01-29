<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>작은농장</title>

<!-- Favicon -->
<link rel="icon" href="${contextPath }/resources/img/core-img/favicon.ico">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap"
	rel="stylesheet">

<!-- summernote -->
<script src="resources/jisu/summernote/summernote-lite.js"></script>
<script src="resources/jisu/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="resources/jisu/summernote/summernote-lite.css">

<!-- Date -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
a, p {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.h1, .h3, .h4, .h5, .h6, h1, h4, h5, h6 {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.plantImg, .plantName:hover {
	cursor: pointer;
}

.chat-icon {
	width: 12px;
	height: 12px;
}

.container {
	max-width: 1300px;
}

.classy-menu {
	width: 1000px;
}

.new-message-div {
	position: relative;
	width: auto;
	background-color: #70c745;
	color:white;
	border-radius:20px;
	font-size: 12px;
	height: 25px;
	padding: 5px 10px;
	margin-right: 15px;
	text-align: center;
} 

.new-message-div:hover {
	cursor: pointer;
}



.new-message-div:after {
	content: "";
    position: absolute;
    top: 8px;
    right: -10px;
    border-left: 15px solid #70c745;
    border-top: 5px solid transparent;
    border-bottom: 5px solid transparent;
}

.hidden {
	display: none;
}

.visible {
	display: block;
}

</style>
</head>

<body>
	<!-- contextPath 설정 -->
	<c:set var="contextPath" value="<%=request.getContextPath()%>"
		scope="session" />

	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">

		<!-- ***** Top Header Area ***** -->
		<div class="top-header-area">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div
							class="top-header-content d-flex align-items-center justify-content-between">
							<!-- Top Header Content -->
							<div class="top-header-meta"></div>


							<!-- Top Header Content -->
							<div class="top-header-meta d-flex">
								<div class="new-message-div px-2 hidden"></div>
								<!-- Login -->
								<div class="login">
									<c:choose>
										<c:when test="${empty loginUser}">
											<a href="loginGo.me"> <i class="fa fa-user"
												aria-hidden="true"></i> <span>Login</span>
											</a>
											<a href="join.me">회원가입</a>
										</c:when>
										<c:otherwise>
											<a href="chatList.ch" class="px-2" style="margin: 0;"><img
												class="chat-icon" alt="채팅방 가기"
												src="${contextPath}/resources/img/icon/chat-btn-icon.png">채팅</a>
											<a class="px-2"><i class="fa fa-user" aria-hidden="true"></i>
												<span>${loginUser.userName } 님</span></a>
											<c:if test="${loginUser.userId == 'admin'}">
												<!-- 관리자 로그인시 -->

												<a href="main.ad" class="px-2">관리페이지</a>
											</c:if>
											<c:if test="${loginUser.userId != 'admin'}">

												<a href="mypage.me" class="px-2">마이페이지</a>
											</c:if>
											<a href="logout.me" class="px-2"><i
												class="fa fa-sign-out" aria-hidden="true"></i>로그아웃</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ***** Navbar Area ***** -->
		<div class="alazea-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="alazeaNav">

						<!-- Nav Brand -->
						<a href="/tinyfarm" class="nav-brand"><img
							src="resources/img/core-img/logo.png" alt=""></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Navbar Start -->
							<div class="classynav">
								<ul>
									<li><a href="">식물 정보</a>
										<ul class="dropdown">
											<li><a href="inGardenPlantList.pp">실내식물 정보</a></li>
											<li><a href="gardeningList.pp?category=채소">채소 정보</a></li>
											<li><a href="gardeningList.pp?category=실내농업">실내농업 관련
													정보</a></li>
											<li><a href="gardeningList.pp?category=기능별 텃밭">기능별
													텃밭 정보</a></li>
											<li><a href="makeInGarden.pp">실내정원 만들기</a></li>
											<li><a href="season.re">계절별 텃밭 가꾸는법</a></li>
										</ul></li>
									<li><a href="moveMbtiTest.mt">풀BTI 테스트</a></li>

									<li><a>커뮤니티</a>
										<ul class="dropdown">
											<li><a href="moveList.bo">이야기해요</a></li>
											<li><a href="noticeList.no">공지사항</a></li>
										</ul>
									</li>
									<li><a href="plist.bo">작물거래</a></li>
									<li><a href="">추천</a>
										<ul class="dropdown">
											<li><a href="bookMain.re">권장 도서</a></li>
											<li><a href="experienceList.ex">체험활동</a></li>
										</ul>
									</li>
									<li><a href="qnaList.qa">1:1 문의</a></li>
								</ul>
							</div>
							<!-- Navbar End -->
						</div>
					</nav>


				</div>
			</div>
		</div>
	</header>

	<!-- nav 바 뒤 그림부분 시작-->

	<!-- nav 바 뒤 그림부분 끝 -->

	<script type="text/javascript">
		$(function() {
			var loginUser = "${loginUser.userId}";
			if(loginUser != ""){
				//헤더에서 웹소켓 접속
				headerConnect();
			}
			
		});
		const alertMsg = "${alertMsg}";

		console.log(alertMsg);

		if (alertMsg != null && alertMsg != "") {
			alert(alertMsg);
			<c:remove var="alertMsg" scope="session" />
		}

		var socket; //소켓담아놓을 변수 (접속과 종료 함수가 다르기 떄문에 전역변수에 담아두고 사용한다.)		

		//연결함수 (접속)
		function headerConnect() {
			//접속경로를 담아 socket을 생성한다.
			//var url = "ws://192.168.50.40:8888/tinyfarm/basic"; 
			var url = "ws://localhost:8888/tinyfarm/basic";
			socket = new WebSocket(url);

			//연결이 되었을때
			socket.onopen = function() {
				console.log("연결 성공");
			};
			//연결이 종료됐을때
			socket.onclose = function() {
				console.log("연결 종료");
			};
			//에러가 발생했을때
			socket.onerror = function(e) {
				console.log("에러가 발생했습니다.");
				console.log(e);
			}
			//메세지가 왔을때
			socket.onmessage = function(message) {
				console.log("메세지가 도착했습니다.");
				//보낼때 json 형식으로 보냈기 떄문에 json.parse로 다시 받음.
				var messageData = JSON.parse(message.data);
				var userId = "${loginUser.userId}";
				if (messageData.userId != userId) {

					console.log(messageData);
					$(".new-message-div").text("메세지가 도착했습니다");
					$(".new-message-div").removeClass("hidden");
					$(".new-message-div").addClass("visible");

				}
			}
		}

		//접속종료
		function headerDisconnect() {
			socket.close();//소켓닫기
		}
		//메세지 도착 알림 div 클릭 이벤트
		$(".new-message-div").click(function() {
			location.href = "${contextPath}/chatList.ch";
		});
	</script>

	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<!-- <script src="resources/js/jquery/jquery-2.2.4.min.js"></script> -->
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