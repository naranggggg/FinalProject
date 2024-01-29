<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>간단한 날씨 앱</h1>
    
    
    <button onclick="getLocation()">날씨 확인하기</button>
    <div id="weather-container">
        <h2 id="city-name"></h2>
        <p id="current-weather"></p>
        <p id="forecast"></p>
    <div>
  
    <script>
        const API_KEY = "68a1c5134ecb8af7452e8cd0b8c4af85";
        const weatherContainer = document.getElementById("weather-container");
        const cityName = document.getElementById("city-name");
        const currentWeatherElement = document.getElementById("current-weather");
        const forecastElement = document.getElementById("forecast");

        function getLocation() {
            navigator.geolocation.getCurrentPosition((position) => {
                getWeather(position.coords.latitude, position.coords.longitude);
            }, (error) => {
                alert("위치 정보를 가져올 수 없습니다. 브라우저의 위치 서비스를 확인해 주세요.");
            });
        }

        async function getWeather(lat, lon) {
        	const response = await fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`);
            const weatherData = await response.json();

            const forecastResponse = await fetch(`https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`);
            const forecastData = await forecastResponse.json();

            displayWeather(weatherData, forecastData);
        }

        function displayWeather(weatherData, forecastData) {
            cityName.innerText = weatherData.name;
            currentWeatherElement.innerText = "현재 날씨: ${weatherData.weather[-1].description}, 온도: ${weatherData.main.temp} ℃";

//             let forecastString = "일주일 날씨 예보:";
//             forecastData.list.slice(0, 7).forEach(day => {
//                 forecastString += ` ${day.dt_txt.split(" ")[0]} - ${day.weather[0].description}, 온도: ${day.main.temp} ℃;`;
//             });
            forecastElement.innerText = forecastString;

//             weatherContainer.style.display = "block";
        }
    </script>
    
    
    
    
    
		
		
		
		
		function todayWeatherInfo(weatherInfo){
		
				
				console.log("현재날씨", weatherInfo);

				
				//하늘상태
				//- 하늘상태(SKY) 코드 : 맑음(1), 구름많음(3), 흐림(4)
				switch (item.SKY) {
				case 1:
					item.SKY = '맑음'; break;
				case 3:
					item.SKY = '구름많음';	break;
				case 4:
					item.SKY = '흐림'; break;
				default:
					break;
				}

				//강수형태
 				//- 강수형태(PTY) 코드 : (단기) 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4)
				let imgSrc = "<img src='${pageContext.request.contextPath}/resources/img/weather/";
				
				switch (item.PTY) {
				case "0":
					item.PTY = imgSrc + "Sun.png'>";
					break;
				case "1":
					item.PTY = imgSrc + "Rain_Medium.png'>";
					break;
				case "2":
					item.PTY = imgSrc + "WinteryMix.png'>";
					break;
				case "3":
					item.PTY = imgSrc + "Snow_2.png'>";
					break;
				case "4":
					item.PTY = imgSrc + "Rain_Light_Sun.png'>";
					break;
				default:
					break;
				}
				
				
				nowWeatherCondition += 
					
					"<div class='p-4 d-flex flex-column justify-content-center align-items-center'>" +
					"<div><span>"+ (item.fcstTime).substr(0,2) + ":" + (item.fcstTime).substr(-2) + "</span></div>" +
						"<div class='mb-15 mt-15'>" + item.PTY + "</div>" + 
					"<div><span>" + item.TMP + "&deg;</span></div>" +
					"<div><span>강수 " + item.POP + "%</span></div>" +
					"<div><span>습도 " + item.REH + "%</span></div>" +
					"</div>";
						

			
		}
		
		
		
		
		//조회 함수
		function makePerHourForcast(fcstPerHours){
			
			
			console.log("오늘날쒸",fcstPerHours);
			
			let perHours = '';
			
			/*				
				POP: 강수확률
				PTY: 강수형태
				PCP: 1시간 강수량
				REH: 습도
				SKY: 하늘상태
				TMP: 온도
			*/		
			
			fcstPerHours.forEach((item) => {
				
				//하늘상태
				//- 하늘상태(SKY) 코드 : 맑음(1), 구름많음(3), 흐림(4)
				switch (item.SKY) {
				case 1:
					item.SKY = '맑음'; break;
				case 3:
					item.SKY = '구름많음';	break;
				case 4:
					item.SKY = '흐림'; break;
				default:
					break;
				}


				//강수형태
 				//- 강수형태(PTY) 코드 : (단기) 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4)
				let imgSrc = "<img src='${pageContext.request.contextPath}/resources/img/weather/";
				
				switch (item.PTY) {
				case "0":
					item.PTY = imgSrc + "Sun.png'>";
					break;
				case "1":
					item.PTY = imgSrc + "Rain_Medium.png'>";
					break;
				case "2":
					item.PTY = imgSrc + "WinteryMix.png'>";
					break;
				case "3":
					item.PTY = imgSrc + "Snow_2.png'>";
					break;
				case "4":
					item.PTY = imgSrc + "Rain_Light_Sun.png'>";
					break;
				default:
					break;
				}
				
				console.log("PTY", item.PTY);
				
				
				perHours += 
					
					"<div class='p-4 d-flex flex-column justify-content-center align-items-center'>" +
					"<div><span>"+ (item.fcstTime).substr(0,2) + ":" + (item.fcstTime).substr(-2) + "</span></div>" +
						"<div class='mb-15 mt-15'>" + item.PTY + "</div>" + 
					"<div><span>" + item.TMP + "&deg;</span></div>" +
					"<div><span>강수 " + item.POP + "%</span></div>" +
					"<div><span>습도 " + item.REH + "%</span></div>" +
					"</div>";
						
			});
			
			$("#todayWeatherInfoArea").html(perHours);
			
		}
</body>
</html>
</html>