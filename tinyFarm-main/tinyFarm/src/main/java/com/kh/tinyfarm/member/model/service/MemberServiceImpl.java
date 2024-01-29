package com.kh.tinyfarm.member.model.service;

import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.dao.MemberDao;
import com.kh.tinyfarm.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private SqlSessionTemplate sqlSession;

    
    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
    
    // 생성자 추가
    public MemberServiceImpl() {
        System.out.println("MemberServiceImpl 생성자 호출");
    }

	@Override
	public Member loginMember(Member m) {
	
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		return loginUser;
	}
	
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}
	
	
	@Override
	public int checkId(String checkId) {
		return memberDao.checkId(sqlSession,checkId);
	}
	
	@Override
	public void sendEmail(Member vo, String div, String plainPassword) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "alswjddl901@naver.com";
		String hostSMTPpwd = "rla135";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "alswjddl901@naver.com";
		String fromName = "작은농장";
		String subject = "임시비밀번호 입니다";
		String msg = "";

		if (div.equals("findPw")) {
		    subject = "작은농장 임시 비밀번호 입니다.";
		    msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		    msg += "<h3 style='color: blue;'>";
		    msg += vo.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		    msg += "<p>임시 비밀번호 : ";
		    msg += plainPassword + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
	    String mail = vo.getEmail();
	    try {
	        HtmlEmail email = new HtmlEmail();
	        email.setDebug(true);
	        email.setCharset(charSet);
	        email.setSSL(true);
	        email.setHostName(hostSMTP);
	        email.setSmtpPort(587);

	        email.setAuthentication(hostSMTPid, hostSMTPpwd);
	        email.setTLS(true);
	        email.addTo(mail, charSet);
	        email.setFrom(fromEmail, fromName, charSet);
	        email.setSubject(subject);

	        // "findpw"이 아닌 경우에도 msg 초기화
	        if (!div.equals("findPw")) {
	            msg = "기본 메시지 내용";  // 적절한 기본 메시지 내용을 넣어주세요.
	        }

	        System.out.println("div: " + div);
	        System.out.println("msg: " + msg);
	        
	        email.setHtmlMsg(msg);
	        email.send();
	    } catch (Exception e) {
	        System.out.println("메일발송 실패: " + e.getMessage());
	        e.printStackTrace();
	    }
	}
	
		//비밀번호찾기
		// MemberServiceImpl 클래스의 findPw 메서드 수정
		@Override
		public void findPw(HttpServletResponse response, Member vo) throws Exception {
		    response.setContentType("text/html;charset=utf-8");
		    Member ck = memberDao.readMember(sqlSession, vo.getUserId());
		    PrintWriter out = response.getWriter();
	
		    // 가입된 아이디가 없으면
		    if (memberDao.idCheck(sqlSession, vo.getUserId()) == 0) {
		        System.out.println("등록되지 않은 아이디입니다.");
		        out.print("등록되지 않은 아이디입니다.");
		        out.close();
		    }
		    // 가입된 이메일이 아니면
		    else if (!vo.getEmail().equals(ck.getEmail())) {
		        System.out.println("등록되지 않은 이메일입니다.");
		        out.print("등록되지 않은 이메일입니다.");
		        out.close();
		    } else {
		        // 임시 비밀번호 생성
		        String ps = "";
		        for (int i = 0; i < 12; i++) {
		            ps += (char) ((Math.random() * 26) + 97);
		        }
	
		        // 암호화 전의 비밀번호 저장
		        String plainPassword = ps;
	
		        // BCryptPasswordEncoder를 사용하여 임시 비밀번호 암호화
		        String encPwd = bcryptPasswordEncoder.encode(ps);
		        vo.setUserPwd(encPwd);
	
		        // 비밀번호 변경
		        memberDao.updatePw(sqlSession, vo);
	
		        // 비밀번호 변경 메일 발송
		        sendEmail(vo, "findPw", plainPassword);
	
		        out.print("이메일로 임시 비밀번호를 발송하였습니다.");
		        out.close();
		    }
		}
				
		
	//admin - 전체 회원수
	@Override
	public int memberListCount(String searchId) {
		return memberDao.memberListCount(sqlSession, searchId); 
	}
	

	//admin - 회원 리스트
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi, String searchId) {
		return memberDao.selectMemberList(sqlSession, pi, searchId);
	}

	
	//admin - 회원활동 일괄중지
	@Override
	public int memberStatus(Map<String, Object> map) {
		return memberDao.memberStatus(sqlSession, map);
	}

	
	@Override
	public String findId(Member member) {
		return memberDao.findId(sqlSession, member);
	}




	//admin - 회원 정보 상세조회
	@Override
	public Member selectMemberDetailInfo(int userNo) {
		return memberDao.selectMemberDetailInfo(sqlSession, userNo);
	}

	
	//admin - 회원 정보 상세조회
	@Override
	public int memberStatusUpdate(Member m) {
		return memberDao.memberStatusUpdate(sqlSession, m);
	}





	// 카카오 로그인
		@Override
		public String insertKakaoUserInfo(String userId, String userName, String originName, String changeName) {
		    try {
		        Member member = new Member();
		        member.setUserId(userId);
		        member.setUserName(userName);
		        member.setOriginName(originName);
		        member.setChangeName(changeName);

		        // 아이디 체크
		        int idCheckResult = memberDao.idCheck(sqlSession, member.getUserId());

		        if (idCheckResult == 0) {
		            // 존재하지 않는 아이디라면 회원 정보 삽입
		            memberDao.insertKakaoUserInfo(sqlSession, member);
		            return "success"; // 성공적으로 회원 정보 삽입
		        } else {
		            System.out.println("이미 가입된 아이디 입니다");
		            return "duplicate"; // 이미 가입된 아이디인 경우
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        // 예외 처리를 필요에 따라 수행하세요.
		        return "error"; // 예외 발생 시
		    }
		}




}

