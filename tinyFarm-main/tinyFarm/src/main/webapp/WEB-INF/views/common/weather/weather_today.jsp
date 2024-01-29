<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 날씨</title>

<!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/core-img/favicon.ico">
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap" rel="stylesheet">
	
	<!-- 카카오 API 주소 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ea39e9641be78109122ae5eab0b0065f&libraries=services"></script>
	
<style type="text/css">

body {
  background: #fff;
  color: #444;
  font-family: "Noto-sans", sans-serif;
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
  width: 630px;
  padding: 15px 30px;
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
/* 	width: 120px; */
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
/*   width: 25px; */
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
		<div class="mb-30 text-center"><h3>🌱 오늘의 날씨</h3></div>
		
<!-- 		<div class="d-flex flex-row justify-content-center align-items-center"> -->
			<div class="weather__card mx-auto" > <!-- style="background-image: url( '${pageContext.request.contextPath}/resources/img/bg-img/sky.jpg' );">  -->
				<div class="text-right">
					<span id="updateWeatherHour" class="text-left"></span>&nbsp;&nbsp;
					<a href="#" onclick="alert('현재 위치 및 시각을 기반으로 새로운 날씨 정보를 불러옵니다.'); getUserLocation()">
						<i class="fa fa-refresh fa-lg" aria-hidden="true"></i>
					</a>
				</div>
				<div class="d-flex flex-row justify-content-center align-items-center" id="todayWeather">
					<div class="p-3 text-center">
						<h2><span id="todayT1H"></span>&deg;</h2>
<!-- 						<div>최고 <span id="mxTemp"></span>&deg; / 최저 <span id="minTemp"></span>&deg;</div> -->
					</div>
					<div class="p-3" id="todayWeatherImg"></div>
				</div>
				<div class="p-3 text-center">
					<h5 class="mt-20 mb-20" id="todayYYYYMMDD"><!-- 오늘 날짜 --></h5>
					<h4 id="showAddress">-</h4>
					<span class="weather__description" id="todaySKY"></span>
					<span class="weather__description" id="todayPTY"></span>
				</div>
				<div class="weather__status d-flex flex-row justify-content-center align-items-center mt-3">
					<div class="p-4 d-flex justify-content-center align-items-center">
						<img src="${pageContext.request.contextPath}/resources/img/weather/RainyPercent.png">&nbsp; 습도 <span id="todayREH"></span>&nbsp;%
					</div>
					<div class="p-4 d-flex justify-content-center align-items-center">
						<img src="${pageContext.request.contextPath}/resources/img/weather/WindPercent.png">&nbsp; 풍속 <span id="todayWSD"></span>&nbsp;m/s
					</div>
				</div>
			</div>
<!-- 		</div> -->
		
		
		<!-- Weather Forecast -->
<!-- 		<div class="weather__forecast d-flex flex-row justify-content-center align-items-center mt-3" id="todayWeatherInfoArea"></div> -->
		<div class="weather__forecast d-flex flex-row justify-content-center align-items-center mt-30" id="todayWeatherInfoArea"></div>
		
	</div>
	
	
	
	<script type="text/javascript">
		
		$(function(){
			
	       	getUserLocation();
			
		})
		
		
		
		//위치 정보
		function success({ coords, timestamp }) {
            const latitude = coords.latitude;   		// 위도
            const longitude = coords.longitude; 		// 경도
            
            //날씨 가져오기
            todayWeather(latitude, longitude)
            
            //주소 가져오기
            geoLocation(latitude, longitude)
            
        }
		
        function getUserLocation() {
            if (!navigator.geolocation) {
                throw "위치 정보가 지원되지 않습니다.";
            }
            navigator.geolocation.getCurrentPosition(success)
        }

        
        
        //좌표로 주소 변환
		function geoLocation(latitude, longitude){
			
			$.ajax({
				url : 'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=' + longitude +'&y=' + latitude,
			    type : 'GET',
			    headers : {
			      'Authorization' : 'KakaoAK 29b1a05d9503b3e33fd9c96f9d5b751c'		//'KakaoAK {REST API KEY}
			    },
			    success : function(data) {
			    	
					let address = data.documents[0].address;
					$("#showAddress").text(address.region_1depth_name + " " + address.region_2depth_name + " " + address.region_3depth_name);
				
			    },
			    error : function(e) {
			      console.log("error", e);
			    }
			  });
			
			
		}
        
        
		//오늘의 날씨 조회하기
		function todayWeather(latitude, longitude){

			var date = new Date();
			
			//어제 날짜	//20231219
			let lastDayBaseDate = date.getFullYear() + ("0" + (date.getMonth() + 1)).substr(-2) + ("0" + (date.getDate() - 1)).substr(-2);	
			
			//오늘 날짜	//20231220
			let todayBaseDate  = date.getFullYear() + ("0" + (date.getMonth() + 1)).substr(-2) + ("0" + (date.getDate())).substr(-2);	//20231219
						
			
			let hours = ("0" + date.getHours()).substr(-2);							//현재시			ex. 15
			
			let baseTime = hours + "00";											//현재시 + "00"	ex)1500

			let hoursMinusOneHour = ("0" + (date.getHours()-1)).substr(-2) + "00";		//한시간 전		ex. 1400
			
			
			if(hours == '00'){
				baseTime = "2300";
			}
			
			$("#todayYYYYMMDD").text(date.getFullYear() + "년 " + (date.getMonth()+1) + "월 " + date.getDate() + "일");

			
			$.ajax({
				url: "showTodayWeather.wv",
				data: {
					baseDate : todayBaseDate,
					baseTime : hoursMinusOneHour,				//초단기예보용
					latitude : latitude,
					longitude : longitude
				},
				success: function(result){
					
					let items = result.response.body.items.item;	//JSON item 변수
					
					let perTime = [];
					
					//현재시간별
					let todayTimeFilter = items.filter(function(item){
						perTime.push(item.fcstTime);
						return item.fcstTime == baseTime;
					});
					
					//배열 중복제거
					let uniquePerTime = [...new Set(perTime)];

										
					var weatherList = [];
					
					for (var i in uniquePerTime) {

					    let time5Filter = items.filter(function (item) {
					        return item.fcstTime == uniquePerTime[i];
					    })
					    
					    // 날씨별 객체 생성하기
					    let obj = {};
					    obj.fcstTime = uniquePerTime[i];
					    

					    for (var k in time5Filter) {
					    	
					    	if(time5Filter[k].category == "T1H"){	//기온
					    		obj.T1H = time5Filter[k].fcstValue;
					    	}if(time5Filter[k].category == "REH"){	//습도
					    		obj.REH = time5Filter[k].fcstValue;
					    	}if(time5Filter[k].category == "WSD"){	//풍속
					    		obj.WSD = time5Filter[k].fcstValue;
					    	}if(time5Filter[k].category == "SKY"){	//하늘상태
					    		obj.SKY = time5Filter[k].fcstValue;
					    	}if(time5Filter[k].category == "PTY"){	//강수형태
					    		obj.PTY = time5Filter[k].fcstValue;
					    	}
					    }

					    weatherList.push(obj);
					}
					
					makePerHourForcast(weatherList, date);

				},
				error: function(){
					alert('날씨 정보를 불러오지 못하였습니다.');
				}
			})
			
		}
		
		
		// 초단기예보(5시간) 조회하기
		function makePerHourForcast(weatherList, date) {
			
		    let perHours = '';
		
		    weatherList.forEach((item) => {
		    	
		        // 강수형태
		        let imgSrc = "<img src='${pageContext.request.contextPath}/resources/img/weather/";
		    	
		    	switch (item.SKY) {
					case "1":
						item.SKY = '맑음'; break;
					case "3":
						item.SKY = '구름많음'; break;
					case "4":
						item.SKY = '흐림'; break;
					default: break;
				}
				
				//맑음
				if(item.SKY == '맑음'){
					
	            	if(Number(item.fcstTime) > 600 && Number(item.fcstTime) < 1800){
		                item.WeatherImg = imgSrc + "Sun.png'>";
	            	}else{
		                item.WeatherImg = imgSrc + "Moon.png'>";
	            	}
	            	
				//구름많음	
				}else if(item.SKY == '구름많음'){

	        		if(Number(item.fcstTime) > 600 && Number(item.fcstTime) < 1800){
	            		item.WeatherImg = imgSrc + "Cloud_Sun.png'>";
	            	}else{
	            		item.WeatherImg = imgSrc + "Cloud_Moon.png'>";
	            	}
	        	//흐림
	        	}else{
	        		item.WeatherImg = imgSrc + "Cloud.png'>";
	        	}
				
				
		    	//- 강수형태(PTY) 코드 : (초단기) 없음(0), 비(1), 비/눈(2), 눈(3), 빗방울(5), 빗방울눈날림(6), 눈날림(7)
		        switch (item.PTY) {
		            case "0":
		                item.PTY = '강수없음';
		                break;
		            case "1":
		                item.WeatherImg = imgSrc + "Rain_Medium.png'>";
		                item.PTY = '비';
		                break;
		            case "2":
		                item.WeatherImg = imgSrc + "WinteryMix.png'>";
		                item.PTY = '비 또는 눈';
		                break;
		            case "3":
		                item.WeatherImg = imgSrc + "Snow_1.png'>";
		                item.PTY = '눈';
		                break;
		            case "5":
		            	
		            	if(Number(item.fcstTime) > 600 && Number(item.fcstTime) < 1800){
		        			item.WeatherImg = imgSrc + "Rain_Light_Sun.png'>";
		            	}else{
		            		item.WeatherImg = imgSrc + "Rain_Light_Moon.png'>";
		            	}
		            	
		                item.PTY = '빗방울';
		                break;
		            case "6":
		                item.WeatherImg = imgSrc + "WinteryMix.png'>";
		                item.PTY = '빗방울눈날림';
		                break;
		            case "7":
		                item.WeatherImg = imgSrc + "Snow_1.png'>";
		                item.PTY = '눈날림';
		                break;
		            default:
		                break;
		        }
		        
		        

		        	
		        perHours +=
		            "<div class='p-1 d-flex flex-column justify-content-center align-items-center'>" +
		            "<div><span class='weather__description'>" + (item.fcstTime).substr(0, 2) + ":" + (item.fcstTime).substr(-2) + " 예상" + "</span></div>" +
		            "<div class='mb-15 mt-15'>" + item.WeatherImg + "</div>" +
		            "<div><span>" + item.T1H + "&deg;</span></div>" +
		            "<div><span>💧 " + item.REH + "%</span></div>" +
		            "</div>";
				
		    });
		
		    
	        //현재날씨 넣기
// 	        updateWeatherHour
			$("#todayT1H").text(weatherList[0].T1H);
			$("#todaySKY").text(weatherList[0].SKY);
			$("#todayPTY").text(weatherList[0].PTY);
			$("#todayWeatherImg").html(weatherList[0].WeatherImg);				
			$("#todayWSD").text(weatherList[0].WSD);
			$("#todayREH").text(weatherList[0].REH);
			
			$("#updateWeatherHour").text((weatherList[0].fcstTime).substr(0,2) + ":00 기준");
		    $("#todayWeatherInfoArea").html(perHours);
		    
		    
		    
		    //초록예보~
		   	todayGreenCast(weatherList[0].T1H, weatherList[0].REH);

			
		}

	
	</script>






	<!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/resources/js/active.js"></script>
    
    
</body>
</html>