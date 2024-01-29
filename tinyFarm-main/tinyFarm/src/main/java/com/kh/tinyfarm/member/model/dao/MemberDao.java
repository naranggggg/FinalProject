package com.kh.tinyfarm.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tinyfarm.common.model.vo.PageInfo;
import com.kh.tinyfarm.member.model.vo.Member;
import com.kh.tinyfarm.qna.model.vo.Qna;

@Repository 
public class MemberDao {
	
	private static final String namespace = "memberMapper";
	
	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession , Member m) {
	
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	//회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	//아이디 중복체크
	public int checkId(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.checkId",checkId);
	}
	
	//비밀번호 찾기
	public Member findPwCheck(Member member, SqlSessionTemplate sqlSession) throws Exception {
	    return sqlSession.selectOne("memberMapper.findPwCheck", member);
	}

	// 아이디 찾기
	public String findId(SqlSessionTemplate sqlSession, Member member) {
	    return sqlSession.selectOne("memberMapper.findId", member);
	}
	
	
	// 비밀번호 변경
	public int updatePw(SqlSessionTemplate sqlSession, Member vo) {
	    return sqlSession.update("memberMapper.updatePw", vo);
	}
	
	// MemberDao 클래스에 추가
	public Member readMember(SqlSessionTemplate sqlSession, String userId) {
	    return sqlSession.selectOne("memberMapper.readMember", userId);
	}
	
	// MemberDao 클래스에 추가
	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
	    return sqlSession.selectOne("memberMapper.idCheck", userId);
	}

	
	//admin - 전체 회원수
	public int memberListCount(SqlSessionTemplate sqlSession, String searchId) {
		return sqlSession.selectOne("memberMapper.memberListCount", searchId);
	}

	
	//admin - 전체 회원목록
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi, String searchId) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", searchId, rowBounds);
	}

	
	//admin - 회원활동 일괄중지
	public int memberStatus(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		
		System.out.println(map);
		int result = sqlSession.update("memberMapper.memberStatus", map);
		return result;
	}

	
	//admin - 회원정보 상세조회
	public Member selectMemberDetailInfo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.selectMemberDetailInfo", userNo);
	}


	//admin - 회원상태 업데이트
	public int memberStatusUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.memberStatusUpdate", m);
	}


	//카카오 로그인
	public int insertKakaoUserInfo(SqlSessionTemplate sqlSession, Member member) {
	    return sqlSession.insert("memberMapper.insertKakaoUserInfo", member);
	}
}
