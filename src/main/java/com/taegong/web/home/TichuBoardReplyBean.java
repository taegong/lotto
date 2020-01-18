package com.taegong.web.home;

import java.sql.Date;

public class TichuBoardReplyBean {
	//리플 인덱스값
	private String reply_id;
	//댓글 달리는 글 번호값
	private int tb_board_bno;
	
	//대댓글 달리면 댓글 인덱스 값 아니면 자신의 인덱스 값
	private String parent_id;
	//대댓인지 아닌지 판단하는 값
	private String depth;
	//댓글 달리는 컨텐츠
	private String reply_content;
	//댓글 쓴 사람 이름
	private String TB_member_Name;
	private Date register_datetime;
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public int getTb_board_bno() {
		return tb_board_bno;
	}
	public void setTb_board_bno(int tb_board_bno) {
		this.tb_board_bno = tb_board_bno;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getTB_member_Name() {
		return TB_member_Name;
	}
	public void setTB_member_Name(String tB_member_Name) {
		TB_member_Name = tB_member_Name;
	}
	public Date getRegister_datetime() {
		return register_datetime;
	}
	public void setRegister_datetime(Date register_datetime) {
		this.register_datetime = register_datetime;
	}
	
	
}
