<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>

    <% String contextPath = request.getContextPath(); %>
    
    <!-- Favicon -->
    <link rel="icon" href="/resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/style.css">

	<style>
			@font-face {
			  font-family: 'LotteMartDream';
			  font-style: normal;
			  font-weight: 400;
			  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
			}
			
			.rectangle1 {
	            width: 150px;
	            height: 1.5px; 
	            background-color: #000; 
	            margin-top: 100px; 
	            margin-bottom:50px;
				margin-left:300px;
	            background-color: black;
	        }
	        
	        .rectangle2 {
	            width: 300px;
	            height: 1px; 
	            background-color: #000; 
	            margin-top: 100px; 
	            margin-bottom:50px;
				margin-left:200px;
	            background-color: #A6A6A6;
	        }
	        
	         .rectangle3 {
	            width: 200px;
	            height: 1.5px; 
	            background-color: #000; 
	            margin-top: 100px; 
	            margin-bottom:50px;
	            margin-left :250px;
	            background-color: black;
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
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="resources/img/core-img/leaf.png" alt="">
        </div>
    </div>

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/season/sunflower.jpg);">
            <h2 style = "font-family:LotteMartDream">여름철 텃밭 가꾸는 법</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">계절별 텃밭 가꾸는 법</li>
							<li class="breadcrumb-item"><a href="#">여름</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

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
                                <h4 class="post-title">이번 여름은 텃밭에 콩과 팥 키우기🌿</h4>
                                <div class="post-meta mb-30">
                                    <a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 21 DES 2023</a>
                                    <a href="#"><i class="fa fa-user" aria-hidden="true"></i>아따맘마</a>
                                </div>
                                <p style ="margin-top:80px">봄과 다르게 여름에 텃밭 가꾸기란 여간 어려운 일이 아니에요. 그리고 고추 외에는 마땅히 심을 작물도 없기도 하구요.
								기온이 높아도 잘 자라고 관리하기도 편해 여름철 텃밭에 심기에 좋은 작물이 있다고 해요, 바로 '콩 심는데 콩나고 팥 심는데 팥난다' 속담의 주인공 콩과 팥입니다:D</p>
                                
                                <div class="row mb-30">
                                    <div class="col-lg-7">
                                        <p>콩과 팥은 재배가 어렵지 않아 여름철 텃밭에서 키우기 적당한 작물입니다. 
	                                        특별히 관리하지 않아도 잘 자라 아이들과 함께 심고 키울 수 있습니다. 
	                                        경기도에서 5년째 주말 텃밭을 운영하는 서리태 씨는 실제로 콩과 팥을 재배해보니 키우는 즐거움도 있고, 
	                                        꼬투리를 털 때 다양한 색의 콩과 팥이 나오는 재미가 쏠쏠하다며 여름철 텃밭 작물로 콩과 팥을 적극 추천하였습니다.<br><br> 농진청은 여름철 콩·팥 텃밭 운영으로 가족과 함께하는 시간도 늘리고, 수확한 콩과 팥은 건강 기능성 성분이 풍부해 차로 만들어 마시며 건강도 챙기시길 바란다며 텃밭 재배 관리 요령을 소개했습니다.
                                        </p>
                                </div>
                                    <div class="col-lg-5">
                                        <img src="resources/img/bg-img/bean.jpg" alt="">
                                    </div>
                                </div>
                                <div class="rectangle3"></div>
                                <h5 style = "text-align:center">우리집 텃밭에도</h5>
                                <h4 style = "text-align:center">심을 수 있을까?</h4>
                                <br><br>
                                <p>콩과 팥은 특별히 관리를 하지 않아도 잘 자라서 무더운 여름에 키우기 쉬운 작물이에요. 그럼! 심는 방법에 대해 알아볼까요?</p><br>
                                <p><b>콩 심는 시기 & 방법</b></p>
                                <p>콩은 6월 상순부터 심기 시작해 늦어도 7월 20일 전에는 심어야 해요. 이랑 너비는 60~70cm, 포기 사이 20~30cm로 한 구멍에 두세 알을 3~5cm 깊이로 심는게 좋아요.</p>
                                <img src="resources/img/season/bean1.jpg" style = "width:730px; margin-bottom:50px">        		
                                
                                <p><b>물 주는 방법</b><br><br>
								물은 날씨나 자라는 상태에 따라 주는 양이 달라져요. 보통 싹이 트고 뿌리가 충분히 내리기 전까지는 
								2~3일, 뿌리가 충분히 내린 후에는 일주일에  한 번 충분한 양을 주면 된답니다:)</p>
								
								<div class="rectangle2"></div>
                               
                                <p><b>팥 심는 시기 & 방법</b><br><br>
								팥은 6월 중순부터 7월 중순까지 재배해요. 이랑은 60~70cm, 포기 간격은 15~20cm으로 구멍 하나에 두 알을 3cm 깊이로 심어요.</p>
								
								<img src="resources/img/season/bean2.jpg" style = "width:730px; margin-bottom:50px">        		
								
								<p>팥은 습해에 약하기 때문에 피해를 줄이려면 이랑을 높게 하고 잎을 갉아 먹는 나방에 주의하고 제초제는 사용하지 않는 것이 좋답니다:D</p>
                                
                                <div class="rectangle1"></div>
                                <img src="resources/img/season/bean3.jpg" style = "width:730px; margin-bottom:50px">
                                <p>텃밭의 가장 큰 적, 잡초! 두 작물 모두 씨 뿌리기 전에 검정색 비닐을 깔아두면 잡초가 발생하지 않아 방제에 효과적이에요.
									<br><br>
									텃밭 관리하기 어려운 여름! 관리는 편하고 영양은 풍부한 콩과 팥 키우기, 어떠신가요?:D</p>
                                
                            </div>
                        </div>

                        <!-- Post Tags & Share -->
                        <div class="post-tags-share d-flex justify-content-between align-items-center">
                            <!-- Tags -->
                            <ol class="popular-tags d-flex align-items-center flex-wrap">
                                <li><span>Tag:</span></li>
                                <li><a href="#">여름</a></li>
                                <li><a href="#">텃밭가꾸기</a></li>
                            </ol>
                            <!-- Share -->
                            <a href="season.re">
                            	<button type="button" class="btn alazea-btn2" style="margin-top:50px">목록으로</button>
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
 	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    
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
			      description: "여름철 텃밭 가꾸는법", // 보여질 설명
			      imageUrl:"https://ifh.cc/g/oooJ2V.jpg", // 콘텐츠 URL
			      link: {
			         mobileWebUrl: "http://localhost:8888/tinyfarm/summer.re",
			         webUrl: "http://localhost:8888/tinyfarm/summer.re"
			        }
			  	  },
			      social: {
			        commentCount: 91,  
			        sharedCount: 623  
			    }
			  });
			}
	</script>
	
	<script>
		function shareTwitter() {
		    var sendText = "작은농장"; // 전달할 텍스트
		    var sendUrl = "http://localhost:8888/tinyfarm/summer.re"; // 전달할 URL
		    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
		}
	</script>
	
	<script>
		function shareLink(){
			   var url = '';
			   var textarea = document.createElement("textarea");
			   document.body.appendChild(textarea);
			   url = 'http://localhost:8888/tinyfarm/summer.re';
			   textarea.value = url;
			   textarea.select();
			   document.execCommand("copy");
			   document.body.removeChild(textarea);
			   alert("링크가 복사되었습니다")
			};
	</script>
</body>

</html>