package com.taegong.web.member;

import java.sql.Date;

public class TichuMemberBean {
	//멤버 아이디
	private String TB_member_ID;
	//멤버 포인트
    private int TB_member_Rank_point;
    //멤버 비밀번호
	private String TB_member_Password;
	//멤버 이메일
	private String TB_member_Email;
	//멤버 이름
	private String TB_member_Name;
	//멤버 탈퇴및 관리자 판단 
	private String TB_member_YN;
	//가입 메세지
	private String TB_member_Message;
	//멤버 레벨
	private String TB_member_Rank_Level;
	//수정하게 되면 수정 날짜
	private String TB_member_Update_date;
	//멤버 로그인 날짜
	private Date TB_member_DATE;
	//멤버 회원가입 날짜
	private Date TB_member_Join_date;
	//회원 탈퇴 날짜
	private Date TB_member_Re_date;

	public String getTB_member_ID() {
		return TB_member_ID;
	}

	public void setTB_member_ID(String tB_member_ID) {
		TB_member_ID = tB_member_ID;
	}

	public int getTB_member_Rank_point() {
		return TB_member_Rank_point;
	}

	public void setTB_member_Rank_point(int tB_member_Rank_point) {
		TB_member_Rank_point = tB_member_Rank_point;
	}

	public String getTB_member_Password() {
		return TB_member_Password;
	}

	public void setTB_member_Password(String tB_member_Password) {
		TB_member_Password = tB_member_Password;
	}

	public String getTB_member_Email() {
		return TB_member_Email;
	}

	public void setTB_member_Email(String tB_member_Email) {
		TB_member_Email = tB_member_Email;
	}

	public String getTB_member_Name() {
		return TB_member_Name;
	}

	public void setTB_member_Name(String tB_member_Name) {
		TB_member_Name = tB_member_Name;
	}

	public String getTB_member_YN() {
		return TB_member_YN;
	}

	public void setTB_member_YN(String tB_member_YN) {
		TB_member_YN = tB_member_YN;
	}

	public String getTB_member_Message() {
		return TB_member_Message;
	}

	public void setTB_member_Message(String tB_member_Message) {
		TB_member_Message = tB_member_Message;
	}

	public String getTB_member_Rank_Level() {
		return TB_member_Rank_Level;
	}

	public void setTB_member_Rank_Level(String tB_member_Rank_Level) {
		TB_member_Rank_Level = tB_member_Rank_Level;
	}

	public String getTB_member_Update_date() {
		return TB_member_Update_date;
	}

	public void setTB_member_Update_date(String tB_member_Update_date) {
		TB_member_Update_date = tB_member_Update_date;
	}

	public Date getTB_member_DATE() {
		return TB_member_DATE;
	}

	public void setTB_member_DATE(Date tB_member_DATE) {
		TB_member_DATE = tB_member_DATE;
	}

	public Date getTB_member_Join_date() {
		return TB_member_Join_date;
	}

	public void setTB_member_Join_date(Date tB_member_Join_date) {
		TB_member_Join_date = tB_member_Join_date;
	}

	public Date getTB_member_Re_date() {
		return TB_member_Re_date;
	}

	public void setTB_member_Re_date(Date tB_member_Re_date) {
		TB_member_Re_date = tB_member_Re_date;
	}
	
	
}
