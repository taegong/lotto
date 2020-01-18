package com.taegong.web.member;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class LottoMemberController {
	
	@Inject
	private MemberService memberservice;
	//회원로그인
	@RequestMapping(value = "/LotteMbr" , method = RequestMethod.GET)
	public String LoMember() {
		
		return "LoMember/LomemberMain";
	}
	 
	//아이디체크
	
	@RequestMapping(value = "/LottoIdchk", method = RequestMethod.POST)
	@ResponseBody
	public  Object  Idchk(@RequestParam Map<String, Object> paramMap) {
		int  LoIdckh = memberservice.memberidchk(paramMap);
		
		
		System.out.println(paramMap.get("TB_member_ID")+":  아이디 넘오옴?");
		
		return LoIdckh;
	}
	
	//회원가입
	@RequestMapping(value = "/LottoJoin", method = RequestMethod.POST)
	@ResponseBody
	public  Object  LottoJoin(@RequestParam Map<String, Object> paramMap) {
			int LoIdckh = memberservice.MemberJoin(paramMap);
			System.out.println(LoIdckh+":값");
			return LoIdckh;
		}
	
	//회원 로그인
	@RequestMapping(value = "/LottoLogin", method = RequestMethod.POST)
	@ResponseBody
	public  Object  LottoLogin(@RequestParam Map<String, Object> paramMap, HttpSession session) {
		

			
		System.out.println("아이디 : "+paramMap.get("TB_member_ID"));
		System.out.println("패스워드 : "+paramMap.get("TB_member_Password"));
			
			int loginchk = memberservice.MemberLogin(paramMap);
			System.out.println("아이티체크 : "+loginchk);
			if(loginchk==0)
			{
				return loginchk;
			}else if(loginchk==1) {
				
				memberservice.MemberPoint(paramMap);
				session.setAttribute("memberinfo", memberservice.MemberInfo(paramMap));
				return loginchk;
				
				
			}else {
				
				return loginchk;
			}
			
		}
		
	
	
		
	//회원정보 수정을 위한 비밀번호 체크
	@RequestMapping(value = "/LottoPchk", method = RequestMethod.GET)
	public  String  LottoPchk() {
				return "LoMember/LomemberPwd";
			
		}
	//회원탈퇴
	@RequestMapping(value = "/LottoPchkRe", method = RequestMethod.GET)
	public  String  LottoPchkRe() {
				return "LoMember/LomemberRePwd";
			
		}
	//비밀번호 체크
	@RequestMapping(value = "/LottoPchkOk", method = RequestMethod.POST)
	@ResponseBody
	public  Object  LottoPchkOk(@RequestParam Map<String, Object> paramMap, Model model) {
		

			
		int loginchk = memberservice.MemberLogin(paramMap);
		if(loginchk==0)
		{
			return loginchk;
		}else if(loginchk==1) {
			model.addAttribute("memberinfo", memberservice.MemberInfo(paramMap));
			return loginchk;
			
			
		}else {
			return loginchk;
		}
			
		}
	//회원탈퇴
	@RequestMapping(value = "/LottoMemberRe", method = RequestMethod.POST)
	@ResponseBody
	public  Object  LottoMemberRe(@RequestParam Map<String, Object> paramMap, Model model ,HttpSession session) {
		

			
		int loginchk = memberservice.MemberLogin(paramMap);
		if(loginchk==0)
		{
			return loginchk;
		}else if(loginchk==1) {
			memberservice.LottoRe(paramMap);
			session.removeAttribute("memberinfo");
			return loginchk;
			
			
		}else {
			return loginchk;
		}
			
		}
	
	
	
	
		
	//회원가입
	@RequestMapping(value = "/LotteMbj" , method = RequestMethod.GET)
	public String LoMemberJoin() {
		
		return "LoMember/LomemberJoin";
	}
	
	//회원수정
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.GET)
	public String LottoMemberUpdate() {
		System.out.println("123");
		return "LoMember/LomemberUpdate";
	}
	
	
	
	
	@RequestMapping(value = "/LottoUpdateOk", method = RequestMethod.POST)
	@ResponseBody
	public  Object  LottoUpdateOk(@RequestParam Map<String, Object> paramMap, Model model) {
		

		System.out.println("아이디는 : "+paramMap.get("TB_member_ID"));
		System.out.println("아이디는 : "+paramMap.get("TB_member_Name"));
		System.out.println("아이디는 : "+paramMap.get("TB_member_Email"));
		System.out.println("아이디는 : "+paramMap.get("TB_member_Message"));
		int loginchk = memberservice.MemberUpdate(paramMap);
		if(loginchk==1)
		{
			System.out.println("업데이트 성공");
			return loginchk;
			
		}else {
			return loginchk;
		}
			
		}
	
	
	@RequestMapping(value = "/wrlist", method = RequestMethod.GET)
	public String Wrlist() {
		return "";
	}
	@RequestMapping(value = "/logout",  method = RequestMethod.GET)

	public String LottoLogout(HttpSession session) {
		session.removeAttribute("memberinfo");
//		session.invalidate();
		return "redirect:/";
	}
	
}
