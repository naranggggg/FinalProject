<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
	<meta content="no-cache" http-equiv="pragma">
		<title>작은농장</title> <!-- 공통 CSS, JS 선언 -->
		<link href="http://api.nongsaro.go.kr/css/api.css" rel="stylesheet"
			type="text/css">
			<script type="text/javascript"
				src="http://api.nongsaro.go.kr/js/framework.js"></script>
			<script type="text/javascript"
				src="http://api.nongsaro.go.kr/js/openapi_nongsaro.js"></script>

			<script type="text/javascript">
				nongsaroOpenApiRequest.apiKey = "20231128X1WSAIQZP2TJCHTY1JMFA";//Api Key  - 발급받은 인증키로변경
				nongsaroOpenApiRequest.serviceName = "cateGardenMake";//서비스명
				nongsaroOpenApiRequest.operationName = "cateGardenMakeCodeLst";//오퍼레이션명 - nongsaroApiLoadingArea 영역에 로딩할 오퍼레이션
				nongsaroOpenApiRequest.htmlArea = "nongsaroApiLoadingArea";//첫번째로 HTML을 로딩할영역

				//크로스 도메인 처리를 위한 콜백페이지 - 샘플소스에 있는 콜백페이지를 서버에 올리고 올린 경로로 수정
				//서버 환경에 맞는 언어로 주석 해지 후 적용 사용
				nongsaroOpenApiRequest.callback = "ajax_local_callback.jsp";
			</script>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>실내정원 만들기</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="${contextPath}/makeInGarden.pp">실내정원 만들기</a></li>
						
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 100%; margin-top: 50px;">
		<div id="nongsaroApiLoadingArea"
			style="width: 1200px; margin: 0 auto;"></div>
		<!-- 실내정원 만들기 코드 HTML 로딩 영역 -->
		<div id="nongsaroApiLoadingAreaResult"
			style="width: 1200px; margin: 0 auto;"></div>
		<!-- 실내정원 만들기 HTML 로딩 영역 -->

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>