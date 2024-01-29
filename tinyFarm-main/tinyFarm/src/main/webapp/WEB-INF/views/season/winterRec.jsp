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
	            background-color: #000; 
	            margin-top: 100px; 
	            margin-bottom:50px;
	        }
			.rectangle1 {
	            width: 150px;
	            height: 1px; 
	            background-color: #000; 
	            margin-top: 50px; 
	            margin-bottom:50px;
				margin-left:290px;
	            background-color: black;
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
	        
	         .rectangle3 {
	            width: 200px;
	            height: 1.5px; 
	            background-color: #000; 
	            margin-top: 100px; 
	            margin-bottom:50px;
	            margin-left :265px;
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
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/season/snowman.jpg);">
            <h2 style = "font-family:LotteMartDream">겨울 텃밭 가꾸는 법</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">계절별 텃밭 가꾸는 법</li>
							<li class="breadcrumb-item"><a href="#">겨울</a></li>
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
                                <h4 class="post-title">❄추운 겨울에도 텃밭 농사하는 방법! :: 저온성 채소 작물 추천🌱</h4>
                                <div class="post-meta mb-30">
                                    <a href="#"><i class="fa fa-clock-o" aria-hidden="true"></i> 19 Jun 2023</a>
                                    <a href="#"><i class="fa fa-user" aria-hidden="true"></i>민초파두목</a>
                                </div>
                                <p style ="margin-top:80px">외부 활동에 줄어들면서 겨울철 베란다 텃밭을 즐기는 분들이 많은 것 같은데요. 저도 올해 베란다에서 초록빛 채소밭을 만들어 봅니다.
									분양 받은 도시 텃밭에 모종을 심었던 것이 엊그제 같은데 밭을 정리해야 하는 시기가 되었어요.<br> 7개월 동안 텃밭 농장주로 땀 흘리고 수확하며 정말 행복했답니다. 
									마지막으로 배추를 수확하면서 텃밭에 남은 상추와 쑥갓 그리고 겨우 잎을 낸 겨자 모종과 당귀도 집으로 가지고 왔어요. <br>사실 너무 어린 겨자는 자랄 수 있을까 걱정이 되기도 했어요.</p>
								<br><br>
								                             
                                <div class="row mb-30">
                                    <div class="col-lg-6">
                                        <p>올해 텃밭에서 씨를 뿌려 기른 상추들입니다. 청치마와 장수 상추, 흑치마라는 이름을 가진 상추인데요. 잎이 복슬복슬한 상추가 아니라 치마처럼 펼쳐지는 상추랍니다. 
                                        <br><br>
                                        늦게 뿌린 씨앗은 발아가 순조롭지 못했어요. 겨우 자란 상추를 뽑아서 집으로 가지고 왔어요. 늦게 심어서 잎이 겨우 두 장밖에 나지 않는 청겨자와 적겨자도 데려왔어요.
                                        <br>그래서 올해는 저온성 식물을 키워보려고합니다!<br>
                                        함께 알아보러 가시죠
                                        </p>
                                </div>
                                    <div class="col-lg-6">
                                        <img src="resources/img/season/winter1.jpg" style="width:400px;height:250px">
                                    </div>
                                </div>
                                <div class="rectangle3"></div>
                               
                                <h5 style = "text-align:center">초겨울에 씨를 뿌리는</h5>
                                <h4 style = "text-align:center">저온성 채소</h4>
                                <br><br>
                                <img src="resources/img/season/winter2.jpg" style = "width:730px; margin-bottom:10px"> 
                                <p style = "font-size:12px; text-align:center;">▲ 겨울 텃밭 잎채소 발아</p>
                                <p>초겨울에 씨를 뿌려 겨울부터 봄까지 거두는 저온성 채소는 잎이 두껍고 뻣뻣하지만, 더 아삭하고 달콤한 맛이 있습니다.</p><br>
                                
                                <div class="rectangle2"></div>
                                <h5 style ="text-align :center; color:black">🌱<br><br><b>저온성 채소 작물 추천</b> 
                           			</h5><br><br>
                               
                                <p>겨울철 잎채소로는 <b>시금치, 봄동, 상추, 갓, 쑥갓, 돌산갓, 케일, 청경채</b> 같은 작물을 심으면 좋습니다.</p>
                                <img src="resources/img/season/winter3.jpg" style = "width:730px; margin-bottom:50px">        		
                                
                                <p>
									김장채소를 수확한 11월 말부터 12월 초에 종자(씨앗)을 심고 간이 보온 처리를 하면 겨울과 봄에 수확할 수 있는데, 
									잎채소는 정해진 수확 시기가 없어 촘촘히 파종해 자람에 따라 활용할 수 있습니다.
								</p>
								
							 	<div class="rectangle2"></div>
                                <h5 style ="text-align :center; color:black">🌱<br><br><b>겨울 텃밭 관리하기</b> 
                           			</h5><br><br>
                               	<div style ="display:flex">
									<img src="resources/img/season/winter4.jpg" style = "width:360px; margin-right:5px; margin-bottom:50px">        		
									<img src="resources/img/season/winter5.jpg" style = "width:360px; margin-bottom:50px">
								</div>
								<p style = "font-size:12px; text-align:center;">▲ 비닐 이용 막덮기 / 볏짚 이엉 덮기</p>
								<p>겨울 텃밭은 잡초나 곤충 발생이 적어 관리하기 어렵지 않습니다. 부직포나 비닐로 간단히 덮어주면 서리나 냉해 피해 없이 키울 수 있습니다.</p>
                                <br><br>
                                <p style = "font-size:15px; color:black">
                                <b>❄겨울 텃밭을 위한 간이 보온 방법❄<br></b>
									 - 막 덮기 : 부직포, 한량사, 네트 등을 작물 위에 직접 덮어줌<br>
									 - 미니 비닐하우스 : 터널형, 평판형 비닐하우스를 직접 또는 이동형으로 제작 설치<br>
									 - 식물 부산물 덮기 : 볏짚이엉, 볏짚, 왕겨, 우드칩 등으로 덮어줌<br>
									 - 완성품 농자재 구입 : 보온 뚜껑이 시판되고 있음<br>
                                </p>
                                
                             	<br>
                             	<h4 style ="text-align:center; margin-top:100px;">🌱</h4>
                                <div class="rectangle1"></div>
                                <h5 style ="text-align:center; color:black">안전한 겨울 텃밭 가꾸기<br><br>
									1. 물 빠지는 길(배수로) 점검</h5>
                                <img src="resources/img/season/winter6.jpg" style = "width:730px; margin-top :50px;margin-bottom:20px">
                                <p>씨부림 전에 눈이나 비 피해가 없도록 물 빠지는 길을 점검합니다. 이랑의 두둑 높이는 20~30cm, 물 빠짐이 좋은 땅의 너비는 120~150cm,
                                 물 빠짐이 좋지 않은 땅은 60~90cm로 합니다.
                                </p>
                                <div class="rectangle"  style = "margin-top:70px"></div>
                                <h5 style ="text-align:center; color:black">2. 웃거름은 싹튼 후, 물주기는 파종 전</h5
									>
									
								<img src="resources/img/season/winter7.jpg" style = "width:730px; margin-top :50px;margin-bottom:20px">
								
								
                                <p>웃거름은 싹튼 후 재배 기간과 생육 상황에 따라 포기 사이에 흙을 파서 1~2회 줍니다. 
									잎채소는 종자 발아와 초기에 자라면서 많은 수분이 필요하므로 파종 전 두둑에 물을 충분히 주면 좋습니다.<br><br>
									또한 *습해에 약하므로 물이 잘 빠지도록 관리하는 것이 중요합니다.</p>
                                
                                   <div class="rectangle"  style = "margin-top:70px"></div>
                                <h5 style ="text-align:center; color:black">3. 낮에는 열고, 밤에는 닫고</h5
									>
									
								<img src="resources/img/season/winter8.jpg" style = "width:730px; margin-top :50px;margin-bottom:20px">
								
								
                                <p>날이 따뜻하면 부직포와 비닐을 열어 두고 밤에만 닫아주면 좋은데요. 낮과 밤 기온 차로 습한 상태가 계속되며 저온다습성 곰팡이병이 생길 수 있으므로 낮에는 일부 구간을 열어두면 도움이 됩니다.
                                </p>
                                
                                <div class="rectangle2"></div>
                                <p style ="text-align:center">❄️<br><br>추운 겨울에도 텃밭을 가꿀 수 있단 사실!<br>
 								잊지 마시고 사계절 내내 즐거운 텃밭 활동해보시길 바랍니다~ ^_^</p>
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
			      description: "겨울 텃밭 가꾸는법", // 보여질 설명
			      imageUrl:"https://ifh.cc/g/F5X0pk.jpg", // 콘텐츠 URL
			      link: {
			         mobileWebUrl: "http://localhost:8888/tinyfarm/winter.re",
			         webUrl: "http://localhost:8888/tinyfarm/winter.re"
			        }
			  	  },
			      social: {
			        commentCount:123,  
			        sharedCount: 54  
			    }
			  });
			}
	</script>
	
	<script>
		function shareTwitter() {
		    var sendText = "작은농장"; // 전달할 텍스트
		    var sendUrl = "http://localhost:8888/tinyfarm/winter.re"; // 전달할 URL
		    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
		}
	</script>
	
	<script>
		function shareLink(){
			   var url = '';
			   var textarea = document.createElement("textarea");
			   document.body.appendChild(textarea);
			   url = 'http://localhost:8888/tinyfarm/winter.re';
			   textarea.value = url;
			   textarea.select();
			   document.execCommand("copy");
			   document.body.removeChild(textarea);
			   alert("링크가 복사되었습니다")
			};
	</script>
</body>

</html>