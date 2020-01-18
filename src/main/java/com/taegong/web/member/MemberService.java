package com.taegong.web.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


@Service
public interface MemberService {
	
//	//회원가입
//	void insertMember(TichuMemberBean bean);
	
	//아이디 중복체크
	int memberidchk(Map<String, Object> paramMap);
	//회원가입
	int MemberJoin(Map<String, Object> paramMap);
	//회원로그인
	int MemberLogin(Map<String, Object> paramMap);
	//로그인 시 포인트업
	void MemberPoint(Map<String, Object> paramMap);
	//로그인 하면 회원정보 넘기기
	LottoMemberBean MemberInfo(Map<String, Object> paramMap);
	//회원정보수정
	int MemberUpdate(Map<String, Object> paramMap);
	//회원탈퇴
	void LottoRe(Map<String, Object> paramMap);
	
	
}