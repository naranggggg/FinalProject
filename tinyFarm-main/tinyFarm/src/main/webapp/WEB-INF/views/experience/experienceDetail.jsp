<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작은농장</title>
   <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 5.3.2 -->
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<!-- 카카오 지도 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed30e79691f839aedd7d7cec75482647&libraries=services"></script>
	<style>
		ul{
			padding:0;
		}
		.title{
			margin:15px 0;
			color: #222228;
		}
		.container{
			width:100%;
			height:auto;
		}
		.detail-div{
			width:800px;
			margin:50px auto;
			padding:40px;
		}
		.d-img-title{
			width:100%;
			height: auto;
			border-bottom: 1px solid #d4d4d4;
		}
		.title-img{
			width:100%;
			height:60%;
		}
		li.locplc{
			background: url(resources/img/icon/location-icon.png) top left/20px no-repeat;
		}
		li.telno{
			background: url(resources/img/icon/phone-icon.png) top left/20px no-repeat;
		}
		li.url{
			background: url(resources/img/icon/homepage-icon.png) top left/20px no-repeat;
		}
		.list li{
			width:100%;
			padding-left:25px;
			margin-top:20px;
			margin-bottom:20px;
		}
		.list-div{
			width:100%;
			border-bottom: 1px solid #d4d4d4;
		}
		.url a{
			font-size: 16px;
			color:#707070;
		}
		.cn-div,.map-div{
			padding:20px;
			border-bottom: 1px solid #d4d4d4;
		}
		
		
		.share-btn-div{
			height:auto;
			margin:20px 0;
		}
		.share-btn-div a{
			padding:15px 15px 15px 0;
		}
	</style>
	
</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>농촌교육농장</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="${contextPath}/experienceList.ex">농촌교육농장</a></li>
						<li class="breadcrumb-item"><a href="">체험 상세보기</a></li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="detail-div">
			<div class="d-img-title">
				<img id="title-img" src="${ex.imgUrl1}">
				<h1 class="title"><b>${ex.cntntsSj}</b></h1>
				<p><b style="color:#FF6C30;">주제</b>&nbsp;&nbsp;${ex.thema}</p>
			
			</div>
		
			<div class="list-div">
			  <ul class="list">
			    <li class="locplc">
			      ${ex.locplc} <!-- 소재지 -->
			    </li>
			    <li class="telno">
			      ${ex.telno} <!-- 전화번호 -->
			    </li>
			    <li class="url">
			      <a href="${ex.url}">${ex.url}</a> <!-- 홈페이지 주소 -->
			    </li>
			   
			  </ul>
			  <!-- 공유하기 버튼 div -->
			  <div class="share-btn-div">
			  		<a id="btnKakao" class="kakao" href="javascript:shareKakao('${ex.cntntsNo}');"><img src="${contextPath}/resources/img/icon/icon-kakao.png"/></a>
					<a id="btnTwitter" class="twitter" href="javascript:shareTwitter('${ex.cntntsNo}');"><img src="${contextPath}/resources/img/icon/icon-twitter.png"/></a>
					<a id="btnlink" class="link" href="javascript:shareLink('${ex.cntntsNo}');"><img src="${contextPath}/resources/img/icon/icon-link.png"/></a>	
			  </div>
			</div>
			<!-- 내용 -->
			<div class="cn-div">
				${ex.cn }
			</div>
			<!-- 지도 -->
			<div class="map-div">
				<h2 class="title">찾아오는 길</h2>
				<div id="map" style="width:720px;height:600px;"></div>
			</div>
			<!-- 카카오 공유하기 -->
			<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
			<script>
				$(function(){
					var title = '${ex.cntntsSj}';
					var locplc = '${ex.locplc}';
					var cntntsNo = '${ex.cntntsNo}';
					getMap(title,locplc);
					//맨 처츰에 카카오 공유 버튼 생성을 해야하기 때문에 페이지 로드시 한번 수행
					shareKakao(cntntsNo);
				});
				//카카오 지도 api
				function getMap(title,location){
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
		
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(location, function(result, status) {
			
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
			
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
			
	
			
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    
				}
				//카카오 공유
				function shareKakao(cntntsNo) {
				  // 사용할 앱의 JavaScript 키 설정
				  Kakao.init('aef906bc476f983341072fc51f3c5b36');
				  var imgUrl = "${ex.imgUrl1}";
				  // 카카오링크 버튼 생성
				  Kakao.Link.createDefaultButton({
				    container: '#btnKakao', // 카카오공유버튼ID
				    objectType: 'feed',
				    content: {
				      title: "작은농장", // 보여질 제목
				      description: "농촌체험활동", // 보여질 설명
				      imageUrl: imgUrl, // 콘텐츠 URL
				      link: {
				         mobileWebUrl: "http://localhost:8888/tinyfarm/experienceDetail.ex?cntntsNo="+cntntsNo,
				         webUrl: "http://localhost:8888/tinyfarm/experienceDetail.ex?cntntsNo="+cntntsNo
				        }
				  	  },
				      social: {
				        commentCount: 51,  
				        sharedCount: 223  
				    }
				  });
				}
				//트위터 공유
				function shareTwitter(cntntsNo) {
				    var sendText = "작은농장"; // 전달할 텍스트
				    var sendUrl = "http://localhost:8888/tinyfarm/experienceDetail.ex?cntntsNo="+cntntsNo; // 전달할 URL
				    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
				}
				//링크 공유
				function shareLink(cntntsNo){
					   var url = '';
					   var textarea = document.createElement("textarea");
					   document.body.appendChild(textarea);
					   url = "http://localhost:8888/tinyfarm/experienceDetail.ex?cntntsNo="+cntntsNo;
					   textarea.value = url;
					   textarea.select();
					   document.execCommand("copy");
					   document.body.removeChild(textarea);
					   alert("링크가 복사되었습니다")
					};
			
			</script>
		</div>
	</div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- ##### Product Area End ##### -->
</body>
</html>