package com.taegong.web.member;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class MemberDAO{
	
	@Inject
	private SqlSessionTemplate ConSql;
	
	//회원가입 dao
	public int insertMember(Map<String, Object> paramMap) {
		
		String mss = (String) paramMap.get("TB_member_Message");
		String mssReplace =  mss.replace("\r\n", "<br>");
		paramMap.put("TB_member_Message", mssReplace);
		System.out.println("===> 회원가입");
		return ConSql.insert("MemberMapper.insertMember", paramMap);
	}
	
	//아이디 중복체크
	public int selectIDChk(Map<String, Object> paramMap) {
		System.out.println("===> 아이디 체크");
		
		return ConSql.selectOne("MemberMapper.memberidchk", paramMap);
	}
	//로그인 아이디 체크
	public int MemeberLogin(Map<String, Object> paramMap) {
		System.out.println("로그인 체크");
		
		return ConSql.selectOne("MemberMapper.memberLogin",paramMap);
	}
	
	//로그인 포이트 업
	public void MemberLoginPointUp(Map<String, Object> paramMap) {
		ConSql.selectOne("MemberMapper.insertPointUp",paramMap);
	}
	//로그인후 세션값 넘기기
	public LottoMemberBean MemberSelectInfo(Map<String, Object> paramMap) {
		System.out.println(":==:"); 
		return (LottoMemberBean)ConSql.selectOne("MemberMapper.selectmember",paramMap);
	}
	
	//회원정보수정
	public int LottoMemberUpdate(Map<String, Object> paramMap) {
		return ConSql.update("MemberMapper.memberBoardUpdate",paramMap);
	}
	
	//회원탈퇴
	public void LottoMemberRe(Map<String, Object> paramMap) {
		 ConSql.update("MemberMapper.memberRetirement",paramMap);
	}
	 
	
}