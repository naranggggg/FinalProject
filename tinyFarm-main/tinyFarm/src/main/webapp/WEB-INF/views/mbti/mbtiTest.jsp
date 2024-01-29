<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<style>
#a, #b, #c, #A, #B {
	border-radius: 30px;
	height: 50px;
	background-color: #f6f6f3;
	border: none;
	outline: none;
	cursor: pointer;
}

#a:hover, #b:hover, #c:hover, #A:hover, #B:hover {
	border-radius: 30px;
	height: 50px;
	background-color: #ff6c30;
	color: white;
	border: none;
	outline: none;
	font-weight: bold;
	transition-duration: 400ms;
}

.start, .question {
	display: flex;
	flex-direction: column;
	text-align: center;
}

.question {
	display: none;
}

.result {
	display: none;
}

#resultBtn {
	display: none;
	/*display: flex;*/
	flex-direction: column;
}

#resultBtn1 {
	display: flex;
	flex-direction: column;
}

#qImg {
	width: 400px;
	height: 300px;
}

#img {
	width: 300px;
	height: 300px;
}
/*추천상품 옆으로 띄우기*/
#recommendPlant {
	display: flex;
}

.enviDiv1, .enviDiv2 {
	display: flex;
}

.mbtiResultBtn {
	width: 500px;
}

#recommendPlant {
	overflow: auto;
}

#lvTag1, #lvTag2 {
	background-color: #70c745;
	color: white;
	border-radius: 30px
}

#mbtiTag1, #mbtiTag2, #mbtiTag3 {
	background-color: #FF6C30;
	color: white;
	border-radius: 30px
}

/*프로그레스바*/
#progress {
	appearance: none;
	width: 100%;
	/*transition: width 1s ease-in-out 0s;*/
	animation: progress 5s ease forwards;
}

#progress::-webkit-progress-bar {
	background: #f0f0f0;
	border-radius: 10px;
	box-shadow: inset 3px 3px 10px #ccc;
}

#progress::-webkit-progress-value {
	border-radius: 10px;
	background: #1D976C;
	background: -webkit-linear-gradient(to right, #93F9B9, #1D976C);
	background: linear-gradient(to right, #93F9B9, #1D976C);
}

/*식물명 너무길어서 ...으로 잘라주기*/
#plantName {
	width: 90px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

/*로딩창 css*/
#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	background: white;
	z-index: 99;
	text-align: center;
}

#load>img {
	margin: 150px;
}

.loadText {
	font-size: 25px;
}

.recommendLoding{
  width: 90vw;
  margin: 0 auto;
  text-align: center;
  display: flex;
}

.droplet_spinner {
  display: flex;
  justify-content: center;
  margin: 30px;
}

.droplet_spinner .droplet {
  width: 15px;
  height: 15px;
  margin: 0 5px;
  
  background-color: #70c745;
  border-radius: 50%;
  transform-origin: center bottom;
  
  animation: bounce 1.2s cubic-bezier(0.3, 0.01, 0.4, 1) infinite;
}

.droplet_spinner .droplet:nth-child(1) {
  animation-delay: -0.4s;
}

.droplet_spinner .droplet:nth-child(2) {
  animation-delay: -0.2s;
}

.droplet_spinner .droplet:nth-child(3) {
  animation-delay: 0s;
}

@keyframes bounce {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-20px);
  }
}
</style>


</head>

<body>
	<%@include file="../common/header.jsp"%>

	<!-- 상단 시작 -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>풀BTI 테스트</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/tinyfarm"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">풀BTI</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 끝 -->
	
	<!-- mbti시작페이지 -->
	<article class="start">
		<section class="blog-content-area section-padding-0-100">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 col-md-8">
						<div class="blog-posts-area">
							<div class="single-post-details-area" align="center">
								<div class="post-content">
									<!-- 타이틀 -->
									<h4 class="post-title">나에게 어울리는 식물은 무엇일까요?</h4>
									<!-- mbti테스트 타이틀사진 -->
									<div class="post-thumbnail mb-30">
										<img src="resources/img/icon/진단테스트이미지.webp" id="img">
									</div>

									<blockquote style="background-color: white;">
										<div class="blockquote-text">
											<h5>“당신의 Mbti성향과 공간에서 키우기 좋은 식물을 찾아드려요.”</h5>
											<h5>Please answer honestly.</h5>
										</div>
									</blockquote>
									<button type="button" class="btn alazea-btn-orange ml-15" onclick="start();">테스트 시작하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</article>
		<!-- mbti시작페이지 끝 -->


	<!-- mbti 질문페이지 시작 -->
	<article class="question">
		<section class="blog-content-area section-padding-0-100">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 col-md-8">
						<div class="blog-posts-area">
							<div class="single-post-details-area">
								<div class="post-content">
									<article class="question">
										<!--몇번째 문항인지 숫자로 표현-->
										<div>
											<h1 class="q-num">Q1</h1>
											<p class="progress-txt">1/12</p>
										</div>

										<!-- 프레스바 -->
										<div class="progress mt-5">
											<div class="progress-bar"></div>
										</div>

										<h2 id="title" class="text-center mt-5">1번 문제</h2>
										<br><br>
										<img id="qImg">
										<br><br><br> 
										<input id="type" type="hidden" value="EI">
										<!-- 어떤 타입을 물어보는 문제인지 알기위해 사용 -->

										<!-- 질문 답버튼 -->
										<div id="resultBtn1">
											<button id="a" type="button" class="aBtn">a대답</button>
											<br>
											<button id="b" type="button" class="bBtn">b대답</button>
											<br>
											<button id="c" type="button" class="cBtn">c대답</button>
										</div>


										<div id="resultBtn">
											<button id="A" type="button" class="mbtiResultBtn ABtn">ESTJ대답</button>
											<br> <br>
											<!-- 위의 것은 E, S, T, J 값 -->
											<button id="B" type="button" class="mbtiResultBtn BBtn">INFP대답</button>
											<!-- 아래는 I, N, F, P 값 -->
										</div>
									</article>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</article>
		<!-- mbti질문페이지 끝 -->
	
	
	<article class="loading">
		<!-- 로딩창 -->

		<div id="load">
			<img src="resources/img/icon/로딩창.gif">
			<p class="loadText">잠시만 기다려주세요...</p>
		</div>

	</article>


	<article class="result" id="result">
		<!-- ##### Blog Content Area Start ##### -->
		<section class="blog-content-area section-padding-0-100">
			<div class="container">
				<div class="row justify-content-center">
					<!-- Blog Posts Area -->
					<div class="col-12 col-md-8">
						<div class="blog-posts-area">

							<!-- Post Details Area -->
							<div class="single-post-details-area">
								<div class="post-content">
									<h4 class="post-title">
										당신의 <br> <strong>레벨을 보니</strong>
									</h4>

									<div class="post-thumbnail mb-30">
										<img src="resources/img/icon/돋보기.png" width="30px"
											height="30px">
									</div>
									<div style="display: flex;">
										&nbsp;&nbsp;●
										<p id="lvTitle"></p>
									</div>
									<p id="lvExplain"></p>

									<!-- 해시태그 -->
									<div class="single-widget-area">
										<!-- Tags -->
										<ol class="popular-tags d-flex flex-wrap">
											<li><a href="#" id="lvTag1"></a></li>
											<li><a href="#" id="lvTag2"></a></li>
										</ol>
									</div>

									<h4 class="post-title">
										키우는 <br> <strong>공간을 분석해보니</strong>
									</h4>
									<p id="envyTypeText">무난한 환경</p>
									<progress id="progress" value="50" min="0" max="100"></progress>
									<br> <br>






									<div class="environment">
										<div class="enviDiv1">
											<div style="width: 50%;">
												<p id="tempTitle"></p>
												<p id="tempExplain"></p>
											</div>
											<div style="width: 50%;">
												<p id="sunTitle"></p>
												<p id="sunExplain"></p>
											</div>
										</div>
										<div class="enviDiv2">
											<div style="width: 50%;">
												<p id="humTitle"></p>
												<p id="humExplain"></p>
											</div>
											<div style="width: 50%;">
												<p id="airTitle"></p>
												<p id="airExplain"></p>
											</div>
										</div>
									</div>

									<h4 class="post-title">
										당신의 공간에<br> <strong>추천하는 식물은</strong>
									</h4>
									<div class="recommendLoding">
									 	 <div class="droplet_spinner">
									  	 <div class="droplet"></div>
									     <div class="droplet"></div>
									     <div class="droplet"></div>
									  </div>
									</div>
									<!-- ##### Single Widget Area ##### -->
									<div class="single-widget-area" id="recommendPlant"></div>
								</div>
							</div>
						</div>
					</div>

					<!-- Blog Sidebar Area -->
					<div class="col-12 col-sm-9 col-md-4">
						<div class="post-sidebar-area">
							<img id="mbtiImg">
							<!-- mbti 결과 공간 -->
							<div class="single-widget-area">
								<!-- mbti 제목 -->
								<div class="widget-title">
									<h4 id="item"></h4>
								</div>
								<!-- 해시태그2 -->
								<div class="single-widget-area">
									<!-- Tags -->
									<ol class="popular-tags d-flex flex-wrap">
										<li><a href="#" id="mbtiTag1"></a></li>
										<li><a href="#" id="mbtiTag2"></a></li>
										<li><a href="#" id="mbtiTag3"></a></li>
									</ol>
								</div>
								<p id="mbtiExplain"></p>
							</div>
							<hr style='background-color: #E0E0E0; opacity: 0.7'>

							<a href="moveMbtiTest.mt" class="btn alazea-btn-orange ml-15" style="border-radius: 30px;">다시하기</a>


						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- ##### Blog Content Area End ##### -->
	</article>


	<input type="hidden" value="" id="growth">
	<input type="hidden" value="" id="management">
	<input id="pageNo" type="hidden" value="1">
	<!-- 대답을 저장하기 위해 input태그를 사용 
		 값을 저장하기 위해 input을 네 가지를 만들고 id에는 각각 "EI", "SN", "TF", "JP"를 부여했다.-->
	<input type="hidden" id="EI" value="0">
	<input type="hidden" id="SN" value="0">
	<input type="hidden" id="TF" value="0">
	<input type="hidden" id="JP" value="0">

	<!-- 키우는 환경관련 대답을 저장하기 위해 input 저장소 만들기 -->
	<input type="hidden" id="ntmtht" value="0">
	<input type="hidden" id="nsmshs" value="0">
	<input type="hidden" id="nhmhhh" value="0">
	<input type="hidden" id="namaha" value="0">

	<!-- 추천식물관련 대답을 저장하기위해 input 저장소만들기 -->
	<input type="hidden" id="ngmghg" value="0">
	<input type="hidden" id="nimihi" value="0">

	<!-- 레벨테스트관련 대답 저장소 -->
	<input type="hidden" id="lv1lv2lv3" value="0">

	<jsp:include page="../common/footer.jsp"></jsp:include>


	<script>
		var num = 1; //현재 몇번 문제인지

		//질문지  [title/type/A/B는 id값을 말함]
		var q = {
			// title / type : 문제와 문제의 타입을 규정하기 위한 input
			// A버튼 / B 버튼임 (버튼 두개의 id값)
			// 1: {"title": "1번 문제", "type": "EI", "A": "대답 E", "B": "대답 I"},
			1 : {
				title : "식물을 키워본 경험이 있나요?",
				type : "lv1lv2lv3",
				a : "아니요 처음이에요, 그래서 걱정돼요ㅠㅠ",
				b : "몇 번 키운적이 있어요.",
				c : "네 지금도 많은 식물을 키우고 있어요.",
				qImg : "resources/img/mbti/qImg/식물경험.png"
			},

			2 : {
				title : "식물을 키울 곳은 어디인가요?",
				type : "ntmtht",
				a : "실외공간(마당,테라스)",
				b : "베란다",
				c : "실내공간",
				qImg : "resources/img/mbti/qImg/식물키울곳.png"
			},
			3 : {
				title : "그곳은 햇빛이 잘 들어오나요?",
				type : "nsmshs",
				a : "아니요 햇빛이 거의 들지않아 걱정이에요ㅠㅠ",
				b : "하루 2~3시간 정도는 빛이 들어와요",
				c : "네, 아침부터 해가질때까지 잘들어오는 편이에요",
				qImg : "resources/img/mbti/qImg/식물햇빛.png"
			},
			4 : {
				title : "그곳의 습도는 어떤 편인가요?",
				type : "nhmhhh",
				a : "눈이 뻑뻑하고 피부당김이 느껴지는 건조한 곳",
				b : "제습기가 필요할 정도로 습한 곳",
				c : "생활하는데 큰 어려움이 없는 쾌적한 곳",
				qImg : "resources/img/mbti/qImg/식물습도.png"
			},
			5 : {
				title : "식물도 맑은 공기를 좋아해요. 그곳은 환기가 잘 되는 곳인가요?",
				type : "namaha",
				a : "창문이 없어 환기를 해줄수 없는 곳이에요.",
				b : "적어도 일주일에 한번은 환기를 하는 편이에요",
				c : "하루에 한번씩은 꼭 환기를 하는편이에요",
				qImg : "resources/img/mbti/qImg/식물환기.png"
			},
			6 : {
				title : "빨리 싹이 트길 바라나요?",
				type : "ngmghg",
				a : "천천히 나도 괜찮아요.",
				b : "3개월안에 자랐으면 좋겠어요.",
				c : "네 얼른 보고싶어요",
				qImg : "resources/img/mbti/qImg/식물싹트기.png"
			},
			7 : {
				title : "얼마나 식물에게 관심을 줄건가요?",
				type : "nimihi",
				a : "워낙 바쁜 편이지만,짬을 내서라도 관심을 줄게요",
				b : "퇴근 후 그리고 주말엔 관심을 줄 수 있어요",
				c : "매일매일 안부를 물으며 관심을 줄거예요",
				qImg : "resources/img/mbti/qImg/식물관심.png"
			},
			8 : {
				title : "식물이 놓인 공간이 너무 만족스러운 당신!",
				type : "EI",
				A : "인스타에 업로드! 동네방네 자랑할래",
				B : "조용히 혼자만 만족한다.",
				qImg : "resources/img/mbti/qImg/식물자랑.png"
			},
			9 : {
				title : "키우던 식물에 꽃이 폈어요이때 당신은?",
				type : "TF",
				A : "오, 꽃이 폈네! 내가 잘 키웠나보군ㅎㅎ",
				B : "우와!!꽃이 폈어ㅠㅠ대단하고 대견해!",
				qImg : "resources/img/mbti/qImg/식물꽃핌.png"
			},
			10 : {
				title : "구입한 식물을 집으로 데려온 후 가장 먼저 하는 생각은 무엇인가요?",
				type : "SN",
				A : "적당한 곳에 두고 만족해하며 자리를 떠난다",
				B : "어디다 두지?잘 자랐으면 좋겠다! 어떻게 연출해볼까?",
				qImg : "resources/img/mbti/qImg/식물사면하는생각.png"
			},
			11 : {
				title : "그렇군요! 혹시 당신의 눈에 쏙 들어오는 식물을 발견하다면 어떻게 할 건가요?",
				type : "JP",
				A : "인터넷에서 가격부터 비교해보자",
				B : "이건 못참지 바로 데려가자!",
				qImg : "resources/img/mbti/qImg/식물맘에듦.png"
			}
		};

		//결과
		var result = {
			//mbti결과
			ISTJ : {
				item : "창의적인 녹색 열정가 (ISTJ)",
				mbtiExplain : "당신은 자랑스러운 식물 고수, ISTJ 유형입니다. 세심한 관리와 높은 책임감으로 식물을 키우며, 식물 공간에서의 성과에 자부심을 느낍니다.",
				mbtiTag1 : "#식물고수",
				mbtiTag2 : "#세심한관리",
				mbtiTag3 : "#자부심",
				mbtiImg : "resources/img/mbti/istj.png",
			},
			ISFJ : {
				item : "도전적인 식물 열정가 (ISFJ)",
				mbtiExplain : "당신은 도전적인 식물 열정가, ISFJ 유형입니다. 도전에 높은 목표를 세우며, 식물을 세심하게 돌보는 것에 헌신합니다.",
				mbtiTag1 : "#도전적인식물열정가",
				mbtiTag2 : "#높은목표 ",
				mbtiTag3 : "#세심한돌봄",
				mbtiImg : "resources/img/mbti/isfj.png",
			},
			INFJ : {
				item : "신중한 식물 관리자 (INFJ)",
				mbtiExplain : "당신은 신중한 식물 관리자, INFJ 유형입니다. 식물들과의 깊은 연결과 신중한 관리로 안정적이고 아름다운 식물 환경을 조성합니다.",
				mbtiTag1 : "#신중한식물관리자",
				mbtiTag2 : "#깊은연결",
				mbtiTag3 : "#아름다운환경",
				mbtiImg : "resources/img/mbti/infj.png",
			},
			INTJ : {
				item : "논리적인 식물 연구가 (INTJ)",
				mbtiExplain : "당신은 논리적인 식물 연구가, INTJ 유형입니다. 분석적이고 전략적으로 다양한 식물 연구에 참여하며, 뛰어난 논리적 사고를 발휘합니다.",
				mbtiTag1 : "#식물연구가",
				mbtiTag2 : "#논리적인식물연구가",
				mbtiTag3 : "#분석적",
				mbtiImg : "resources/img/mbti/intj.png",
			},
			ISTP : {
				item : "탐험가적 식물 도전자 (ISTP)",
				mbtiExplain : "당신은 탐험가적인 식물 도전자, ISTP 유형입니다. 다양한 도전을 즐기며, 식물의 다양성을 탐험하고 새로운 경험을 쌓는 것에 흥미를 느낍니다.",
				mbtiTag1 : "#탐험가적식물도전자 ",
				mbtiTag2 : "#다양한도전",
				mbtiTag3 : "#새로운경험",
				mbtiImg : "resources/img/mbti/istp.png",
			},
			ISFP : {
				item : "예술적 감각의 식물 애호가 (ISFP)",
				mbtiExplain : "당신은 예술적 감각의 식물 애호가, ISFP 유형입니다. 감성적이고 예술적인 접근으로 식물을 다루며, 식물들과의 조화로운 관계에 중점을 두고 있습니다.",
				mbtiTag1 : "#예술적감각",
				mbtiTag2 : "#식물과소통",
				mbtiTag3 : "#식물애호가",
				mbtiImg : "resources/img/mbti/isfp.png",
			},
			INFP : {
				item : "식물 친구들과 소통하는 예술가 (INFP)",
				mbtiExplain : "당신은 식물과 소통하는 예술가, INFP 유형입니다. 감성적인 마음으로 식물들과 이야기를 나누며, 자연의 아름다움을 감상하는 것을 즐깁니다.",
				mbtiTag1 : " #식물과소통",
				mbtiTag2 : "#예술가",
				mbtiTag3 : "#자연의아름다움",
				mbtiImg : "resources/img/mbti/infp.png",
			},
			INTP : {
				item : "논리적인 식물 연구자 (INTP)",
				mbtiExplain : "당신은 논리적인 식물 연구자, INTP 유형입니다. 분석적이고 논리적으로 식물에 접근하며, 새로운 지식을 탐구하고 실험하는 것에 흥미를 느낍니다.",
				mbtiTag1 : "#논리적인식물연구자",
				mbtiTag2 : "#분석적",
				mbtiTag3 : "#새로운지식",
				mbtiImg : "resources/img/mbti/intp.png",
			},
			ESTP : {
				item : "실용적인 식물 키우는 전문가 (ESTP)",
				mbtiExplain : "당신은 실용적인 식물 키우는 전문가, ESTP 유형입니다. 효율적이고 실용적으로 식물을 관리하며, 필요한 조치들을 빠르게 취하는 능력을 보여줍니다.",
				mbtiTag1 : " #실용적인식물전문가",
				mbtiTag2 : "#효율적",
				mbtiTag3 : "#빠른조치",
				mbtiImg : "resources/img/mbti/estp.png",
			},
			ESFP : {
				item : "따뜻한 식물 친구 (ESFP)",
				mbtiExplain : "당신은 따뜻한 식물 친구, ESFP 유형입니다. 식물을 키우는 과정에서 즐거움과 따뜻한 에너지를 전하는 것을 중시하며, 주변에 긍정적인 분위기를 만들어냅니다.",
				mbtiTag1 : "#따뜻한식물친구",
				mbtiTag2 : "#즐거움",
				mbtiTag3 : "#긍정적분위기",
				mbtiImg : "resources/img/mbti/esfp.png",
			},
			ENFP : {
				item : "창의적인 녹색 열정가 (ENFP)",
				mbtiExplain : "당신은 창의적인 녹색 열정가, ENFP 유형입니다. 새로운 시도에 대한 호기심과 열정으로 식물을 키우며, 식물들과의 소통을 통해 창의적인 아이디어를 도출하는 것을 즐깁니다.",
				mbtiTag1 : "#창의적인녹색열정가",
				mbtiTag2 : "#식물과소통",
				mbtiTag3 : "#창의성",
				mbtiImg : "resources/img/mbti/enfp.png",
			},
			ENTP : {
				item : "식물의 세계로 여행하는 모험가 (ENTP)",
				mbtiExplain : "당신은 식물의 세계로 여행하는 모험가, ENTP 유형입니다. 다양한 종류의 식물을 도전적으로 키우며, 새로운 경험에 열려있고 도전을 즐깁니다.",
				mbtiTag1 : "#식물모험가",
				mbtiTag2 : "#도전적",
				mbtiTag3 : "#다양한도전",
				mbtiImg : "resources/img/mbti/entp.png",
			},
			ESTJ : {
				item : "조직적인 식물 마스터 (ESTJ)",
				mbtiExplain : "당신은 조직적인 식물 마스터, ESTJ 유형입니다. 체계적이고 계획적으로 식물을 관리하며, 정리된 환경에서 최상의 성과를 이루려고 노력합니다.",
				mbtiTag1 : "#조직적인식물마스터",
				mbtiTag2 : "#계획적",
				mbtiTag3 : "#체계적",
				mbtiImg : "resources/img/mbti/estj.png",
			},
			ESFJ : {
				item : "사회적인 식물 염치가 (ESFJ)",
				mbtiExplain : "당신은 사회적인 식물 염치가, ESFJ 유형입니다. 주변 환경과 조화롭게 식물을 가꾸며, 그들의 성장에 사회적인 가치를 부여합니다.",
				mbtiTag1 : "#사회적인식물염치가",
				mbtiTag2 : "#환경과조화",
				mbtiTag3 : "#사회적가치",
				mbtiImg : "resources/img/mbti/esfj.png",
			},
			ENFJ : {
				item : "열정적인 식물 예술가 (ENFJ)",
				mbtiExplain : "당신은 열정적인 식물 예술가, ENFJ 유형입니다. 열정과 따뜻한 마음으로 식물을 키우며, 그들의 성장과 발전에 적극적으로 참여합니다.",
				mbtiTag1 : "#열정적인식물예술가",
				mbtiTag2 : "#따뜻한마음",
				mbtiTag3 : "#성장과발전",
				mbtiImg : "resources/img/mbti/enfj.png",
			},
			ENTJ : {
				item : "통찰력 있는 식물 관찰자 (ENTJ)",
				mbtiExplain : "당신은 통찰력 있는 식물 관찰자, ENTJ 유형입니다. 미래에 대한 비전과 통찰력을 바탕으로 식물을 키우며, 전략적인 계획을 세우는 능력이 뛰어납니다.",
				mbtiTag1 : "#통찰력있는식물관찰자",
				mbtiTag2 : " #미래비전",
				mbtiTag3 : "전략적계획",
				mbtiImg : "resources/img/mbti/entj.png",
			},

			//키우는 환경결과
			nt : {
				tempTitle : "온도: 날씨 영향 받음",
				tempExplain : "외부의 기온에 따라 극한의 기온을 견뎌내야하고, 기상상황에 따라 돌발상황이 많은 특징이 있어요.",
			},
			mt : {
				tempTitle : "온도: 일교차 중간",
				tempExplain : "일교차가 큰 특징이 있는 베란다 공간이군요! 여름에는 실내에 비해 덥고, 겨울에는 실내에 비해 추워서 온도 관리가 필요해요.",
			},
			ht : {
				tempTitle : "온도: 일정함",
				tempExplain : "일년내내 적정온도가 유지되는 실내공간으로,다양한 식물을 키우기에 아주 좋은 온도 조건을 가지고 있어요!",
			},
			ns : {
				sunTitle : "빛: 부족함",
				sunExplain : "빛이 잘 들지 않아도 잘 자랄 수 있는 음지성 식물에게 적합한 공간이에요.",
			},
			ms : {
				sunTitle : "빛: 적당함",
				sunExplain : "하루 2~3시간 정도 밝은 빛이 들어 빛이 적은 곳에서도 잘 자라는 반양지,반음지 식물에게 적합한 공간이에요.",
			},
			hs : {
				sunTitle : "빛: 풍부함",
				sunExplain : "하루 6시간 이상 밝은 빛이 들어 다양한 식물을 키울 수 있는 훌륭한 공간이에요.",
			},
			nh : {
				humTitle : "습도: 건조함",
				humExplain : "다육/선인장이 좋아하는 건조한 공간이네요!더 다양한 식물을 키우기 위해서는 습도를 높여줘야 해요.",
			},
			mh : {
				humTitle : "습도: 습함",
				humExplain : "흙이 잘 마르지 않는 습한 공간이에요. 식물을 키운다면 물을 주기 전에 꼭 흙이 마른 것을 확인하고 물을 줘야 해요.",
			},
			hh : {
				humTitle : "습도: 쾌적함",
				humExplain : "공간의 습도가 쾌적하게 유지되어 아주 다양한 식물을 키우기에 적합한 환경이랍니다.",
			},
			na : {
				airTitle : "공기순환: 부족함",
				airExplain : "공기가 정체되면 병충해가 발생할 위험이 커지고,물 마름도 느려질 수 있어요.서큘레이터나 공기청정기를 틀어 공기를 순환시켜 주면 식물을 더 건강하게 키울 수 있어요.",
			},
			ma : {
				airTitle : "공기순환: 보통",
				airExplain : "일주일에 한 번 정도는 맑은 공기로 환기해 주고 있군요! 환기를 더 자주 해주면 좋겠어요. 정체되지 않은 맑은 공기는 공기의 흐름이 좋게 해 식물을 더 건강하게 해줘요.",
			},
			ha : {
				airTitle : "공기순환: 매우좋음",
				airExplain : "환기를 자주 해주어 공기의 순환이 아주 좋아 식물을 키우기에 매우 적합해요!단,겨울철에는 식물이 직접적으로 찬바람을 맞지 않도록 주의해주세요.",
			},
			//추천식물리스트
			ng : {
				grothExplain : "느림",
			},
			mg : {
				grothExplain : "보통",
			},
			hg : {
				grothExplain : "빠름",
			},
			ni : {
				interestExplain : "낮음",
			},
			mi : {
				interestExplain : "보통",
			},
			hi : {
				interestExplain : "필요함",
			},

			lv1 : {
				lvTitle : "Lv.1-초보자",
				lvExplain : "식물을 처음 키우기 시작하는 단계라 걱정인가요? 잘 찾아 왔어요. 식물박사들이 도와줄테니 걱정마세요!",
				lvTag1 : "#새내기",
				lvTag2 : "#초보집사",
			},
			lv2 : {
				lvTitle : "Lv.2-식물 러버",
				lvExplain : "식물 키우는 재미에 푹빠져버리셨네요! 잘 찾아 왔어요. 식물박사가 되어가는 여정을 함께 해요!",
				lvTag1 : "#나도 곧 풀박사",
				lvTag2 : "#열정적",
			},
			lv3 : {
				lvTitle : "Lv.3-나는야 식물박사",
				lvExplain : "혹시 당신은 이미 만렙? 작은농장에 오신걸 환영해요!",
				lvTag1 : "#무엇이든 물어봐",
				lvTag2 : "#고수의 향기",
			},

		};

		function start() {
			$(".start").hide(); //테스트 시작뷰페이지와 질문테스트 하는 뷰를 같이 씀 그래서 처음에 질문테스트뷰를 display:none했음 
			$(".question").show(); //질문의 답을 하기위해 시작뷰 숨기고 질문뷰 보여주기
		
			next();
		}
		<!--처음에 로딩창 숨기기 -->
		
		$(window).on('load', function () {
		      $("#load").hide();
		 });
		
		 
		// 로딩 창을 감추는 함수
		 function hideLoading() {
		     $("#load").hide();
		     $(".container").show();
		 }
		 
		// 로딩 창을 보여주는 함수
		 function showLoading() {
		     $(".container").css("display","none");
			 $("#load").show();

		     // 8초 후에 숨기기
		     setTimeout(hideLoading, 3000);
		    
		 }


		//키우는 환경 답변버튼 a,b,c
		$("#a").click(function() {
			//B버튼을 클릭할때는 value+1 안함
			next(); //B버튼을 클릭시 다음으로 넘어감
		});
		$("#b").click(function() {
			var type = ($("#type").val()); //id[type]의 질문의 value값 가져오기(질문구별을 위해)  A버튼 클릭하면  ex) <input id="type" type="hidden" value="EI">의 value값 EI 가져오기   <input type="hidden" id="EI" value="0">
			var preValue = $("#" + type).val(); // 가져온 value값의 아이디를 가진 것의 value를 뽑음 <input type="hidden" id="EI" value="0"> 
			$("#" + type).val(parseInt(preValue) + 1) //0이였던 value를 +1설정을 함 ==> A버튼을 클릭할때마다 <input type="hidden" id="EI" value="0">의 value가 +1 이됨
			next();
		});

		$("#c").click(function() {
			var type = ($("#type").val()); //id[type]의 질문의 value값 가져오기(질문구별을 위해)  A버튼 클릭하면  ex) <input id="type" type="hidden" value="EI">의 value값 EI 가져오기   <input type="hidden" id="EI" value="0">
			var preValue = $("#" + type).val(); // 가져온 value값의 아이디를 가진 것의 value를 뽑음 <input type="hidden" id="EI" value="0"> 
			$("#" + type).val(parseInt(preValue) + 2) //0이였던 value를 +1설정을 함 ==> A버튼을 클릭할때마다 <input type="hidden" id="EI" value="0">의 value가 +1 이됨
			next();
		});

		//mbti 답변버튼 A,B
		//A버튼 클릭시 대답에 해당하는 <button>을 클릭했을 때, <input>의 value값이 오를
		$("#A").click(function() {
			var type = ($("#type").val()); //id[type]의 질문의 value값 가져오기(질문구별을 위해)  A버튼 클릭하면  ex) <input id="type" type="hidden" value="EI">의 value값 EI 가져오기   <input type="hidden" id="EI" value="0">
			var preValue = $("#" + type).val(); // 가져온 value값의 아이디를 가진 것의 value를 뽑음 <input type="hidden" id="EI" value="0"> 
			$("#" + type).val(parseInt(preValue) + 1) //0이였던 value를 +1설정을 함 ==> A버튼을 클릭할때마다 <input type="hidden" id="EI" value="0">의 value가 +1 이됨
			next();
		});
		$("#B").click(function() {
			//B버튼을 클릭할때는 value+1 안함
			next(); //B버튼을 클릭시 다음으로 넘어감
		});

		$(function() {
			$("#recommendPlant").on("click", "img", function() {
				$(this).parents("form").children(".submitBtn").click();
			});
		});

		function next() { //먼저 1번부터 시작

			if (num == 8) {
				$("#resultBtn1").hide(); //버튼3개인거 지우기
				$("#resultBtn").show(); //8번부터 버튼2개로 보여주기
				$("resultBtn").css("display", "flex");

				var lvTest = "";
				var temperate = "";
				var sun = "";
				var humidity = "";
				var air = "";
				var growth = "";
				var management = "";

				($("#lv1lv2lv3").val() == 0) ? (lvTest += "lv1") : ($("#lv1lv2lv3").val() == 1) ? (lvTest += "lv2"): (lvTest += "lv3");
				($("#ntmtht").val() == 0) ? (temperate += "nt") : ($("#ntmtht").val() == 1) ? (temperate += "mt"): (temperate += "ht");
				($("#nsmshs").val() == 0) ? (sun += "ns"): ($("#nsmshs").val() == 1) ? (sun += "ms"): (sun += "hs");
				($("#nhmhhh").val() == 0) ? (humidity += "nh") : ($("#nhmhhh").val() == 1) ? (humidity += "mh") : (humidity += "hh");
				($("#namaha").val() == 0) ? (air += "na"): ($("#namaha").val() == 1) ? (air += "ma"): (air += "ha");
				($("#ngmghg").val() == 0) ? (growth += "ng") : ($("#ngmghg").val() == 1) ? (growth += "mg") : (growth += "hg");
				($("#nimihi").val() == 0) ? (management += "ni"): ($("#nimihi").val() == 1) ? (management += "mi"): (management += "hi");
				$("#lvExplain").html(result[lvTest]["lvExplain"]);
				$("#lvTitle").html(result[lvTest]["lvTitle"]);
				$("#lvTag1").html(result[lvTest]["lvTag1"]);
				$("#lvTag2").html(result[lvTest]["lvTag2"]);

				//설문조사한 온도,빛,습도,공기값을 넣어주고 색깔바꿔주기
				if (temperate == "nt") {
					$("#tempTitle").html(result[temperate]["tempTitle"]).css("color", "#FF6C30");
				} else if (temperate == "mt") {
					$("#tempTitle").html(result[temperate]["tempTitle"]);
				} else {
					$("#tempTitle").html(result[temperate]["tempTitle"]).css("color", "#70C745");
				}
				$("#tempExplain").html(result[temperate]["tempExplain"]);

				if (sun == "ns") {
					$("#sunTitle").html(result[sun]["sunTitle"]).css("color","#FF6C30");
				} else if (sun == "ms") {
					$("#sunTitle").html(result[sun]["sunTitle"]);
				} else {
					$("#sunTitle").html(result[sun]["sunTitle"]).css("color","#70C745");
				}
				$("#sunExplain").html(result[sun]["sunExplain"]);

				if (humidity == "nh") {
					$("#humTitle").html(result[humidity]["humTitle"]).css("color", "#FF6C30");
				} else if (humidity == "mh") {
					$("#humTitle").html(result[humidity]["humTitle"]);
				} else {
					$("#humTitle").html(result[humidity]["humTitle"]).css("color", "#70C745");
				}
				$("#humExplain").html(result[humidity]["humExplain"]);

				if (air == "na") {
					$("#airTitle").html(result[air]["airTitle"]).css("color","#FF6C30");
				} else if (air == "ma") {
					$("#airTitle").html(result[air]["airTitle"]);
				} else {
					$("#airTitle").html(result[air]["airTitle"]).css("color","#70C745");
				}
				$("#airExplain").html(result[air]["airExplain"]);

				//input hidden요소에 설문조사한 생장속도/관리요구도 값 넣어주기
				$("#growth").attr("value", result[growth]["grothExplain"]);
				$("#management").attr("value",result[management]["interestExplain"]);

				var enviNum = parseInt($("#ntmtht").val())
						+ parseInt($("#nsmshs").val())
						+ parseInt($("#nhmhhh").val())
						+ parseInt($("#namaha").val());

				//enviNum과 percentage의 관계
				var percentage3 = enviNum * 10;
				var enviType = enviNum <= 3 ? "험난한 환경": (enviNum <= 5 ? "무난한 환경" : "훌륭한 환경");

				//방법1
				$("#pressbarGage").attr('data-percentage', percentage3);
				$("#progress").attr("value", percentage3);
				$("#envyTypeText").html(enviType);

				//추천식물 가져오기
				$.ajax({
							url : "selectContentNo.mt",
							data : {
								pageNo : $("#pageNo").val(),
								grwtveCodeNm : $("#growth").val(),
								managedemanddoCodeNm : $("#management").val()
							},
							success : function(result) {

								var inputValue = $("#pageNo").val();
								var incrementedValue = parseInt(inputValue) + 1;
								$("#pageNo").val(incrementedValue);

								for (var i = 0; i < result.length; i++) {
									var wrapDiv = $("<div class='single-best-seller-product d-flex align-items-center'></div>");
									var formDiv = $("<form action='detailRecommend.mt' method='post'></div>");
									var rtnFileUrlStr = $("<input type='hidden' name='rtnFileUrlStr' value=''>");
									rtnFileUrlStr.val(result[i].rtnFileUrlStr);
									var cntntsNo = $("<input type='hidden' name='cntntsNo' value=''>");
									cntntsNo.val(result[i].cntntsNo);
									var cntntsSj = $("<input type='hidden' name='cntntsSj' value=''>");
									cntntsSj.val(result[i].cntntsSj);
									var submitBtn = $("<input type='submit' class='submitBtn' hidden>");
									var detailImg = $("<input type='hidden' name='detailImg'>");
									detailImg.val(result[i].rtnFileUrl[0]);
									var div1 = $("<div style='width:100px;'></div>");
									var thumbnailDiv = $("<div class='product-thumbnail'></div>");
									var imgDiv = $("<div class='product-img'></div>");
									var img = $("<img style='width:100px; height:100px;'>");
									var nameDiv = $("<div class='product-info'></div>");
									var name = $("<p id='plantName'></p>").text(result[i].cntntsSj);
									
									img.attr("src", result[i].rtnFileUrl[0]);
									imgDiv.append(img);
									thumbnailDiv.append(imgDiv);
									nameDiv.append(name);
									div1.append(thumbnailDiv).append(nameDiv);
									formDiv.append(rtnFileUrlStr);
									formDiv.append(cntntsNo);
									formDiv.append(cntntsSj);
									formDiv.append(submitBtn);
									formDiv.append(detailImg);
									formDiv.append(div1);
									wrapDiv.append(formDiv);
									$(".recommendLoding").css("display", "none");
									$("#recommendPlant").append(wrapDiv);
								}

							},
							error : function() {
								console.log("톻신 오류");
							}
						});

				/*
						 <!-- 식물추천리스트 -->
							<div class="single-best-seller-product d-flex align-items-center">		
								<form action='detailInGarden.pp' method='post'>
									<input type="hidden" name="rtnFileUrlStr" value="">
									<input type="hidden" name="cntntsNo" value="">
									<input type="hidden" name="cntntsSj" value="">
									<input type="submit" class="submitBtn" hidden>
									<input type="hidden" name="detailImg" src="result[i].rtnFileUrl[0]"> 
									<div>
										<div class="product-thumbnail">
											<div class='product-img'><img src="resources/img/bg-img/4.jpg"
												alt=""></div>
										</div>
										<div class="product-info">
											<p>Cactus Flower</p>
										</div>
									</div>
								</form>
							</div>
									
				 */

			}
			//11개의 질문이 끝나면 question창 숨기고 result창 띄우기
			if (num == 12) { 
				
				showLoading();
				$(".question").hide();
				$(".result").show();
				$("#mbtiImg").show();
				$("#mbtiExplain").show();
				$("#mbtiTag1").show();
				$("#mbtiTag2").show();
				$("#mbtiTag3").show();
				$("#mbtiTag4").show();

				var mbti = "";
				//A클릭 함수로 인해 A버튼을 클릭했으면 value+1때문에 1이 되어있음 b를 클릭했으면 0
				$("#EI").val() == 0 ? (mbti += "I") : (mbti += "E");
				$("#SN").val() == 0 ? (mbti += "N") : (mbti += "S");
				$("#TF").val() == 0 ? (mbti += "F") : (mbti += "T");
				$("#JP").val() == 0 ? (mbti += "P") : (mbti += "J");

				$("#mbtiImg").attr("src", result[mbti]["mbtiImg"]);
				$("#item").html(result[mbti]["item"]);
				$("#mbtiExplain").html(result[mbti]["mbtiExplain"]);
				$("#mbtiTag1").html(result[mbti]["mbtiTag1"]);
				$("#mbtiTag2").html(result[mbti]["mbtiTag2"]);
				$("#mbtiTag3").html(result[mbti]["mbtiTag3"]);
				$("#mbtiTag4").html(result[mbti]["mbtiTag4"]);
			} else {

				//질문페이지를 클릭시 숫자를 올렸으니깐 그 번호에 해당하는 질문,버튼2개의 값을 바꿔주기
				$(".q-num").html('Q' + num);
				$(".progress-txt").html(num + ' / 11');
				$(".progress-bar").attr('style','width: calc(100/11*' + num+ '%); background-color: #70c745;');
				$("#title").html(q[num]["title"]); // <h2 id="title" class="text-center mt-5">문제</h2>의 문제를 바꿔줌
				$("#type").val(q[num]["type"]); //내용을 변경"하는 것이 아니라, 속성을 변경. input id="type"의 value=""안의 값을 바꿔주는 것. 즉 문제종류를 결정하는 타입 변경해주기
				$("#A").html(q[num]["A"]);
				$("#B").html(q[num]["B"]);
				$("#a").html(q[num]["a"]);
				$("#b").html(q[num]["b"]);
				$("#c").html(q[num]["c"]);
				$("#qImg").attr("src", q[num]['qImg']);
				num++;
			}
		}
		 
	</script>






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