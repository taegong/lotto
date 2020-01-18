package com.taegong.web.noticeboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.taegong.web.home.Criteria;
@Repository

public class NoticeBoardServiceImpl implements NoticeBoardService{
//
	@Inject
	private NoticeBoardDAO boardDAO;
	//회원가입 아이디 중복체크
//	
//	
	// 게시판 리스트
	@Override
	public List<NoticeBoardBean> BoardList(Criteria cri) {
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
	public NoticeBoardBean BoardDetail(int tb_board_bno) {
		System.out.println("게시글 상세페이지" + tb_board_bno);
		NoticeBoardBean bean = new NoticeBoardBean();
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


	@Override
	public int BoardUpChk(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return boardDAO.boardUpChk(paramMap);
	}
	

}