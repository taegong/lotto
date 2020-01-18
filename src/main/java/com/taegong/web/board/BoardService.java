package com.taegong.web.board;

import java.util.List;

import com.taegong.web.home.Criteria;
import com.taegong.web.member.*;
import com.taegong.web.noticeboard.NoticeBoardBean;

import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
@Service
public interface BoardService {
	//공지사항 리스트
	
	List<NoticeBoardBean> NoticeBoardList();
	//게시글 리스트
	List<LottoBoardBean> BoardList(Criteria cri);

	//게시글 총페이지
	int findTotalCount();

	//게시글 쓰기
	int insertBoard(Map<String, Object> paramMap) throws Exception;

	//게시글 상세
	LottoBoardBean BoardDetail(int tb_board_bno);

	//게시글 수정
	void BoardUpdate(Map<String, Object> paramMap);

	//게시글 삭제
	void BoardDelete(Map<String, Object> paramMap);

	//게시글 포인트업
	void InsertPointUp(Map<String, Object> paramMap);
	
	//히트수 
	void Boardhits(int tb_board_bno);
	
	//게시글 댓글
	void boardreply(Map<String, Object> paramMap);
	
	//대댓글
	void boardRereply(Map<String, Object> paraMap);
	
	//댓글 리스트
	List<TichuBoardReplyBean> replyBoardList(int tb_board_bno);
	
	//댓글 삭제
	int delReply(Map<String, Object> paramMap);
	
	//대댓글 삭제
	void delReplydel(Map<String, Object> paramMap);
	//댓글 수정을 위해 컨텐츠
	Map<String, Object> replyUpdate(Map<String, Object> paramMap);
	//댓글 수정
	void replyUpdatePut (Map<String, Object> paramMap);
	//댓글 삭제
	int boardDeleteReply(Map<String, Object> paramMap);
	//대댓글 삭제
	void boardDelteReplydel(Map<String, Object> paramMap);
	//좋아요
	int BoardUp(Map<String, Object> paramMap);
	//싫어요
	int BoardDown(Map<String, Object> paramMap);
	//같은 아이디로 중복체크
	int BoardUpChk(Map<String, Object> paramMap);
}
