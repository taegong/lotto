package com.taegong.web.noticeboard;

import java.util.List;

import com.taegong.web.home.Criteria;
import com.taegong.web.member.*;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
@Service
public interface NoticeBoardService {
	
	//게시글 리스트
	List<NoticeBoardBean> BoardList(Criteria cri);

	//게시글 총페이지
	int findTotalCount();

	//게시글 쓰기
	int insertBoard(Map<String, Object> paramMap) throws Exception;

	//게시글 상세
	NoticeBoardBean BoardDetail(int tb_board_bno);

	//게시글 수정
	void BoardUpdate(Map<String, Object> paramMap);

	//게시글 삭제
	void BoardDelete(Map<String, Object> paramMap);

	//게시글 포인트업
	void InsertPointUp(Map<String, Object> paramMap);
	
	//히트수 
	void Boardhits(int tb_board_bno);
	int BoardUpChk(Map<String, Object> paramMap);
}
