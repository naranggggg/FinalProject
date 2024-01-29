<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap"
	rel="stylesheet">
<style>
a, p, button {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.plantImg, .plantName:hover {
	cursor: pointer;
}

.loader {
	border: 16px solid #f3f3f3;
	border-top: 16px solid #70c745;
	border-radius: 50%;
	width: 120px;
	height: 120px;
	animation: spin 2s linear infinite;
	margin: auto;
}

@keyframes spin { 0% {
	transform: rotate(0deg);
	}100%{
		transform:rotate(
			360deg
		);
	}
}
.hidden {
	display: none;
}

.weather-btn {
	width: 100px;
	height: 30px;
	margin: 0 10px;
	border: 1px solid #aaa;
	background-color: white;
	border-radius: 50px;
	border: 1px solid #aaa;
}

.weather-btn:focus {
	border: none;
	outline: none;
}

.weather-btn.active {
	width: 100px;
	height: 30px;
	border: 1px solid #70c745;
	background-color: white;
	border-radius: 50px;
	color: #70c745;
	outline: none;
}

.weather-btn-div {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-bottom: 50px;
}

.plantImg {
	width: 250px;
	height: 250px;
	border-radius: 10px;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- ##### Hero Area Start ##### -->
	<section class="hero-area">
		<div class="hero-post-slides owl-carousel">
			<!-- Single Hero Post -->
			<div class="single-hero-post bg-overlay">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(resources/img/bg-img/1.jpg);"></div>
				<div class="container h-100">
					<div class="row h-100 align-items-center">
						<div class="col-12">
							<!-- Post Content -->
							<div class="hero-slides-content text-center">
								<h2>식물을 키우고 싶은데 방법을 모르겠나요?</h2>
								<p>저희 '작은농장'은 집, 학교, 회사 등 나만의 공간에서 텃밭 가꾸기를 시작하려는 사람들에게 길잡이가
									되어드립니다.</p>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Single Hero Post -->
			<div class="single-hero-post bg-overlay">
				<!-- Post Image -->
				<div class="slide-img bg-img"
					style="background-image: url(resources/img/bg-img/2.jpg);"></div>
				<div class="container h-100">
					<div class="row h-100 align-items-center">
						<div class="col-12">
							<!-- Post Content -->
							<div class="hero-slides-content text-center">
								<h2>오늘의 식물 일지 작성하기</h2>
								<p>오늘의 식물 일지를 작성하고 등급을 높여보아요</p>
								<div class="welcome-btn-group">
									<button class="btn alazea-btn mr-30 go-diary">
										일지 작성하러 가기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Hero Area End ##### -->
	<!-- ##### Service Area Start ##### -->
	<section class="our-services-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Section Heading -->
					<div class="section-heading text-center">
						<h2>TIP</h2>
						<h3>실시간 초록예보입니다 🌿</h3>
					</div>
				</div>
			</div>
			<div class="row justify-content-between">
				<div class="col-12 col-lg-5  wow fadeInUp" data-wow-delay="100ms">

					<%@include file= "/WEB-INF/views/common/weather/weather_resize.jsp" %>

				</div>
				<div class="col-12 col-lg-7 mt-50">
					<div class="alazea-service-area mb-100" style="margin-bottom: 0px;">
						<!-- Single Service Area -->
						<div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
							<!-- Icon -->
							<div class="service-icon mr-30">
								<img src="resources/img/core-img/s1.png" alt="">
							</div>
							<!-- Content -->
							<div class="service-content" id="weather__temp">
								<h5></h5>
								<h6></h6>
							</div>
						</div>
						<!-- Single Service Area -->
						<div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="300ms">
							<!-- Icon -->
							<div class="service-icon mr-30">
								<img src="resources/img/core-img/s2.png" alt="">
							</div>
							<!-- Content -->
							<div class="service-content" id="weather__moi">
								<h5></h5>
								<h6></h6>
							</div>
						</div>
						<!-- Single Service Area -->
						<div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="500ms">
							<!-- Icon -->
							<div class="service-icon mr-30">
								<img src="resources/img/core-img/s3.png" alt="">
							</div>
							<!-- Content -->
							<div class="service-content" id="weather__reco">
								<h5>텃밭에 추천해요!</h5>
								<h6></h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Service Area End ##### -->
	
	<!-- ##### Service Area End ##### -->
	<input id="pageNo" type="hidden" value="1">

	<section class="new-arrivals-products-area section-padding-100">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Section Heading -->
					<div class="section-heading text-center">
						<h2>계절별 추천식물</h2>
						<p>We have the latest products, it must be exciting for you</p>
					</div>
				</div>
				<div class="weather-btn-div">
					<ul class="filter_lists">
						<button class="weather-btn active"
							onclick="selectWeatherRecomm('073001')" type="button">봄</button>
						<button class="weather-btn"
							onclick="selectWeatherRecomm('073002')" type="button">여름</button>
						<button class="weather-btn"
							onclick="selectWeatherRecomm('073003')" type="button">가을</button>
						<button class="weather-btn"
							onclick="selectWeatherRecomm('073004')" type="button">겨울</button>
					</ul>
				</div>
				<div class="second_filter_section active" id="second_filter">
					<div class="filter_division"></div>

				</div>
			</div>

			<!-- 로딩 화면 -->
			<div id="loadingScreen" align="center">
				<div class="loader"></div>
				<br>
				<h5>
					<b>로딩중입니다. 잠시만 기다려주세요</b>
				</h5>
			</div>
			<div class="row itemRow hidden"></div>

			<div class="col-12 text-center more-view-div hidden">
				<button class="btn alazea-btn more-view-btn">더보기</button>
			</div>
			<input type="hidden" id="currentIgnSeasonChkVal" value="073001" />
			<script>
				$(function() {
					//꽃피는 계절 코드 
					//봄 073001 여름 073002 가을 073003 겨울 073004
					getInGardenPlantListAjax('073001'); //처음에 불러올땐 봄으로 불러오기

					$(".more-view-btn").click(
							function() {
								var ignSeasonChkVal = $(
										"#currentIgnSeasonChkVal").val();
								getInGardenPlantListAjax(ignSeasonChkVal);

							});

					$(".itemRow").on("click", "img", function() {
						console.log($(this));
						$(this).parents("form").children(".submitBtn").click();
					});
					$(".itemRow").on("click", "p", function() {
						console.log($(this));
						$(this).parents("form").children(".submitBtn").click();
					});

				});
				
				
				//계절 버튼 클릭시 이벤트
				//getInGardenPlantListAjax와 따로 두는 이유는 버튼이 클릭되면 $("#pageNo")를 초기화하고 $(".itemRow")를 비워야 하기 때문
				function selectWeatherRecomm(ignSeasonChkVal) {
					$(".itemRow").empty();
					$("#loadingScreen").css("display", "block");
					$(".more-view-div").addClass("hidden");
					//현재 꽃피는 계절을 눌린 계절의 코드로 변경
					$("#currentIgnSeasonChkVal").val(ignSeasonChkVal);
					//더보기 누를때 쓰이는 pageNo를 다시 1로 초기화
					$("#pageNo").val(1);
					//꽃피는 계절 코드를 전달해서 식물 리스트 불러오기
					getInGardenPlantListAjax(ignSeasonChkVal);
				}
				function getInGardenPlantListAjax(ignSeasonChkVal) { //ignSeasonChkVal은 꽃피는 계절 코드 value
					console.log("식물 리스트 ajax 불러오기");

					$
							.ajax({
								url : "inGardenPlantListAjax.pp",
								data : {
									pageNo : $("#pageNo").val(),
									ignSeasonChkVal : ignSeasonChkVal
								},
								success : function(result) {
									$("#loadingScreen").css("display", "block");
									var inputValue = $("#pageNo").val(); // input 요소의 값을 가져옴

									//pageNo가 1이면 리스트를 비움.
									/* if (inputValue == 1) {
										//식물 리스트 비우기
										$(".itemRow").empty();
									} */
									var incrementedValue = parseInt(inputValue) + 1; // 가져온 값에 1을 더함 (숫자로 변환 후 덧셈)
									$("#pageNo").val(incrementedValue); // 변경된 값을 다시 input 요소에 설정함

									for (var i = 0; i < result.length; i++) {
										var outDiv = $("<div class='col-12 col-sm-6 col-lg-3'></div>");
										var inDiv = $("<div class='single-product-area mb-50 wow fadeInUp inDiv' data-wow-delay='100ms'></div>");
										var formDiv = $("<form action='detailInGarden.pp' method='post'></form>");

										var rtnFileUrlStr = $("<input type='hidden' name='rtnFileUrlStr' value=''>");
										rtnFileUrlStr
												.val(result[i].rtnFileUrlStr);

										var cntntsNo = $("<input type='hidden' name='cntntsNo' value=''>");
										cntntsNo.val(result[i].cntntsNo);

										var cntntsSj = $("<input type='hidden' name='cntntsSj' value=''>");
										cntntsSj.val(result[i].cntntsSj);

										var submitBtn = $("<input type='submit' class='submitBtn' hidden>");
										var imgDiv = $("<div class='product-img'></div>");
										var nameDiv = $("<div class='product-info mt-15 text-center'></div>");
										var img = $("<img class='plantImg'>");
										var name = $(
												"<p class='plantName'></p>")
												.text(result[i].cntntsSj);

										img
												.attr("src",
														result[i].rtnFileUrl[0]);

										nameDiv.append(name);
										imgDiv.append(img);
										formDiv.append(rtnFileUrlStr);
										formDiv.append(cntntsNo);
										formDiv.append(cntntsSj);
										formDiv.append(submitBtn);
										formDiv.append(imgDiv);
										formDiv.append(nameDiv);
										inDiv.append(formDiv);
										outDiv.append(inDiv);
										$(".itemRow").append(outDiv);
									}
									$("#loadingScreen").css("display", "none");
									$(".itemRow").removeClass("hidden");
									$(".more-view-div").removeClass("hidden");
									//result.length가 8보다 작다면 다음에 불러올 데이터가 없다는 뜻이기 때문에 더보기 버튼을 숨김
									if (result.length < 8) {
										console.log("zz");
										$(".more-view-div").addClass("hidden");
									}
								},
								error : function() {
									console.log("통신 오류");
								}
							});
				}
				//일지 작성 버튼 클릭 이벤트
				$(".go-diary").click(function() {
					var loginUser = "${loginUser.userId}";
					console.log(loginUser);
					if (loginUser == "") {
						alert("로그인 후 진행해주세요.");
						location.href = "loginGo.me";
					} else {
						location.href = "diary.me";
					}
				});
				//계절 버튼 클릭
				$(".weather-btn").click(function() {
					$(".weather-btn").removeClass("active");
					$(this).addClass("active");
				});
				
				
				
		   		function todayGreenCast(todayGreenTemp, todayGreenMoi){
		   			
		   			if(todayGreenTemp < 10){
						
		   				$("#weather__temp > h5").text("식물 냉해주의보!")
						$("#weather__temp > h6").html("<p>햇빛이 잘 드는 곳에서 충분한 햇볕을 받게 해주고 난방 시설을 이용하여 식물의 환경을 따뜻하게 유지하세요.</p><p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있으니 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p>") //"<p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있습니다. 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p><p>");
		   			
		   			}else if(todayGreenTemp < 18){
		   				
		   				$("#weather__temp > h5").text("대부분의 실내 식물이 잘 성장하고 번식할 수 있는 이상적인 조건!")
						$("#weather__temp > h6").html("<p>햇빛이 잘 드는 곳으로 이동하여 햇빛을 받게 해주세요.</p><p>일교차 온도를 유의하여 온도를 일관되게 해주세요.</p>") //")<p>낮은 온도에서 실내 습도가 낮아질 수 있습니다. 적절한 수분 공급을 해주세요.</p><p>");
		   				
		   			}else if(todayGreenTemp < 26){

		   				$("#weather__temp > h5").text("식물이 좋아하는 온도!")
						$("#weather__temp > h6").html("<p>환기를 잘 해주고 비료를 공급해 주세요.</p><p>난방을 이용하여 환경을 따뜻하게 유지하세요.</p>") //"<p>적절한 물을 공급하고 습도를 유지하세요.</p><p>");
		 	   			
		   			}else{

		   				$("#weather__temp > h5").text("식물이 자라기에 온도가 높네요!")
						$("#weather__temp > h6").html("<p>온실의 온도를 낮춰주세요. 환기가 도움이 됩니다.</p><p>햇빛이 뜨거우면 실내로 옮겨 주거나 가림막을 사용해 주세요.</p>") //"<p>토양이 마르기 전에 물을 주세요.</p><p>");
		   				
		   			}
		   			
		   			if(todayGreenMoi < 40){
		   				$("#weather__moi > h5").text("건조주의보!")
						$("#weather__moi > h6").html("<p>건조한 공기에 노출되면 토양이 빠르게 마릅니다. 수분을 공급해주세요.</p><p>작은 식물들이 모여있으면 수분 손실을 늦출 수 있어요!</p>") //"<p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있습니다. 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p><p>");
		   				
		   			}else if(todayGreenMoi >= 15 && todayGreenMoi <= 60){
		   				$("#weather__moi > h5").text("식물이 크기에 촉촉한 습도!")
						$("#weather__moi > h6").html("<p>대부분의 실내 식물들이 좋아하는 습도예요!</p><p>옆에서 잘 관찰하며 촉촉하게 케어 해주세요!</p>") //"<p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있습니다. 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p><p>");   				
		   				
		   			}else if(todayGreenMoi < 75){
		   				$("#weather__moi > h5").text("과습주의보!")
						$("#weather__moi > h6").html("<p>높은 습도는 곰팡이 및 기타 질병의 발생 가능성을 증가시켜요!</p><p>배수와 통풍에 신경 써주고 토양에 곰팡이가 피는지 관찰하세요.</p>") //"<p></p><p>");
		   			}else{
		   				$("#weather__moi > h5").text("과습경보!")
						$("#weather__moi > h6").html("<p>높은 습도는 곰팡이 및 기타 질병의 발생 가능성을 증가시켜요!</p><p>배수와 통풍에 신경 써주고 토양에 곰팡이가 피는지 관찰하세요.</p>") //"<p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있습니다. 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p><p>");
		   				
		   			}
		   			
		   			var mon = new Date().getMonth() + 1;
		   			
		   			if(mon >= 3 && mon <= 5){
		   				$("#weather__reco > h5").text("봄 텃밭에는 이런 작물을 추천해요!")
						$("#weather__reco > h6").html("<p>상추 / 방울토마토 / 아스파라거스 / 브로콜리 /감자</p>")
		   			}if(mon >= 6 && mon <= 8){
		   				$("#weather__reco > h5").text("여름 텃밭에는 이런 작물을 추천해요!")
						$("#weather__reco > h6").html("<p>토마토 / 오이 / 고추 / 수박 / 케일 / 바질 / 파프리카</p>")
		   				
		   			}if(mon >= 9 && mon <= 10){
		   				$("#weather__reco > h5").text("가을 텃밭에는 이런 작물을 추천해요!")
						$("#weather__reco > h6").html("<p>배추 / 무 / 갓 / 대파 / 마늘 / 상추 / 케일 / 루꼴라</p>")
		   				
		   			}else{
		   				$("#weather__reco > h5").text("겨울 텃밭에는 이런 작물을 추천해요!")
						$("#weather__reco > h6").html("<p>시금치 / 봄동 / 상추 / 갓 / 쑥갓 / 돌산갓 / 케일 / 청경채</p>")
		   				
		   			}
		   			
		   		}
				
			</script>
		</div>
	</section>

	<!-- ##### Product Area End ##### -->
	<%@include file="common/footer.jsp"%>
	<%-- <jsp:include page="common/footer.jsp"/> --%>

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