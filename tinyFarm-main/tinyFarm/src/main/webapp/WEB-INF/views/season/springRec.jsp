<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Alazea - Gardening &amp; Landscaping HTML Template</title>

<%
String contextPath = request.getContextPath();
%>

<!-- Favicon -->
<link rel="icon" href="/resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="<%=contextPath%>/resources/style.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
@font-face {
	font-family: 'LotteMartDream';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff')
		format('woff');
}

.rectangle {
	width: 730px;
	height: 0.5px;
	background-color: #000;
	margin-top: 100px;
	margin-bottom: 50px;
}

.rectangle2 {
	width: 0.5px;
	height: 50px;
	background-color: #000;
	margin-top: 100px;
	margin-bottom: 50px;
	margin-left: 365px;
	background-color: #A6A6A6;
}

      .link-icon {
				position: relative;
				display: inline-block;
				width: auto;
				font-size: 14px;
				font-weight: 500;
				color: #333;
				margin-right: 10px;
				padding-right:40px;
				padding-top: 40px;
				margin-top: -70px;
			}
			
			.link-icon.kakao {
				background-image:
					url("<%=contextPath%>/resources/img/icon/icon-kakao.png");
				background-repeat: no-repeat;
			}
			
			.link-icon.twitter {
				background-image:
					url("<%=contextPath%>/resources/img/icon/icon-twitter.png");
				background-repeat: no-repeat;
			}
			
			.link-icon.link {
				background-image:
					url("<%=contextPath%>/resources/img/icon/icon-link.png");
				background-repeat: no-repeat;
			}
</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="img/core-img/leaf.png" alt="">
		</div>
	</div>



	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/season/spring_flower.jpg);">
			<h2 style="font-family: LotteMartDream">봄에 텃밭 가꾸는 법</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/tinyfarm/"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">계절별
								텃밭 가꾸는 법</li>
							<li class="breadcrumb-item"><a href="#">봄</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<!-- ##### BlogContent Area Start ##### -->
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
									봄을 알리는 초보 농업인의 텃밭 가꾸기 <br>(ft. 베란다 텃밭) <i
										class="fa fa-sun-o" aria-hidden="true" style="color: red"></i>
								</h4>
								<div class="post-meta mb-30">
									<a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i>
										20 DEC 2023</a> <a href="#"><i class="fa fa-user"
										aria-hidden="true"></i> 대장농부</a>
								</div>

								<p>
									봄 내음이 가득한 바깥으로 나들이도 좋지만 우리 집으로 봄 내음을 채워보는 건 어떨까요? 시골에서 큰 땅에 농사를
									짓지 않아도! 다가오는 봄, 나도 우리 집 베란다에서 농사짓는 농부가 되어 희망찬 봄을 느껴보아요 <br>4월
									텃밭 개장 시즌에 맞춰 화훼시장에서는 여러 종류의 봄꽃과 모종 분양을 하고 있는데요. 집안을 화사하게 만들어줄
									봄꽃과 화초, 텃밭에 심으면 좋을 여러 모종들을 소개합니다.
								</p>

								<div class="rectangle"></div>
								<h5 style="text-align: center; color: black">
									"향긋한 봄꽃으로 집안에 활력을 불어 넣어요"
									<h5>
										<br>
										<p>여러분이 가장 좋아하는 꽃은 무엇인가요? 저는 활짝 핀 철쭉을 좋아해요! ‘정열’과 ‘명예’란
											꽃말을 가지고 있거든요!😊</p>
										<br> <br>
										<div class="row mb-30">
											<div>
												<img src="resources/img/season/52.jpg"
													style="width: 730px; margin-left: 15px">
											</div>
											<div>
												<br>
												<p>성큼 다가온 봄, 많은 분들이 싱그러운 텃밭 가꾸기 작업을 준비하곤 하는데요. 오늘은 야외가
													아닌 베란다에서 텃밭 가꾸는 법에 대해 알아보도록 할게요</p>
												<b><h5 style="text-align: center; margin-top: 40px;">우선,
														우리 집 베란다 특성을 파악해 볼까요?</h5></b>
												<div class="rectangle" style="margin-top: 50px"></div>
												<img src="resources/img/season/53.jpg" style="width: 730px;">
											</div>
											<br>
											<p>베란다에서 텃밭을 시작하려고 하면 '무슨 작물을 키워야 할까..' 고민을 하게 되는데요. 그전에
												우리 집 특성(아파트의 방위, 층수, 유리창 등)을 파악하는 것이 중요합니다.</p>
										</div>
										<div class="rectangle2"></div>
										<h5 style="text-align: center">
											키포인트 3 <br> '베란다 창문 방향·위치·시간'
										</h5>
										<br>
										<p>
											햇빛이 베란다 창문을 통과하면서 빛의 양도 줄어드는데요, 시간대별로 빛의 양도 달라 광질(빛의 성질)의 변화도
											일어납니다. 그리고 베란다의 방향과 위치가 집집마다 다르기 때문에 베란다 텃밭 재배환경에 차이가 발생합니다.<br>
											<br> 그렇기 때문에 창문 방향에 따라 햇빛이 들어오는 시간대와 방향을 파악하는 것이 중요합니다.
										</p>
										<br> <img src="resources/img/season/54.jpg"
											style="width: 730px;">
										<div class="rectangle2" style="margin-top: 100px"></div>
										<h5 style="text-align: center">
											우리 집 환경에 맞는 <br> 작물 선택을 해볼까요?
										</h5>
										<br>
										<p>햇빛이 잘 드는 남향 베란다라면 상추·적근대·시금치·열무·레몬그라스 등을 추천합니다. 빛의 양이
											보통인 동·서향이면 쑥갓·청경채·셀러리·잎들깨를, 빛이 적은 북향이면 엔다이브·치커리·부추·쪽파 등이
											좋습니다. 그렇다면 베란다에서 키우기 어려운 작물은 어떤 것이 있을까요?
											고추·토마토·파프리카·오이·호박·감자·무·딸기·가지·참외·수박 등을 꼽을 수 있습니다.</p>
										<br> <img src="resources/img/season/55.jpg"
											style="width: 730px; margin-bottom: 50px">
							</div>
						</div>
						<p>마당이나 밭에 있는 흙을 옮겨 담아 사용하면 잡초 종자와 벌레가 같이 옮겨질 수 있으므로 원예용 상토를
							화원이나 농자재 마트 등에서 구입해서 사용합니다. 사용하고 남은 상토는 오염되지 않게 잘 밀봉합니다. 또한 원예용
							상토는 한 달 정도 지나면 양분이 사라지므로 양분을 추가로 줄 때는 적정량을 지켜서 사용합니다.</p>
						<br>
						<p>텃밭 가꾸기용 모종 판매는 주로 봄철(3~6월)이나 가을철(8~10월)에 한정되는 경우가 많으므로 그 외
							시기에는 직접 씨앗을 사서 뿌리고 길러야 합니다. 허브류는 싹 틔우기가 어려우니 모종을 사서 심는 것이 편리합니다.
							씨앗을 심을 경우엔 모종을 기르는 기간을 고려해 모종을 이용하는 기간보다 한 달 정도 일찍 심어야 합니다. 씨앗을
							구입할 때는 유효기간을 반드시 확인하고 남은 씨앗은 밀봉해 냉장 보관합니다.</p>
						<div class="rectangle2"></div>

						<h5 style="text-align: center">
							작물 관리하는 법<br>
						</h5>
						<br> <img src="resources/img/season/56.jpg"
							style="width: 730px; margin-bottom: 50px">
						<p>물은 작물이 자라고 있는 생육상태와 상토의 마른 정도를 보면서 물주기하면 좋은데요, 작물이 심어진 상토의
							표면이 살짝 말랐을 때 물을 주는데, 물빠짐 구멍에 물방울이 맺힐 정도만 주는 것이 좋습니다. ※ 원예용 상토는 바짝
							마르게 되면 물 흡수가 어려워 물 관리에 주의해요. 첫 파종 후 1개월 정도 지나고 양분을 추가해 주는게 좋은데요,
							일반 가정에서는 가스·냄새·곰팡이 위험이 있으므로 화학비료를 쓰는 것이 좋습니다.</p>
						<br>
						<p>이외의 베란다에서 텃밭 가꾸기 자세한 정보는 농촌진흥청 홈페이지에서 볼 수 있습니다. 여러분도 기르는
							재미, 먹는 기쁨을 누릴 수 있는 베란다 텃밭 가꾸기로 봄맞이해보시길 바랍니다:D</p>
						<!-- Post Tags & Share -->
						<div
							class="post-tags-share d-flex justify-content-between align-items-center">
							<!-- Tags -->
							<ol class="popular-tags d-flex align-items-center flex-wrap">
								<li><span>Tag:</span></li>
								<li><a href="#">PLANTS</a></li>
								<li><a href="#">CACTUS</a></li>
							</ol>
						
							<a href="season.re">
								<button type="button" class="btn alazea-btn2"
									style="margin-top: 50px">목록으로</button>
							</a>
						</div>
							<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();" style = "margin-left:5px"></a>
							<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"></a>
							<a id="btnlink" class="link-icon link" href="javascript:shareLink();"></a>	
					</div>
				</div>
			</div>
		</div>
	</section>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="<%=contextPath%>/resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="<%=contextPath%>/resources/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="<%=contextPath%>/resources/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="<%=contextPath%>/resources/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="<%=contextPath%>/resources/js/active.js"></script>

	<!-- 카카오 공유하기 -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
		<script>
		function shareKakao() {
			  // 사용할 앱의 JavaScript 키 설정
			  Kakao.init('aef906bc476f983341072fc51f3c5b36');
	
			  // 카카오링크 버튼 생성
			  Kakao.Link.createDefaultButton({
			    container: '#btnKakao', // 카카오공유버튼ID
			    objectType: 'feed',
			    content: {
			      title: "작은농장", // 보여질 제목
			      description: "봄에 텃밭 가꾸는법", // 보여질 설명
			      imageUrl:"https://ifh.cc/g/JrFT0b.jpg", // 콘텐츠 URL
			      link: {
			         mobileWebUrl: "http://localhost:8888/tinyfarm/spring.re",
			         webUrl: "http://localhost:8888/tinyfarm/spring.re"
			        }
			  	  },
			      social: {
			        commentCount: 51,  
			        sharedCount: 223  
			    }
			  });
			}
	</script>
	
	<script>
		function shareTwitter() {
		    var sendText = "작은농장"; // 전달할 텍스트
		    var sendUrl = "http://localhost:8888/tinyfarm/spring.re"; // 전달할 URL
		    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
		}
	</script>
	
	<script>
		function shareLink(){
			   var url = '';
			   var textarea = document.createElement("textarea");
			   document.body.appendChild(textarea);
			   url = 'http://localhost:8888/tinyfarm/spring.re';
			   textarea.value = url;
			   textarea.select();
			   document.execCommand("copy");
			   document.body.removeChild(textarea);
			   alert("링크가 복사되었습니다")
			};
	</script>

</body>

</html>
</html>