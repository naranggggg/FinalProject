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

 	<% String contextPath = request.getContextPath(); %>
	<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<!-- Title -->
	<title>작은농장</title>
	
	<!-- Favicon -->
	<link rel="icon" href="${contextPath }/resources/img/core-img/favicon.ico">
	
	<!-- Core Stylesheet -->
	<link rel="stylesheet" href="<%= contextPath %>/resources/style.css">
<style>
.footer-area::after {
	background-color: rgba(4, 43, 15, 0.416);
	position: absolute;
	z-index: -1;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	content: "";
}

  .link-icon {
	position: relative;
	display: inline-block;
	width: auto;
	font-size: 14px;
	font-weight: 500;
	color: #333;
	margin-right: 10px;
	padding-right: 40px;
	padding-top: 40px;
	
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
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="img/core-img/leaf.png" alt="">
        </div>
    </div>

    <%@include file="/WEB-INF/views/common/header.jsp" %>

    <!-- ##### Breadcrumb Area Start ##### -->
   <div class="breadcrumb-area">
			<!-- Top Breadcrumb Area -->
			<div
				class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
				style="background-image: url(resources/img/book/bookmain.jpg);">
				<h2>이달의 도서 추천</h2>
			</div>
	
			<div class="container">
				<div class="row">
					<div class="col-12">
						<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">이달의 도서 등록</a></li>
							
						</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50">
        <div class="produts-details--content mb-50">
            <div class="container">
                <div class="row justify-content-between">

                    <div class="col-12 col-md-6 col-lg-5">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="${book.bookChangeName}" alt="1">
                                    </div>
                                  
                                </div>
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="single_product_desc">
                            <h4 class="title">${book.bookTitle}</h4>
                            <h4 class="price">${book.bookPrice}원</h4>
                            <div style = "display: flex">
	                            <h6 style = "margin-right:10px">저자</h6>
	                            <h6 style = "margin-right: 20px">${book.bookAuthor}</h6>
	                            <h6 style = "margin-right:20px">|</h6>
	                            <h6 style = "margin-right: 20px">${book.publisher}</h6>
	                          	<h6>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;도서 > ${book.bookCategory}</h6>
	                         </div>
							 
							 <h6 style = "margin-right:20px">출판일&nbsp;&nbsp;&nbsp;&nbsp;${book.bookDate}</h6>

                            
                            <div class="products--meta">
                                <p>
                                	${book.bookInfo}
                                </p>
                                
                            </div>
                        </div>
	            	</div>
                </div>
                <div class="text-center my-5">
                	<c:if test="${loginUser.userId == 'admin'}">
						<button type="button" class="btn alazea-btn" onclick="location.href='bookUpdate.re?bookNo=${book.bookNo}'">수정</button>
					</c:if>
					<button type="button" class="btn alazea-btn-orange" onclick="location.href='bookMain.re'">목록</button>
				</div>
                <div style="text-align: right; margin-top:-90px">
                	<p style = "padding-right:90px"><span>Share on</span></p>
                 	<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();"></a>
		 		 	<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"></a>
		  	     	<a id="btnlink" class="link-icon link" href="javascript:shareLink();"></a>	
            	</div>
            </div>
        </div>
		  
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- ##### Single Product Details Area End ##### -->
    <!-- ##### Blog Content Area End ##### -->
	
    
	<script>
			function shareKakao() {
				  // 사용할 앱의 JavaScript 키 설정
				  Kakao.init('aef906bc476f983341072fc51f3c5b36');
		
				  var currentBookNo = '<%= request.getParameter("bookNo") %>';
				  // 카카오링크 버튼 생성
				  Kakao.Link.createDefaultButton({
				    container: '#btnKakao', // 카카오공유버튼ID
				    objectType: 'feed',
				    content: {
				      title: "작은농장", // 보여질 제목
				      description: "작은농장 도서추천", // 보여질 설명
				      imageUrl:"https://ifh.cc/g/yoKVMG.jpg", // 콘텐츠 URL
				      link: {
				         mobileWebUrl: 'http://localhost:8888/tinyfarm/bookDetail.re?bookNo=' + currentBookNo,
				         webUrl: 'http://localhost:8888/tinyfarm/bookDetail.re?bookNo=' + currentBookNo
				        }
				  	  },
				      social: {
				        commentCount: 51,  
				        sharedCount: 223  
				    }
				  });
				}
		</script>
		
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		
		
		<script>
				var currentBookNo = '<%= request.getParameter("bookNo") %>';
				
				function shareTwitter() {
				    var sendText = "작은농장"; // 전달할 텍스트
				    var sendUrl = 'http://localhost:8888/tinyfarm/bookDetail.re?bookNo=' + currentBookNo; // 전달할 URL
				    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
				}
			</script>
			
			
			
		<script>
			function shareLink(){
				var currentBookNo = '<%= request.getParameter("bookNo") %>';
				
				var url = 'http://localhost:8888/tinyfarm/bookDetail.re?bookNo=' + currentBookNo;
				
				var textarea = document.createElement("textarea");
				document.body.appendChild(textarea);
				textarea.value = url;
				textarea.select();
				document.execCommand("copy");
				document.body.removeChild(textarea);
				
				alert("링크가 복사되었습니다");
			};
		</script>
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