package com.kh.tinyfarm.publicPlant.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;
import com.kh.tinyfarm.publicPlant.model.service.PublicPlantService;
import com.kh.tinyfarm.publicPlant.model.vo.Gardening;
import com.kh.tinyfarm.publicPlant.model.vo.GardeningDetail;
import com.kh.tinyfarm.publicPlant.model.vo.InGardenPlantList;
import com.kh.tinyfarm.publicPlant.model.vo.PlantComment;



@Controller
public class publicPlantController {
	
	@Autowired
	private PublicPlantService publicPlantService;
	
	//실내정원용 식물정보 리스트 가져오기
	@RequestMapping("/inGardenPlantList.pp")
	public String getInGardenPlantList(@RequestParam(value="currentPage",defaultValue = "1")int currentPage
									  ,@RequestParam(value="sType",defaultValue = "sCntntsSj")String sType
									  ,@RequestParam(value="sText",defaultValue = "")String sText
									  ,Model model) throws IOException, ParserConfigurationException, SAXException {
		
		//식물 정보를 담을 리스트
		ArrayList<InGardenPlantList> list = new ArrayList();
		//페이지바 처리를 위한 변수
		int listCount; //총 게시글 수
		int pageLimit = 10; //페이지 번호의 최대 개수
		int boardLimit = 8; //한 페이지 게시글 최대 개수
		// apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		
		String apiKey = "20231128LKLLXWVMAXGGYTETEWAOBA";
		// 서비스 명
		String serviceName = "garden";
		
		// 오퍼레이션 명
		String operationNameList = "gardenList";

		// XML 받을 URL 생성
		String parameter = "/" + serviceName + "/" + operationNameList;
		parameter += "?apiKey=" + apiKey;
		parameter += "&pageNo=" + currentPage;
		parameter += "&sType=" + sType; //검색 타입 (제목,내용 ..)
		parameter += "&sText=" + sText; //검색값
		parameter += "&numOfRows=8";
		
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
		
		// XML 요소를 검색하기 위해 XPath 또는 직접적인 노드 탐색 가능
		NodeList cntntsNoList = document.getElementsByTagName("cntntsNo");
		NodeList cntntsSjList = document.getElementsByTagName("cntntsSj");
		NodeList rtnFileUrlList = document.getElementsByTagName("rtnFileUrl");
		NodeList rtnImgSeCodeList = document.getElementsByTagName("rtnImgSeCode");
		NodeList rtnThumbFileUrlList = document.getElementsByTagName("rtnThumbFileUrl");
		
		NodeList totalCount = document.getElementsByTagName("totalCount");
	
		// CDATA 값 추출
		for (int i = 0; i < cntntsNoList.getLength(); i++) {
			Node node = cntntsNoList.item(i);
			Node node2 = cntntsSjList.item(i);
			Node node3 = rtnFileUrlList.item(i);
			Node node4 = rtnImgSeCodeList.item(i);
			Node node5 = rtnThumbFileUrlList.item(i);

			if (node.getNodeType() == Node.ELEMENT_NODE) {
				Node childNode = node.getChildNodes().item(0);
				Node childNode2 = node2.getChildNodes().item(0);
				Node childNode3 = node3.getChildNodes().item(0);
				Node childNode4 = node4.getChildNodes().item(0);
				Node childNode5 = node5.getChildNodes().item(0);
				InGardenPlantList igp = new InGardenPlantList();
				igp.setCntntsNo(Integer.parseInt(childNode.getNodeValue()));
				igp.setCntntsSj(childNode2.getNodeValue());
				igp.setRtnFileUrlStr(childNode3.getNodeValue());
				igp.setRtnFileUrl(childNode3.getNodeValue().split("\\|"));
				igp.setRtnImgSeCode(childNode4.getNodeValue().split("\\|"));
				igp.setRtnThumbFileUrl(childNode5.getNodeValue().split("\\|"));
				list.add(igp);
			}
			
		}
		
		listCount = Integer.parseInt(totalCount.item(0).getChildNodes().item(0).getNodeValue());
		
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		model.addAttribute("result", list);
		model.addAttribute("pi", pi);
		model.addAttribute("sText",sText);
		return "plant/gardenList";
	}
	@ResponseBody
	@RequestMapping(value="/inGardenPlantListAjax.pp", produces = "application/json; charset=UTF-8")
	public ArrayList<InGardenPlantList> getInGardenPlantList(@RequestParam(value="pageNo",defaultValue = "1")int pageNo
															,@RequestParam(value="ignSeasonChkVal",defaultValue = "073001")String ignSeasonChkVal) throws IOException {
		ArrayList<InGardenPlantList> list = new ArrayList();
		
		// apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		String apiKey = "20231128LKLLXWVMAXGGYTETEWAOBA";
		// 서비스 명
		String serviceName = "garden";

		// 오퍼레이션 명
		String operationNameList = "gardenList";
	
		// XML 받을 URL 생성
		String parameter = "/" + serviceName + "/" + operationNameList;
		parameter += "?apiKey=" + apiKey;
		parameter += "&pageNo=" + pageNo;
		parameter += "&ignSeasonChkVal=" + ignSeasonChkVal; //꽃피는 계절 코드 봄 073001 여름 073002 가을 073003 겨울 073004
		parameter += "&numOfRows=8";

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

		try {
			// XML 데이터 파싱을 위한 DocumentBuilderFactory 생성
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();

			// XML 문자열을 Document 객체로 파싱
			Document document = builder.parse(new InputSource(new StringReader(responseText)));
			
			
			// XML 요소를 검색하기 위해 XPath 또는 직접적인 노드 탐색 가능
			NodeList cntntsNoList = document.getElementsByTagName("cntntsNo");
			NodeList cntntsSjList = document.getElementsByTagName("cntntsSj");
			NodeList rtnFileUrlList = document.getElementsByTagName("rtnFileUrl");
			NodeList rtnImgSeCodeList = document.getElementsByTagName("rtnImgSeCode");
			NodeList rtnThumbFileUrlList = document.getElementsByTagName("rtnThumbFileUrl");
			// CDATA 값 추출
			for (int i = 0; i < cntntsNoList.getLength(); i++) {
				Node node = cntntsNoList.item(i);
				Node node2 = cntntsSjList.item(i);
				Node node3 = rtnFileUrlList.item(i);
				Node node4 = rtnImgSeCodeList.item(i);
				Node node5 = rtnThumbFileUrlList.item(i);

				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Node childNode = node.getChildNodes().item(0); 
					Node childNode2 = node2.getChildNodes().item(0);
					Node childNode3 = node3.getChildNodes().item(0);
					Node childNode4 = node4.getChildNodes().item(0);
					Node childNode5 = node5.getChildNodes().item(0);
					
					
					
					InGardenPlantList igp = new InGardenPlantList();
					igp.setCntntsNo(Integer.parseInt(childNode.getNodeValue()));
					igp.setCntntsSj(childNode2.getNodeValue());
					igp.setRtnFileUrlStr(childNode3.getNodeValue());
					igp.setRtnFileUrl(childNode3.getNodeValue().split("\\|"));
					igp.setRtnImgSeCode(childNode4.getNodeValue().split("\\|"));
					igp.setRtnThumbFileUrl(childNode5.getNodeValue().split("\\|"));
					
					list.add(igp);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return list;
	}
	
	@RequestMapping("detailInGarden.pp")
	public String detail(InGardenPlantList plantInfo,Model model) throws IOException, ParserConfigurationException, SAXException {
		
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
		
		
		// model.addAttribute("result",responseText);
		
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
		
		//식물에 대한 의견 정보 리스트 넘기기
		//ArrayList<PlantComment> pcList = pl
		
		//응답 키와 값을 가진 map 넘기기
		model.addAllAttributes(map);
		return "plant/gardenDetail";	
	}
	
	@RequestMapping("makeInGarden.pp")
	public String goMakeInGarden() {
		return "plant/makeInGardenList";
	}
	
	
	@RequestMapping("gardeningList.pp")
	public String gardeningList(@RequestParam(value="category",defaultValue = "채소")String category
							   ,@RequestParam(value="sType",defaultValue = "sCntntsSj")String sType
							   ,@RequestParam(value="sText",defaultValue = "")String sText
							   ,Model model) throws IOException {
	
		//listCount는 내가 공공데이터에서 임의로 데이털르 선별했기 때문에 공공데이터에서 넘어오는 listCount를 이용할 수 없다. 데이터의 수가 적기때문에 직접 세어서 넣는게 나을듯 싶다.
		/*
		 * if(category.equals("채소")) { listCount = 49; }else if(category.equals("실내농업"))
		 * { listCount = 26; } else { listCount = 11; }
		 */
		
		//데이터 담을 리스트
		ArrayList<Gardening> list = new ArrayList<>();
		
		//apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		String apiKey="20231128LKLLXWVMAXGGYTETEWAOBA"; //apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		//서비스 명
		String serviceName="fildMnfct";
		//오퍼레이션 명
		String operationName="fildMnfctList";
		//채소파트에 들어갈 값 분류할때 쓸 string
		String vegitable= " 완두 , 땅콩 , 대파 , 타임 , 캐모마일 , 차이브 , 스피아민트 , 바질 , 로즈마리 , 라벤더 , 파슬리 , 샐러리 , 바질 , 셀러리 , 루꼴라 "
				+ ", 쪽파 , 생강 , 적환무 , 수세미오이 , 양파 , 양상추 , 상추 , 마늘 , 파 , 청경채 , 갓 , 열무 , 근대 , 쑥갓 , 엔디브 , 강낭콩 , 당근 , 가지 , 고추 , 배추 "
				+ ", 무 , 호박 , 토란 , 참외 , 잎들깨 , 옥수수 , 오이 , 양배추 , 시금치 , 수박 , 비트 , 브로콜리 , 부추 , 미나리 "; //49
		//실내농업정보에 담을 값 분류할때 쓸 string. involved는 값이 도시농업,가꾸기,기르기 라는 값을 포함하면 가져오게 하기 위해 따로.
		String gardeningSol = "실내 텃밭 가꾸는 요령과 재배 달력,올바르게 모종을 심는 방법,페트병 화분 만들기,빛이 없어도 키울 수 있어요! 싹채소 키우기,베란다 텃밭에 기를 수 있는 채소"
				+ ",베란다 텃밭에서 잘 자라지 못하는 식물은?,베란다 텃밭이란?,모종 심는 법 (상추)"
				+ ",채소 재배목적에 맞는 맞춤형 텃밭 설계하세요,맛있는 텃밭채소원 만들기"; //9
		String involvedStr = "도시농업"; //17

		
		//카테고리 별 텃밭 정보 
		String cateGardeningStr ="먹을 수 있는 꽃,학습용 텃밭,다이어트 텃밭,심혈관질환 예방을 위한 텃밭,당뇨 예방을 위한 텃밭,암 예방을 위한 텃밭,고혈압 예방을 위한 텃밭,바베큐 텃밭,샐러드 텃밭,향이 있는 텃밭,알록달록 텃밭"; //11
		
		//텃밭가꾸기 sSeCode=335001인 데이터는 총 11페이지 있기 때문에 다 불러오기 위해서 11까지 반복문 돌리기
		//내가 쓰려는 데이터는 다 335001에 담겨있음.
		for(int i=0;i<11;i++) {
			
			//XML 받을 URL 생성
			String parameter = "/"+serviceName+"/"+operationName;
			parameter += "?apiKey="+ apiKey;
			parameter += "&pageNo="+i;
			parameter += "&sType="+sType;
			parameter += "&sText="+sText;
			parameter += "&sSeCode=335001";
			
			//서버와 통신
			URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
			
			InputStream apiStream = apiUrl.openStream();
			
			Document doc = null;
			try{
				//xml document
				doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				apiStream.close();
			}
			
			int size = 0;
			
			NodeList items = null;
			NodeList cntntsNos = null;
			NodeList cntntsSjs = null;
			
			NodeList cntntsRdcnts = null;
			NodeList updusrEsntlNms = null;
			
			
			items = doc.getElementsByTagName("item");
			size = doc.getElementsByTagName("item").getLength();
			cntntsNos = doc.getElementsByTagName("cntntsNo");
			cntntsSjs = doc.getElementsByTagName("cntntsSj");
			cntntsRdcnts = doc.getElementsByTagName("cntntsRdcnt");
			updusrEsntlNms = doc.getElementsByTagName("updusrEsntlNm");
			
			/*
			 * cntntsNo 컨텐츠번호 cntntsSj 컨텐츠명 updusrEsntlNm 등록자 cntntsRdcnt 조회수 
			 */
			
			for(int j=0; j<size; j++){
				//키값
				String cntntsNo;
				//제목
				String cntntsSj;
				//조회수
				String cntntsRdcnt;
				//작성자
				String updusrEsntlNm;
				try {cntntsNo = cntntsNos.item(j).getFirstChild().getNodeValue();}catch (NullPointerException e) {cntntsNo = "";}
				try {cntntsRdcnt = cntntsRdcnts.item(j).getFirstChild().getNodeValue();}catch (NullPointerException e) {cntntsRdcnt = "";}
				try {cntntsSj = cntntsSjs.item(j).getFirstChild().getNodeValue();}catch (NullPointerException e) {cntntsSj = "";}
				try {updusrEsntlNm = updusrEsntlNms.item(j).getFirstChild().getNodeValue();}catch (NullPointerException e) {updusrEsntlNm = "";}
				
				
				if(category.equals("채소")) {
				
					if(vegitable.contains(cntntsSj)) {
						list.add(new Gardening(cntntsNo,cntntsSj,updusrEsntlNm,cntntsRdcnt));
						
					}
					
				}else if(category.equals("실내농업")) {
					
					if(gardeningSol.contains(cntntsSj)) {
						list.add(new Gardening(cntntsNo,cntntsSj,updusrEsntlNm,cntntsRdcnt));	
					}else if(cntntsSj.contains(involvedStr)) {
						list.add(new Gardening(cntntsNo,cntntsSj,updusrEsntlNm,cntntsRdcnt));	
					}
					
				}else {
					
					if(cateGardeningStr.contains(cntntsSj)) {
						list.add(new Gardening(cntntsNo,cntntsSj,updusrEsntlNm,cntntsRdcnt));
					}
					
				}
				
			}
			
			
			
			
		}
		
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("listSize", list.size());
		return "plant/gardeningList";
	}
	@RequestMapping("gardeningDetail.pp")
	public String gardeningDetail(@RequestParam(value="category",defaultValue = "채소")String category
							   		,String cntntsNo
									,Model model) throws IOException {
		
		//apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		String apiKey="20231128LKLLXWVMAXGGYTETEWAOBA"; //apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		//서비스 명
		String serviceName="fildMnfct";
		//오퍼레이션 명
		String operationName="fildMnfctView";
	
		//XML 받을 URL 생성
		String parameter = "/"+serviceName+"/"+operationName;
		parameter += "?apiKey="+ apiKey;
		parameter += "&cntntsNo="+cntntsNo;
		
		//서버와 통신
		URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
		
		InputStream apiStream = apiUrl.openStream();
		
		Document doc = null;
		try{
			//xml document
			doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(apiStream);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			apiStream.close();
		}

		//제목
		String cntntsSj = null;

		//다운URL
		//String downUrl = null;
		
		//등록일
		String svcDtx = null;
		//조회수
		String cntntsRdcnt = null;
		//작성자
		String updusrEsntlNm = null;
		//다운파일명
		//String fileName = null;


		//내용
		String cn = null;

		try{cntntsSj = doc.getElementsByTagName("cntntsSj").item(0).getFirstChild().getNodeValue();}catch(Exception e){cntntsSj = "";}
		//try{downUrl = doc.getElementsByTagName("downUrl").item(0).getFirstChild().getNodeValue();}catch(Exception e){downUrl = "";}
		try{svcDtx = doc.getElementsByTagName("svcDtx").item(0).getFirstChild().getNodeValue();}catch(Exception e){svcDtx = "";}
		try{cntntsRdcnt = doc.getElementsByTagName("cntntsRdcnt").item(0).getFirstChild().getNodeValue();}catch(Exception e){cntntsRdcnt = "";}
		try{updusrEsntlNm = doc.getElementsByTagName("updusrEsntlNm").item(0).getFirstChild().getNodeValue();}catch(Exception e){updusrEsntlNm = "";}
		//try{fileName = doc.getElementsByTagName("fileName").item(0).getFirstChild().getNodeValue();}catch(Exception e){fileName = "";}
		try{cn = doc.getElementsByTagName("cn").item(0).getFirstChild().getNodeValue();}catch(Exception e){cn = "";}


		
		
		GardeningDetail gd = new GardeningDetail(cntntsSj,cn,updusrEsntlNm,svcDtx,cntntsRdcnt);
		model.addAttribute("gd", gd);
		model.addAttribute("category", category);
		return "plant/gardeningDetail";
	}
	
	//식물 의견 리스트 가져오기
	@ResponseBody
	@RequestMapping(value="selectComment.pp",produces="application/json; charset=UTF-8")
	public ArrayList<PlantComment> selectComment(@RequestParam(value = "currentPage",defaultValue = "1")int currentPage
												,int cntntsNo){
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		
		//식물 의견 테이블 내 해당 식물에 적힌 댓글 개수 가져오기
		//int listCount = publicPlantService.getCommentCount(cntntsNo);
		int boardLimit = 5;
		//int pageLimit = 5;
		
		map.put("limit",boardLimit);
		map.put("currentPage",currentPage);
		map.put("cntntsNo",cntntsNo);
		ArrayList<PlantComment> list = publicPlantService.selectComment(map);
		
		return list;
	}
	//식물 의견 개수
	@ResponseBody
	@RequestMapping("getCommentCount.pp")
	public int getCommentCount(int cntntsNo) {
		return publicPlantService.getCommentCount(cntntsNo);
	}
	
	
	//식물 의견 추가
	@ResponseBody
	@RequestMapping(value="insertCommentToPlant.pp",produces="text/html; charset=UTF-8")
	public String insertCommentToPlant(PlantComment pc) {
		
		int result = publicPlantService.insertCommentToPlant(pc);
		if(result > 0) {
			return "NNNNY";			
		}else {
			return "NNNNN";
		}
	}
	
	//식물 의견 수정
	@ResponseBody
	@RequestMapping(value="updateComment.pp",produces="text/html; charset=UTF-8")
	public String updateComment(PlantComment pc) {
		System.out.println(pc);
		int result = publicPlantService.updateComment(pc);
		if(result > 0) {
			return "NNNNY";			
		}else {
			return "NNNNN";
		}
	}
	
	//식물 의견 삭제
	@ResponseBody
	@RequestMapping(value="deleteComment.pp",produces="text/html; charset=UTF-8")
	public String deleteComment(int ctpNo) {
	
		int result = publicPlantService.deleteComment(ctpNo);
		if(result > 0) {
			return "NNNNY";			
		}else {
			return "NNNNN";
		}
	}
}

