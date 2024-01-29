<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Favicon -->
    <link rel="icon" href="resources/img/core-img/favicon.ico">
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap" rel="stylesheet">

<style type="text/css">

body {
  background: #fff;
  color: #444;
  font-family: "Noto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
h1, h2, h3, h4, h5, h6 {
  margin: 0 0 15px 0;
  padding: 0;
  font-family: "Segoe UI", sans-serif;
  font-weight:700;
}
/*--------------------------------------------------------------
# Weather Card
--------------------------------------------------------------*/
.weather__card {
  width: 800px;
  padding: 40px 30px;
  background-color: #EEEEEE;
  border-radius: 20px;
  color:#3C4048;
}
.weather__card h2 {
  font-size:120px;
  font-weight:700;
  color:#3C4048;
  line-height: .8;
}
.weather__card h3 {
  font-size: 40px;
  font-weight: 600;
  line-height: .8;
  color:#3C4048;
}
.weather__card h5 {
  font-size: 20px;
  font-weight: 400;
  line-height: .1;
  color:#9D9D9D;
}
.weather__card img {
  width: 120px;
  height: 120px;
}
.weather__card .weather__description {
  background-color: #fff;
  border-radius: 25px;
  padding: 5px 13px;
  border:0;
  outline: none;
  color:#7F8487;
  font-size: .956rem;
  font-weight: 400;
}
/*--------------------------------------------------------------
# Weather Status
--------------------------------------------------------------*/
.weather__status img {
  height: 20px;
  width: 20px;
  vertical-align:middle;
}
.weather__status span {
  font-weight: 500;
  color: #3C4048;
  font-size: .9rem;
  padding-left: .5rem;
}
/*--------------------------------------------------------------
# Weather Forecast
--------------------------------------------------------------*/
.weather__forecast img {
  height: 25px;
  width: 25px;
  vertical-align:middle;
}
.weather__forecast span {
  font-weight: 500;
  color: #3C4048;
  font-size: 1rem;
  padding: 5px 10px;
}

</style>

</head>
<body>
	<!-- Weather -->
	<div class="container mt-5">
		<div class="d-flex flex-row justify-content-center align-items-center">
			<div class="weather__card" > <!-- style="background-image: url( '${pageContext.request.contextPath}/resources/img/bg-img/sky.jpg' );">  -->
				<div class="d-flex flex-row justify-content-center align-items-center">
					<div class="p-3">
						<h2>15&deg;</h2>
					</div>
					<div class="p-3">
						<!-- 임시 img -->
						<img src="${pageContext.request.contextPath}/resources/img/weather/Sun.png">
					</div>
					<div class="p-3">
						<h5>Tuesday, 10 AM</h5>
						<h3>San Francisco</h3>
						<span class="weather__description">Mostly Cloudy</span>
					</div>
				</div>
				<div
					class="weather__status d-flex flex-row justify-content-center align-items-center mt-3">
					<div class="p-4 d-flex justify-content-center align-items-center">
						<img src="https://svgur.com/i/oHw.svg"> <span>10%</span>
					</div>
					<div class="p-4 d-flex justify-content-center align-items-center">
						<img src="https://svgur.com/i/oH_.svg"> <span>0.53 mB</span>
					</div>
					<div class="p-4 d-flex justify-content-center align-items-center">
						<img src="https://svgur.com/i/oKS.svg"> <span>10 km/h</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Weather Forecast -->
	<div
		class="weather__forecast d-flex flex-row justify-content-center align-items-center mt-3">
		<div
			class="p-4 d-flex flex-column justify-content-center align-items-center">
			<span>Wed</span> <img src="${pageContext.request.contextPath}/resources/img/weather/Fog.png"> <span>15&deg; / 15&deg;</span>
		</div>

		<div
			class="p-4 d-flex flex-column justify-content-center align-items-center">
			<span>Thu</span> <img src="${pageContext.request.contextPath}/resources/img/weather/Thunder_Moon.png"> <span>15&deg; / 15&deg;</span>
		</div>

		<div
			class="p-4 d-flex flex-column justify-content-center align-items-center">
			<span>Wed</span> <img src="${pageContext.request.contextPath}/resources/img/weather/Sun.png"> <span>15&deg; / 15&deg;</span>
		</div>

		<div
			class="p-4 d-flex flex-column justify-content-center align-items-center">
			<span>Fri</span> <img src="${pageContext.request.contextPath}/resources/img/weather/Sun.png"> <span>15&deg; / 15&deg;</span>
		</div>

		<div
			class="p-4 d-flex flex-column justify-content-center align-items-center">
			<span>Sat</span> <img src="${pageContext.request.contextPath}/resources/img/weather/Thunder_Moon.png"> <span>15&deg; / 15&deg;</span>
		</div>

		<div
			class="p-4 d-flex flex-column justify-content-center align-items-center">
			<span>Sun</span> <img src="${pageContext.request.contextPath}/resources/img/weather/Snow_1.png"> <span>15&deg; / 15&deg;</span>
		</div>

		<div
			class="p-4 d-flex flex-column justify-content-center align-items-center">
			<span>Mon</span> <img src="${pageContext.request.contextPath}/resources/img/weather/Thunder_Moon.png"> <span>15&deg; / 15&deg;</span>
		</div>

		<div
			class="p-4 d-flex flex-column justify-content-center align-items-center">
			<span>Tue</span> <img src="${pageContext.request.contextPath}/resources/img/weather/Snow_1.png"> <span>15&deg; / 15&deg;</span>
		</div>
	</div>


	<!-- 출처 -->
	<div class="mt-5 d-flex justify-content-center align-items-center">
		Made with ♡ by <a href="https://twitter.com/leutrimdemirii">Leutrim</a>
	</div>
	
	
	
	
	<!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${contextPath }/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${contextPath }/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${contextPath }/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${contextPath }/resources/js/active.js"></script>
</body>
</html>