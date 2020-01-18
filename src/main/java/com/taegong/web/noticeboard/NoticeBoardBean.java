package com.taegong.web.noticeboard;

import java.sql.Date;

public class NoticeBoardBean {

	//게시글 번호
	private int tb_board_bno;
	//게시글 제목
	private String tb_board_subject;
	//게시글 아이디
	private String TB_member_ID;
	//게시글 이름
	private String TB_member_Name;
	//게시글 컨텐트
	private String tb_board_content;
	//작성한 날짜
	private Date tb_board_reg_date;
	//히트수
	private String tb_board_hit;
	
	private int tb_board_up;
	
	private int tb_board_down;

	private int tb_board_dec;
	
	private int tb_board_del_type;
	
	private Date tb_board_del_date;

	private int tb_board_type;

	public int getTb_board_bno() {
		return tb_board_bno;
	}

	public void setTb_board_bno(int tb_board_bno) {
		this.tb_board_bno = tb_board_bno;
	}

	public String getTb_board_subject() {
		return tb_board_subject;
	}

	public void setTb_board_subject(String tb_board_subject) {
		this.tb_board_subject = tb_board_subject;
	}

	public String getTB_member_ID() {
		return TB_member_ID;
	}

	public void setTB_member_ID(String tB_member_ID) {
		TB_member_ID = tB_member_ID;
	}

	public String getTB_member_Name() {
		return TB_member_Name;
	}

	public void setTB_member_Name(String tB_member_Name) {
		TB_member_Name = tB_member_Name;
	}

	public String getTb_board_content() {
		return tb_board_content;
	}

	public void setTb_board_content(String tb_board_content) {
		this.tb_board_content = tb_board_content;
	}

	public Date getTb_board_reg_date() {
		return tb_board_reg_date;
	}

	public void setTb_board_reg_date(Date tb_board_reg_date) {
		this.tb_board_reg_date = tb_board_reg_date;
	}

	public String getTb_board_hit() {
		return tb_board_hit;
	}

	public void setTb_board_hit(String tb_board_hit) {
		this.tb_board_hit = tb_board_hit;
	}

	public int getTb_board_up() {
		return tb_board_up;
	}

	public void setTb_board_up(int tb_board_up) {
		this.tb_board_up = tb_board_up;
	}

	public int getTb_board_down() {
		return tb_board_down;
	}

	public void setTb_board_down(int tb_board_down) {
		this.tb_board_down = tb_board_down;
	}

	public int getTb_board_dec() {
		return tb_board_dec;
	}

	public void setTb_board_dec(int tb_board_dec) {
		this.tb_board_dec = tb_board_dec;
	}

	public int getTb_board_del_type() {
		return tb_board_del_type;
	}

	public void setTb_board_del_type(int tb_board_del_type) {
		this.tb_board_del_type = tb_board_del_type;
	}

	public Date getTb_board_del_date() {
		return tb_board_del_date;
	}

	public void setTb_board_del_date(Date tb_board_del_date) {
		this.tb_board_del_date = tb_board_del_date;
	}

	public int getTb_board_type() {
		return tb_board_type;
	}

	public void setTb_board_type(int tb_board_type) {
		this.tb_board_type = tb_board_type;
	}

	
	
	

}
