package com.taegong.web.member;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;



@Repository

public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberDAO memberDAO;
	
	@Inject
	private MemberService service;

	//회원가입 아이디 체크
	@Override
	public int memberidchk(Map<String, Object> paramMap) {
		System.out.println("아이디 체크 합니다.");
		return memberDAO.selectIDChk(paramMap);
	}
	//회원가입
	@Override
	public int MemberJoin(Map<String, Object> paramMap) {
		int  LoIdckh = service.memberidchk(paramMap);
		if(LoIdckh==0)
		{
			memberDAO.insertMember(paramMap);
			return LoIdckh;
		}
		else {
			System.out.println("가입 안됨");
			return LoIdckh;
		}
	}
	
	//회원로그인
	@Override
	public int MemberLogin(Map<String, Object> paramMap) {
		
			int loginchk = memberDAO.MemeberLogin(paramMap);
			if(loginchk == 0) {
				System.out.println("로그인실패");
			}else {
				System.out.println("로그인 성공");
			}
		return loginchk;
	}
	
	//로그인 하면 포인트 업
	@Override
	public void MemberPoint(Map<String, Object> paramMap) {
		System.out.println("포인트업");
		memberDAO.MemberLoginPointUp(paramMap);
		
	}
	//로그인 하면 회원정보 넘기기
	@Override
	public LottoMemberBean MemberInfo(Map<String, Object> paramMap) {
		System.out.println("회원정보");
		return memberDAO.MemberSelectInfo(paramMap);
	}
	
	//회원정보 수정
	@Override
	public int MemberUpdate(Map<String, Object> paramMap) {
		System.out.println("회원정보수정");
		return memberDAO.LottoMemberUpdate(paramMap);
	}
	
	//회원탈퇴
	@Override
	public void LottoRe(Map<String, Object> paramMap) {
	System.out.println("회원탈퇴");
	memberDAO.LottoMemberRe(paramMap);
		
	}



	

	
	

}