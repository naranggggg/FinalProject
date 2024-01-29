package com.kh.tinyfarm.member.controller;

import java.io.BufferedReader;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.tinyfarm.member.model.service.MemberService;
import com.kh.tinyfarm.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("/loginGo.me")
	public String loginPage() {
		return "member/memberLoginForm";
	}

	@RequestMapping("/login.me")
	public String loginProcess(Member m, HttpSession session, Model model) {

		Member loginUser = memberService.loginMember(m);

		if (loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "환영합니다:D");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "로그인 실패");
			return "redirect:/loginGo.me";
		}
	}

	// 아이디 찾기 페이지로 가기
	@RequestMapping(value = "/userfind.me", method = RequestMethod.GET)
	public String userfind() {
		return "member/userfindId";
	}

	// 비밀번호 찾기 페이지로 가기
	@RequestMapping(value = "/findPw.me", method = RequestMethod.GET)
	public String userfindPwdPage() {
		return "member/findPw";
	}

	// 아이디찾기 결과 페이지
	@PostMapping("/findIdResult.me")
	public String findIdResult(Member member, Model model) {

		System.out.println(member);

		String userId = memberService.findId(member);

		model.addAttribute("userId", userId);

		return "member/findIdResult";
	}

	// 비밀번호 찾기
	@RequestMapping("/findPw")
	public void findPwPage() throws Exception {
		// 비밀번호 찾기 페이지에 대한 로직을 여기에 작성
	}

	@PostMapping("/findPw.me")
	public void findPwPost(@ModelAttribute Member member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			memberService.findPw(response, member);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}

	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {

		// 세션에 담겨있는 loginUser정보 지우기
		session.removeAttribute("loginUser");

		return "redirect:/";
	}

	// 회원가입창
	@GetMapping("/join.me")
	public String joinPage() {
		return "member/memberEnrollForm";
	}

	// 회원가입
	@PostMapping("insert.me")
	public String insertMember(Member m, MultipartFile upfile, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);

		if (!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			m.setOriginName(upfile.getOriginalFilename());
			m.setChangeName("resources/uploadFiles/" + changeName);
		} else {
			// 파일이 업로드되지 않았거나 null인 경우
			m.setOriginName("profile.jpg");
			m.setChangeName("resources/profile.jpg");
		}

		int result = memberService.insertMember(m);

		// 여기에 추가적인 로직이나 결과에 대한 처리를 추가할 수 있습니다.
		if (result > 0) {
			session.setAttribute("alertMsg", m.getUserName() + " 님 환영합니다");
			return "redirect:/loginGo.me";
		} else {
			session.setAttribute("alertMsg", "회원 등록 실패");
			return "common/errorPage";
		}
	}

	// 파일명 수정 모듈
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}

	@ResponseBody
	@RequestMapping("checkId.me")
	public String checkId(String checkId) {

		// 사용자가 입력한 아이디가 데이터베이스에 존재하는지 중복체크하기
		int count = memberService.checkId(checkId);

		if (count > 0) { // 사용하면 안된다(중복)
			return "NNNNN";
		} else { // 사용 가능
			return "NNNNY";
		}

	}

	@PostMapping("/insertKakaoUserInfo")
	@ResponseBody
	public String insertKakaoUserInfo(@RequestParam String userId, @RequestParam String userName,
	        @RequestParam String originName, @RequestParam String changeName, HttpSession session) {
	    try {
	        // 서비스 메서드 호출하여 데이터베이스에 저장
	        String result = memberService.insertKakaoUserInfo(userId, userName, originName, changeName);

	        // 사용자 정보 세션에 저장
	        Member loginUser = new Member();
	        loginUser.setUserId(userId);
	        loginUser.setUserName(userName);
	        loginUser.setOriginName(originName);
	        loginUser.setChangeName(changeName);
	        session.setAttribute("loginUser", loginUser);

	        System.out.println("데이터 저장완료");
	        // 서비스 메서드의 반환 값을 클라이언트로 전달
	        return result;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	}
}
