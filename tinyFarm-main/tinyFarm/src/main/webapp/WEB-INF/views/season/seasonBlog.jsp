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
		
		@font-face {
		    font-family: 'IBMPlexSansKR-Regular';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
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
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/50.jpg);">
            <h2>계절별 텃밭 가꾸는 법</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">계절별 텃밭 가꾸는 법</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

	<h3 style = "text-align:center; font-family:LotteMartDream;">어떤 계절이 궁금하시나요?</h3>
	<br>
    <!-- ##### Blog Area Start ##### -->
<!--     <div style = "align : center"> -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-10 mx-auto">
                    <div class="row">
                        <!-- Single Blog Post Area -->
			            <div class="col-12 col-sm-6 single_portfolio_item design home-design">
				        <!-- Portfolio Thumbnail -->
				        <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/blossom.jpg); height:350px" href="spring.re"></div>
				        <!-- Portfolio Hover Text -->
				        	<div class="portfolio-hover-overlay">
				            	<a href="spring.re" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 1" style="width:520px">
				                	<div class="port-hover-text">
				                    	<h3>SPRING</h3>
				                    	<h5 >봄</h5>
				                    </div>
				                    </a>
				            	</div>
							</div>
 						
 						<div class="col-12 col-sm-6 single_portfolio_item design home-design">
				        <!-- Portfolio Thumbnail -->
				        <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/oak.jpg); height:350px"></div>
				        <!-- Portfolio Hover Text -->
				        	<div class="portfolio-hover-overlay">
				            	<a href="summer.re" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 1" style="width:520px">
				                	<div class="port-hover-text">
				                    	<h3>SUMMER</h3>
				                        <h5>여름</h5>
				                    </div>
				                    </a>
				            	</div>
							</div>			                 
			                    
 						<div class="col-12 col-sm-6 single_portfolio_item design home-design">
				        <!-- Portfolio Thumbnail -->
				        <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/fall.jpg); height:350px;"></div>
				        <!-- Portfolio Hover Text -->
				        	<div class="portfolio-hover-overlay">
				            	<a href="fall.re" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 1" style="width:520px">
				                	<div class="port-hover-text">
				                    	<h3>FALL</h3>
				                        <h5>가을</h5>
				                    </div>
				                    </a>
				            	</div>
							</div>		                
						
						 <div class="col-12 col-sm-6 single_portfolio_item design home-design">
				        <!-- Portfolio Thumbnail -->
				        <div class="portfolio-thumbnail bg-img" style="background-image: url(resources/img/bg-img/winter.jpg); height:350px"></div>
				        <!-- Portfolio Hover Text -->
				        	<div class="portfolio-hover-overlay">
				            	<a href="winter.re" class="portfolio-img d-flex align-items-center justify-content-center" title="Portfolio 1" style="width:520px">
				                	<div class="port-hover-text">
				                    	<h3>WINTER</h3>
				                        <h5>겨울</h5>
				                    </div>
				                    </a>
				            	</div>
							</div>			                    
		                </div>
		                </div>
		            </div>
		        </div>
		    </section>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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
</body>

</html>