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
		
		.rectangle {
            width: 730px;
            height: 0.5px; 
            background-color: #D5D5D5; 
            margin-top: 100px; 
            margin-bottom:50px;
        }
        
        .rectangle2 {
            width: 0.5px;
            height: 50px; 
            background-color: #000; 
            margin-top: 100px; 
            margin-bottom:50px;
            margin-left :365px;
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
	<%@include file="/WEB-INF/views/common/header.jsp" %>
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
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/season/fall6.jpg);">
            <h2 style = "font-family:LotteMartDream">가을 텃밭 가꾸는 법</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">계절별 텃밭 가꾸는 법</li>
							<li class="breadcrumb-item"><a href="#">가을</a></li>
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
            <div class= "row justify-content-center">
                <!-- Blog Posts Area -->
                <div class="col-12 col-md-8">
                    <div class="blog-posts-area">

                        <!-- Post Details Area -->
                        <div class="single-post-details-area">
                            <div class="post-content">
                                <h4 class="post-title">가을 텃밭은 무럭무럭 자라는 중!
                                <br>(ft. 동반식물 추천) </h4>
                                <div class="post-meta mb-30">
                                    <a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 31 DEC 2023</a>
                                    <a href="#"><i class="fa fa-user" aria-hidden="true"></i>농담곰씨</a>
                                </div>
                               
                                <p style = "margin-top : 70px;">
                                하늘은 높고 불어오는 바람결에는 가을 향기가 묻어있는 계절...가을입니다.
								저는 동네 뒷산을 올랐다가 가을을 만났는데요.
								서울에서 느껴보는 가을을 담아봤답니다.
                                </p>
                                <img src="resources/img/season/fall1.jpg" style = "width:730px;">
                                <p style = "margin-top : 20px;">
                                아직 한낮엔 뜨거운 햇살이 나오지만 계절은 어느덧 가을로 향하고 있어서인지 아침, 저녁으로 제법 날씨가 시원하네요.
								'언제 더웠나?' 싶을 정도로 뜨거웠던 여름을 보내고, 제가 사는 아파트는 벌써 김장 배추 모종 심기와 무 씨앗 파종으로 모습들이 보입니다.
								<br><br>
								<b>이제 가을 텃밭 준비를 하러 가볼까요?</b>
                                </p>
                             
                             
                                <div class="rectangle"></div>
                                <h5 style ="text-align : center ; color :black; margin-bottom:20px">
                                   가을아 부탁해! 가을 텃밭 준비하기!
                                   <br><br>🍂
                                </h5><br>
                                <img src="resources/img/season/fall2.jpg" style = "width:730px;">
                                <p style = "margin-top:20px">
									가을 텃밭을 책임져줄 삼총사! 당근, 적환무, 청갓 씨앗이에요. 시장에서 모종, 씨앗 등을 판매하는 화원에서 쉽게 구입할 수 있는 종자들인데요. 9~10월에 심고 30일 후부터 수확이 가능한 적환무와 11월에 수확을 할 수 있는 가을 작물들이에요. 
									이 밖에도 시금치, 무, 배추, 상추, 콜라비 등 가을작물들이 다양하답니다. 😀
                                </p>
                                
                                <div class="rectangle"></div>
                                <img src="resources/img/season/fall3.jpg" style = "width:730px;">
                                <p style = "font-size:14px; text-align:center; margin-top:10px">▲ 적환무 심기</p>
                                <br><br>
                                
                                <div class="row mb-30">
                      
                                    <div>
										<br>
                                        <p style = "margin-bottom:50px">동글동글 방울토마토처럼 빨갛고 작은 크기가 예뻐서 음식 플레이팅에 많이 쓰이는 적환무(유럽에서 온 종자로 래디시라고 불림)는 30일 후면 수확이 가능하다고 해요. 전 처리된 적환무 씨앗을 하나씩 심어줬어요. 너무 다닥다닥 심으면 잘 크지 않는다고 합니다. 
											당근과 청갓도 골고루 텃밭 화분에 심었어요. 청갓은 씨앗이 작아서 쏟아 버리는 바람에 나중에 어떻게 클지 걱정이네요. 🤔</p>
										<div class="rectangle"  style = "margin-top:50px"></div>
										<h5 style ="text-align : center ; color :black; margin-bottom:20px">
		                                   무럭무럭 자란 가을 텃밭을 소개합니다!
		                                   <br><br>🍂
		                                </h5><br>
										<img src="resources/img/season/fall4.jpg" style = "width:730px;">
                                    </div>
                                    <br>
                                    <p>시원해진 가을바람과 파란 가을 하늘이 가슴을 설레게 하는 요즘이에요. 옥상텃밭 가을 작물들도 무럭무럭 자라는 중인데요! 
                                  		  고추 텃밭도 이제 마무리하고 여러 작물들을 심어두었어요. 어떤 작물들이 잘 자라고 있는지 궁금하시죠?
                                  		  <br><br>
                                  		  여름부터 계속 자르면 또 크고 자르면 또 크는 부추는 여전히 잘 자라고 있고, 올해 새 식구였던 블루베리 나무는 열매 수확이 끝나고 잎이 아주 무성해졌어요. 이제 날씨가 쌀쌀해지면 겨울 대비를 시켜줘야겠어요.  </p>
                                </div>
                                <div class="rectangle2">
                                </div>
                                <h5 style ="text-align :center">이제 가을맞이 <br>
                                	'동반 식물' 추천 합니다~</h5><br><br>
                                <p>
	                               잘 맞는 사람이 있는 것처럼 식물에도 '궁합'이 존재한답니다.
									함께 심으면 서로 혹은 한쪽에 좋은 영향을 주는 식물을 ‘동반식물’이라고 해요. 
									해충을 퇴치하거나 영양분을 제공하는 등 서로의 성장을 도와요.
                                </p><br>
								<img src="resources/img/season/fall5.jpg" style = "width:730px; margin-bottom:20px">
                        		<p>동반식물의 기능에는 크게 생육 촉진, 해충방제와, 상호의존으로 기능이 나누어지게 되는데요, 그렇지만 식물들끼리의 좋은 영향만이 있는 것은 아닙니다! 
                        		이로운 영향을 끼치기도 하지만 어떤 식물은 서로 영양분을 둔 경쟁관계일 수도 있습니다!
                        		
                        		<blockquote>
                                    <div class="blockquote-text">
                                    <p>
								 		 🍅토마토<br>
											: 바질, 고수, 딜, 당근, 로즈메리 등과 함께 키우면 생육 촉진, 해충방제, 상호의존의 효과가 있습니다! 허브류와 함께 심어보세요! 하지만 콩류, 옥수수와는 경쟁관계입니다!<br><br>
										🌶️고추<br>
											: 바질, 토마토, 마늘, 들깨 등과 함께 심을 때 생육 촉진과 해충방제의 효과가 있습니다! 하지만 마늘, 양파, 콜라비와는 경쟁관계입니다!<br><br>
										🍆가지<br>
											: 콩류, 바질, 고추, 토마토, 옥수수 등과 함께 심는다면 생육 촉진, 해충방제와 상호의존의 효과가 있습니다! 해바라기, 제비콩, 감자와는 경쟁관계입니다!<br><br>
										🥗상추<br>
											: 콩류, 완두류, 딸기, 마늘, 민트 등과 함께 심을 때 생육 촉진과 해충방제의 효과가 있습니다! 양배추, 콩류, 파슬리와는 경쟁관계입니다!<br><br>
										🥕​당근<br>
											: 콩류와 차이브, 고수를 함께 심으면 잘 자라고, 해충도 방제할 수 있습니다. 허브의 하나인 딜은 경쟁 관계이므로 피하는 것이 좋습니다.<br><br>
										🥙​양배추<br>
											: 바질과 양파, 콩류를 함께 심으면 잘 자라고, 금잔화, 당근, 셀러리와 함께 심으면 해충을 방제할 수 있습니다. 브로콜리, 고추, 갓은 경쟁 관계이므로 함께 심는 것은 좋지 않습니다.<br><br>
                                    </p>
                                    </div>
                                </blockquote>
                                <div class="rectangle"  style = "margin-top:50px"></div>
                                <br>
                                <p>오늘은 다시 시작하는 가을농사에 대비해 동반식물들에 대해 알아보았습니다! 한 해를 끝내는 겨울까지 키우는 작물들인 만큼 이번의 시작이 중요합니다! 동반 식물들에 대해 알고 또다시 새로운 마음으로 밭도 다시 일궈보세요!</p>
                        	</div>
                        </div>
             
                        <!-- Post Tags & Share -->
                        <div class="post-tags-share d-flex justify-content-between align-items-center">
                            <!-- Tags -->
                            <ol class="popular-tags d-flex align-items-center flex-wrap">
                                <li><span>Tag:</span></li>
                                <li><a href="#">PLANTS</a></li>
                                <li><a href="#">CACTUS</a></li>
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
    <script src="<%= contextPath %>/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="<%= contextPath %>/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="<%= contextPath %>/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="<%= contextPath %>/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="<%= contextPath %>/resources/js/active.js"></script>
    
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
			      description: "가을 텃밭 가꾸는법", // 보여질 설명
			      imageUrl:"https://ifh.cc/g/8y7Bpx.jpg", // 콘텐츠 URL
			      link: {
			         mobileWebUrl: "http://localhost:8888/tinyfarm/fall.re",
			         webUrl: "http://localhost:8888/tinyfarm/fall.re"
			        }
			  	  },
			      social: {
			        commentCount:152,  
			        sharedCount: 65  
			    }
			  });
			}
	</script>
	
	<script>
		function shareTwitter() {
		    var sendText = "작은농장"; // 전달할 텍스트
		    var sendUrl = "http://localhost:8888/tinyfarm/fall.re"; // 전달할 URL
		    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
		}
	</script>
	
	<script>
		function shareLink(){
			   var url = '';
			   var textarea = document.createElement("textarea");
			   document.body.appendChild(textarea);
			   url = 'http://localhost:8888/tinyfarm/fall.re';
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