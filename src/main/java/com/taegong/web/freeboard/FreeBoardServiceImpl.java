package com.taegong.web.freeboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.taegong.web.home.Criteria;
import com.taegong.web.noticeboard.NoticeBoardBean;
@Repository

public class FreeBoardServiceImpl implements FreeBoardService{
//
	@Inject
	private FreeBoardDAO boardDAO;
	//	공지리스트
	@Override
	public List<NoticeBoardBean> NoticeList() {
		System.out.println("서비스");
		return boardDAO.NoticeBoardList();
	}
	
	// 게시판 리스트
	@Override
	public List<FreeBoardBean> BoardList(Criteria cri) {
		System.out.println("서비스");
		return boardDAO.BoardList(cri);
	}
	
	//게시글 총 페이지
	@Override
	public int findTotalCount() {

		return boardDAO.findTotalCount();
	}
	
	//게시글 쓰기
	@Override
	public int insertBoard(Map<String, Object> paramMap) throws Exception{
		System.out.println("글쓰기");
		return boardDAO.insertBoard(paramMap);
	}
	
	//게시글 상세
	@Override
	public FreeBoardBean BoardDetail(int tb_board_bno) {
		System.out.println("게시글 상세페이지" + tb_board_bno);
		FreeBoardBean bean = new FreeBoardBean();
		bean = boardDAO.BoardDetail(tb_board_bno);
		bean.setTb_board_up(boardDAO.boardUpCount(bean));
		bean.setTb_board_down(boardDAO.boardDownCount(bean));
		return bean;
	}
	
	//게시글 수정
	@Override
	public void BoardUpdate(Map<String, Object> paramMap) {
		System.out.println("게시글수정 합니다.");
		boardDAO.BoardUpdate(paramMap);
	}
	
	//게시글 삭제
	@Override
	public void BoardDelete(Map<String, Object> paramMap) {
		
		System.out.println("게시글 삭제 합니다.");
		boardDAO.BoardDelete(paramMap);
	}
	
	//게시글 포인트 업
	@Override
	public void InsertPointUp(Map<String, Object> paramMap) {
		
		System.out.println("포인트 업업");
		boardDAO.insertPointUp(paramMap);

	}
	
	//게시글 히트업
	@Override
	public void Boardhits(int tb_board_bno) {
		System.out.println("hithit");
		boardDAO.BoardHits(tb_board_bno);
	}
	
	//댓글
	@Override 
	public void boardreply(Map<String, Object> paramMap)
	{
		boardDAO.regReply(paramMap);
	}
	//댓글 리스트
	@Override
	public List<FreeBoardReplyBean> replyBoardList(int tb_board_bno) {
		
		System.out.println("댓글 리스트");
		return boardDAO.replyList(tb_board_bno);
	}
	//대댓글
	@Override
	public void boardRereply(Map<String, Object> paramMap) {
		boardDAO.insertBoardReReply(paramMap);
	}
	
	//댓글 삭제
	@Override
	public int delReply(Map<String, Object> paramMap) {
		System.out.println("댓글 삭제");
		 return boardDAO.delReply(paramMap);
	}
	//댓글 수정을 위한 컨텐트 불러오기
	@Override
	public Map<String, Object> replyUpdate(Map<String, Object> paramMap) {
		System.out.println("댓글 수정을 위한 컨텐트 불러오기");
		return boardDAO.bordreplyupdate(paramMap);
	}
	//댓글 수정
	@Override
	public void replyUpdatePut(Map<String, Object> paramMap) {
		System.out.println("댓글 수정");
		boardDAO.boardreUpdateput(paramMap);
	}
	
	//좋아요 중복체크
	@Override
	public int BoardUpChk(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.boardUpChk(paramMap);
	}

	

}