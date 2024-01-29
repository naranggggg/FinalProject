package com.kh.tinyfarm.mbti.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.kh.tinyfarm.mbti.model.service.MbtiService;
import com.kh.tinyfarm.mbti.model.vo.GardenFile;
import com.kh.tinyfarm.mbti.model.vo.InGardenMbti;
import com.kh.tinyfarm.publicPlant.model.vo.InGardenPlantList;

@Controller
public class MbtiController {

	@Autowired
	private MbtiService mbtiService;

	@RequestMapping("moveMbtiTest.mt")
	public String moveMbtiTest() {
		return "mbti/mbtiTest";
	}

	@ResponseBody
	@RequestMapping(value = "selectContentNo.mt", produces = "application/json; charset=UTF-8")
	public ArrayList<GardenFile> selectCntntsNo(int pageNo, InGardenMbti igm) throws IOException {

		ArrayList<InGardenMbti> cnList = mbtiService.selectCntntsNo(igm);
		ArrayList<GardenFile> list = new ArrayList();
		//각각의 cntntsNo일때 실행해야함

		for(int i=0;i<cnList.size();i++) {
			//System.out.println(cnList.get(i).getCntntsNo());
			
			// 농사로api에서 추천리스트 받아오기
			String apiKey = "20231128LKLLXWVMAXGGYTETEWAOBA";
			String serviceName = "garden";
			String operationNameList = "gardenFileList";
			String parameter = "/" + serviceName + "/" + operationNameList;
			parameter += "?apiKey=" + apiKey;
			parameter += "&cntntsNo="+cnList.get(i).getCntntsNo();  //cnList의 cntntsNo넣기
			URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
			HttpURLConnection urlCon = (HttpURLConnection) apiUrl.openConnection();
			urlCon.setRequestMethod("GET");
			BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
			String responseText = "";
			String line;

			while ((line = br.readLine()) != null) {
				responseText += line;
			}
			//System.out.println("responseText : "+responseText);
			try {
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document document = builder.parse(new InputSource(new StringReader(responseText)));
				NodeList cntntsNoList = document.getElementsByTagName("cntntsNo");
				NodeList cntntsSjList = document.getElementsByTagName("cntntsSj");
				NodeList rtnFileUrlList = document.getElementsByTagName("rtnFileUrl");
				NodeList rtnImgSeCodeList = document.getElementsByTagName("rtnImgSeCode");
				NodeList rtnThumbFileUrlList = document.getElementsByTagName("rtnThumbFileUrl");

					int j=0;
					Node node = cntntsNoList.item(j);
					Node node2 = cntntsSjList.item(j);
					Node node3 = rtnFileUrlList.item(j);
					Node node4 = rtnImgSeCodeList.item(j);
					Node node5 = rtnThumbFileUrlList.item(j);

					if (node.getNodeType() == Node.ELEMENT_NODE) {
						Node childNode = node.getChildNodes().item(0); 
						Node childNode2 = node2.getChildNodes().item(0);
						Node childNode3 = node3.getChildNodes().item(0);
						Node childNode4 = node4.getChildNodes().item(0);
						Node childNode5 = node5.getChildNodes().item(0);
						
						
						GardenFile gp = new GardenFile();
						gp.setCntntsNo(Integer.parseInt(childNode.getNodeValue()));
						gp.setCntntsSj(childNode2.getNodeValue());
						gp.setRtnFileUrl(childNode3.getNodeValue().split("\\|"));
						gp.setRtnImgSeCode(childNode4.getNodeValue().split("\\|"));
						gp.setRtnThumbFileUrl(childNode5.getNodeValue().split("\\|"));
						
						list.add(gp);
					}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		//System.out.println("list : "+list);	
		
		return list;
	}
	
	
	@RequestMapping("detailRecommend.mt")
	public String detail(String detailImg,InGardenPlantList plantInfo,Model model) throws IOException, ParserConfigurationException, SAXException {
		
		String[] responseNameList = {
				"cntntsNo", "plntzrNm", "distbNm", "fmlCodeNm", "adviseInfo", "growthHgInfo", "growthAraInfo", "lefStleInfo",
				"smellCodeNm", "prpgtEraInfo", "etcEraInfo", "managelevelCodeNm", "grwtveCodeNm", "grwhTpCodeNm", "winterLwetTpCodeNm",
				"hdCodeNm", "frtlzrInfo", "soilInfo", "watercycleSprngCodeNm", "watercycleSummerCodeNm", "watercycleAutumnCodeNm",
				"watercycleWinterCodeNm", "dlthtsManageInfo", "speclmanageInfo", "fncltyInfo", "managedemanddoCodeNm", "clCodeNm",
				"grwhstleCodeNm", "indoorpsncpacompositionCodeNm", "eclgyCodeNm"
		};
		
		// apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		String apiKey = "20231128LKLLXWVMAXGGYTETEWAOBA";
		// 서비스 명
		String serviceName = "garden";
		
		// 오퍼레이션 명
		String operationNameList = "gardenDtl";
		
		// XML 받을 URL 생성
		String parameter = "/" + serviceName + "/" + operationNameList;
		parameter += "?apiKey=" + apiKey;
		parameter += "&cntntsNo=" + plantInfo.getCntntsNo();
		
		// 서버와 통신
		URL apiUrl = new URL("http://api.nongsaro.go.kr/service" + parameter);
		
		// HttpURLConnection 객체를 이용하여 api 요청작업을 수행한다. (url객체에서 HttpURLConnection 객체
		// 얻어오기)
		HttpURLConnection urlCon = (HttpURLConnection) apiUrl.openConnection();

		// 요청에 필요한 설정 해주기 (get) header method 설정
		urlCon.setRequestMethod("GET"); // get방식 요청 설정

		// 해당 openApi 서버로 요청후 연결스트림을 이용하여 응답 데이터 읽어오기(추출)
		BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));

		// 연결된 스트림을 이용하여 각 데이터 읽어오기
		String responseText = "";
		String line;
		
		// 더이상 읽을 데이터가 없으면 null을 읽어올때까지 문자열 읽어오기 작업
		while ((line = br.readLine()) != null) { // br.readLine()이 수행되면 한줄을 읽어버리기 때문에 변수 처리해야한다.
			responseText += line;
		}

		// XML 데이터 파싱을 위한 DocumentBuilderFactory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		
		// XML 문자열을 Document 객체로 파싱
		Document document = builder.parse(new InputSource(new StringReader(responseText)));
		
		//응답결과 이름별 노드 추가
		ArrayList<NodeList> nodeList = new ArrayList();
		
		//키와 값으로 이루어진 Map 형태로 model로 전달하기 위해 Map 선언
		Map<String,String> map = new HashMap<String, String>();
		
		for(int i=0;i<responseNameList.length;i++) {
			nodeList.add(document.getElementsByTagName(responseNameList[i]));
			Node node = nodeList.get(i).item(0);
			
			try {
				map.put(node.getNodeName(), node.getChildNodes().item(0).getNodeValue());
			} catch (NullPointerException e) {
				map.put(node.getNodeName(), "정보 없음");
			}			
		}
		
		//식물 이미지 배열 넘기기
		String[] imgArr = plantInfo.getRtnFileUrlStr().split("\\|");
		model.addAttribute("imgArr", imgArr);
		model.addAttribute("plantInfo", plantInfo);
		model.addAttribute("detailImg", plantInfo.getDetailImg());
		
		//응답 키와 값을 가진 map 넘기기
		model.addAllAttributes(map);
		return "mbti/recommendDetailPlant";	
	}
	
	

}
