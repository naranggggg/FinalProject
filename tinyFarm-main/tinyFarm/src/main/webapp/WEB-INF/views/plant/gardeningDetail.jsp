<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작은농장</title>
	<style>
		#single_main{
			width: 800px;
			margin:0 auto;
		}
		.page-heading__subtitle>p,#categoryTitle{
			color: rgba(0,0,0,0.4);
		}
		#single_main{
			padding:30px;
		}
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>텃밭 가꾸기</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="${contextPath}/gardeningList.pp?category=${category}">텃밭 가꾸기</a></li>
						<li class="breadcrumb-item active"><a href="#">상세정보</a></li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="outer">
		<div id="single_main">
			<div
				class="mnmd-block mnmd-block--contiguous page-heading page-heading--has-background pb-4 pt-4 mb-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12" role="main">
							<h2 class="page-heading__title"><b id="categoryTitle">[${category}]</b>&nbsp;&nbsp;<b>${gd.cntntsSj}</b></h2>
							
							<div class="page-heading__subtitle">
								<p class="float-left">
									<small>${gd.svcDtx}
									</small>
									<small>&nbsp;|&nbsp;${gd.updusrEsntlNm}</small><small>&nbsp;|&nbsp;조회수 : ${gd.cntntsRdcnt}</small>
								</p>
								
							</div>
						</div>
						<div class="col-md-12"></div>
					</div>
				</div>
			</div>
			<div class="container mb-4">
				<div class="row">
					<div class="col-md-12" role="main">
						<div id="board_content">
							${gd.cn}
						</div>
	
					</div>
				</div>
			</div>
			
		</div>
	</div>
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

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>