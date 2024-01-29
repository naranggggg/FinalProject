package com.kh.tinyfarm.weather.controller;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tinyfarm.weather.model.vo.GpsTransfer;


@Controller
public class WeatherController {
	
	
	public static final String SERVICEKEY = "69L52kVDgnIQoRCnUAOTqOVOrVQCm7q%2FgxzjlEheVxS7VMVjjdj0fpreRoCiXo4YAs97AVoEKkXoQHhumgpk1g%3D%3D";
	private static final Logger logger = LoggerFactory.getLogger(WeatherController.class);
	
	
	
	@GetMapping("/weatherView.wv")
	public String weather() {
		return "common/weather/weather_today";
	}
	

	@ResponseBody
	@RequestMapping(value = "showTodayWeather.wv", produces = "application/json; charset=UTF-8") /*json 방식 응답*/
	public String weatherView(String numOfRows, String baseDate, String baseTime, double latitude, double longitude) throws Exception {
		
		GpsTransfer transfer = GpsTransfer.transfer(new GpsTransfer(latitude, longitude, 0.0, 0.0), 0);
		
		int nx = (int) transfer.getXlat();
		int ny = (int) transfer.getYlon();

//		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";	//초단기실황조회	
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst";	//초단기예보조회
//		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";		//단기예보
		
		url += "?serviceKey=" + SERVICEKEY;	//서비스 키 추가하기
		url += "&pageNo=" + 1;
		url += "&numOfRows=1000";
		url += "&dataType=JSON";
		url += "&base_date=" + baseDate;
		url += "&base_time=" + baseTime;
		url += "&nx=" + nx;					//위도(변수처리 예정)
		url += "&ny=" + ny;					//경도(변수처리 예정)

		URL requestUrl = new URL(url);
		
		
		HttpURLConnection urlCon = (HttpURLConnection)requestUrl.openConnection(); 
		
		urlCon.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader/*문자 읽을 때 사용*/(urlCon.getInputStream()));
		
		String responseStr = "";
		String line;
		
		while((line = br.readLine())/*한줄씩 읽어오기*/ != null) {
			responseStr += line;
		}
		
		br.close();
		urlCon.disconnect();

		return responseStr;
		
	}
		
}
