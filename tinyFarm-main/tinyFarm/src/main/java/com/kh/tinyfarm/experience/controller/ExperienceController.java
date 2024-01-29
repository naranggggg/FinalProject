package com.kh.tinyfarm.experience.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.common.template.Pagination;
import com.kh.tinyfarm.experience.model.vo.Experience;
import com.kh.tinyfarm.experience.model.vo.ExperienceListVo;

@Controller
public class ExperienceController {
	
	
	@RequestMapping("experienceList.ex")
	public String selectExperienceList(@RequestParam(value = "pageNo",defaultValue = "1")int pageNo
									  ,@RequestParam(value = "sText",defaultValue = "")String sText
									  ,@RequestParam(value = "sType",defaultValue = "")String sType
									  ,Model model) throws IOException, ParserConfigurationException, SAXException {
		//apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		String apiKey="20231229DWALHYPZBAI1CEVZX8SZTW"; //apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		//서비스 명
		String serviceName="fmlgEdcFarmm";
		//오퍼레이션 명
		String operationName="fmlgEdcFarmmList";

		//XML 받을 URL 생성
		String parameter = "/"+serviceName+"/"+operationName;
		parameter += "?apiKey="+ apiKey;
		parameter += "&pageNo="+pageNo;
		parameter += "&numOfRows=8";

		int listCount;
		int pageLimit = 10;
		int boardLimit = 8;
		//검색 조건
		if(sType!=null&&!sType.equals("")){
			parameter += "&sType="+ sType;
		}
		//검색어
		if(sText!=null&&!sText.equals("")){
			parameter += "&sText="+ URLEncoder.encode(sText);
		}

		//서버와 통신
		URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
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
		System.out.println(responseText);
		// XML 데이터 파싱을 위한 DocumentBuilderFactory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();

		// XML 문자열을 Document 객체로 파싱
		Document doc = builder.parse(new InputSource(new StringReader(responseText)));

		NodeList items = doc.getElementsByTagName("item");
		int size = doc.getElementsByTagName("item").getLength();
		NodeList cntntsNos = doc.getElementsByTagName("cntntsNo");
		NodeList cntntsSjs = doc.getElementsByTagName("cntntsSj");
		NodeList adstrdNames = doc.getElementsByTagName("adstrdName");
		NodeList locplcs = doc.getElementsByTagName("locplc");
		NodeList themas = doc.getElementsByTagName("thema");
		NodeList telnos = doc.getElementsByTagName("telno");
		NodeList thumbImgUrls = doc.getElementsByTagName("thumbImgUrl");
		NodeList imgUrls = doc.getElementsByTagName("imgUrl");
		NodeList totalCount = doc.getElementsByTagName("totalCount");
		
		ArrayList<ExperienceListVo> list = new ArrayList();
		
		for(int i=0; i<size; i++){
			//키값
			String cntntsNo = cntntsNos.item(i).getFirstChild() == null ? "" : cntntsNos.item(i).getFirstChild().getNodeValue();
			//명칭
			String cntntsSj = cntntsSjs.item(i).getFirstChild() == null ? "" : cntntsSjs.item(i).getFirstChild().getNodeValue();
			//지역명
			String adstrdName = adstrdNames.item(i).getFirstChild() == null ? "" : adstrdNames.item(i).getFirstChild().getNodeValue();
			//주소
			String locplc = locplcs.item(i).getFirstChild() == null ? "" : locplcs.item(i).getFirstChild().getNodeValue();
			//주제
			String thema = themas.item(i).getFirstChild() == null ? "" : themas.item(i).getFirstChild().getNodeValue();
			//연락처
			String telno = telnos.item(i).getFirstChild() == null ? "" : telnos.item(i).getFirstChild().getNodeValue();
			//썸네일 이미지
			String thumbImgUrl = thumbImgUrls.item(i).getFirstChild() == null ? "" : thumbImgUrls.item(i).getFirstChild().getNodeValue();
			//원본 이미지
			String imgUrl = imgUrls.item(i).getFirstChild() == null ? "" : imgUrls.item(i).getFirstChild().getNodeValue();
			
			ExperienceListVo exVo = new ExperienceListVo(cntntsNo,cntntsSj,adstrdName,locplc,thema,telno,thumbImgUrl,imgUrl);
			list.add(exVo);
		}
	
		try{listCount = Integer.parseInt(totalCount.item(0).getFirstChild().getNodeValue());}catch(Exception e){listCount = 0;}
		PageInfo pi = Pagination.getPageInfo(listCount, pageNo, pageLimit, boardLimit);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("sText",sText);
		model.addAttribute("sType",sType);
		System.out.println(size);
		System.out.println(list);
		return "experience/experienceList";
	}
	
	
	@RequestMapping("experienceDetail.ex")
	public String experienceDetail(String cntntsNo,Model model) throws IOException, ParserConfigurationException, SAXException {
		//apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		String apiKey="20231229DWALHYPZBAI1CEVZX8SZTW"; //apiKey - 농사로 Open API에서 신청 후 승인되면 확인 가능
		//서비스 명
		String serviceName="fmlgEdcFarmm";
		//오퍼레이션 명
		String operationName="fmlgEdcFarmmDtl";

		//XML 받을 URL 생성
		String parameter = "/"+serviceName+"/"+operationName;
		parameter += "?apiKey="+ apiKey;
		parameter += "&cntntsNo="+cntntsNo;


		//서버와 통신
		URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
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
		System.out.println(responseText);
		// XML 데이터 파싱을 위한 DocumentBuilderFactory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();

		// XML 문자열을 Document 객체로 파싱
		Document doc = builder.parse(new InputSource(new StringReader(responseText)));

		/*
		 * NodeList items = doc.getElementsByTagName("item"); int size =
		 * doc.getElementsByTagName("item").getLength(); NodeList cntntsNos =
		 * doc.getElementsByTagName("cntntsNo"); //컨텐츠 번호 NodeList cntntsSjs =
		 * doc.getElementsByTagName("cntntsSj"); //제목 NodeList locplcs =
		 * doc.getElementsByTagName("locplc"); //소재지 NodeList themas =
		 * doc.getElementsByTagName("thema"); //주제 NodeList telnos =
		 * doc.getElementsByTagName("telno"); //연락처 NodeList appnYear =
		 * doc.getElementsByTagName("appnYear"); //지정연도 NodeList crtfcYearInfo =
		 * doc.getElementsByTagName("crtfcYearInfo"); //품질인증연도 NodeList cn =
		 * doc.getElementsByTagName("cn"); //내용 NodeList imgUrl1 =
		 * doc.getElementsByTagName("imgUrl1"); //이미지주소 1 NodeList imgUrl2 =
		 * doc.getElementsByTagName("imgUrl2"); //이미지주소 2 NodeList imgUrl3 =
		 * doc.getElementsByTagName("imgUrl3"); //이미지주소 3 NodeList imgUrl4 =
		 * doc.getElementsByTagName("imgUrl4"); //이미지주소 4 NodeList imgUrl5 =
		 * doc.getElementsByTagName("imgUrl5"); //이미지주소 5 NodeList imgUrl6 =
		 * doc.getElementsByTagName("imgUrl6"); //이미지주소 6
		 */		
		//키값
		String cntntsNo1 = null;
		//명칭
		String cntntsSj = null;
		//소재지
		String locplc = null;
		//주체
		String thema = null;
		//지정연도
		String appnYear = null;
		//홈페이지주소
		String url = null;
		//연락처
		String telno = null;
		//내용
		String cn = null;
		//품질인증연도
		String crtfcYearInfo = null;

		//이미지1
		String imgUrl1 = null;
		//이미지2
		String imgUrl2 = null;
		//이미지3
		String imgUrl3 = null;
		//이미지4
		String imgUrl4 = null;
		//이미지5
		String imgUrl5 = null;
		//이미지6
		String imgUrl6 = null;

		try{cntntsNo1 = doc.getElementsByTagName("cntntsNo").item(0).getFirstChild().getNodeValue();}catch(Exception e){cntntsNo = "";}
		try{cntntsSj = doc.getElementsByTagName("cntntsSj").item(0).getFirstChild().getNodeValue();}catch(Exception e){cntntsSj = "";}
		try{locplc = doc.getElementsByTagName("locplc").item(0).getFirstChild().getNodeValue();}catch(Exception e){locplc = "";}
		try{thema = doc.getElementsByTagName("thema").item(0).getFirstChild().getNodeValue();}catch(Exception e){thema = "";}
		try{appnYear = doc.getElementsByTagName("appnYear").item(0).getFirstChild().getNodeValue();}catch(Exception e){appnYear = "";}
		try{url = doc.getElementsByTagName("url").item(0).getFirstChild().getNodeValue();}catch(Exception e){url = "";}
		try{telno = doc.getElementsByTagName("telno").item(0).getFirstChild().getNodeValue();}catch(Exception e){telno = "";}
		try{crtfcYearInfo = doc.getElementsByTagName("crtfcYearInfo").item(0).getFirstChild().getNodeValue();}catch(Exception e){crtfcYearInfo = "";}
		try{cn = doc.getElementsByTagName("cn").item(0).getFirstChild().getNodeValue();}catch(Exception e){cn = "";}
		try{imgUrl1 = doc.getElementsByTagName("imgUrl1").item(0).getFirstChild().getNodeValue();}catch(Exception e){imgUrl1 = "";}
		try{imgUrl2 = doc.getElementsByTagName("imgUrl2").item(0).getFirstChild().getNodeValue();}catch(Exception e){imgUrl2 = "";}
		try{imgUrl3 = doc.getElementsByTagName("imgUrl3").item(0).getFirstChild().getNodeValue();}catch(Exception e){imgUrl3 = "";}
		try{imgUrl4 = doc.getElementsByTagName("imgUrl4").item(0).getFirstChild().getNodeValue();}catch(Exception e){imgUrl4 = "";}
		try{imgUrl5 = doc.getElementsByTagName("imgUrl5").item(0).getFirstChild().getNodeValue();}catch(Exception e){imgUrl5 = "";}
		try{imgUrl6 = doc.getElementsByTagName("imgUrl6").item(0).getFirstChild().getNodeValue();}catch(Exception e){imgUrl6 = "";}
		
		Experience ex = new Experience(cntntsNo1,cntntsSj,locplc,thema,appnYear,url,telno
										,crtfcYearInfo,cn,imgUrl1,imgUrl2,imgUrl3,imgUrl4,imgUrl5,imgUrl6);
		
		model.addAttribute("ex", ex);

		return "experience/experienceDetail";
	}
	
	
	
}
