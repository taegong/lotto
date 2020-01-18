package com.taegong.web.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taegong.web.home.Criteria;
import com.taegong.web.member.*;
import com.taegong.web.noticeboard.NoticeBoardBean;

@Repository
public class BoardDAO{
	
	@Inject
	private SqlSessionTemplate ConSql;
	
	//공지사항 리스트
	public List<NoticeBoardBean> NoticeBoardList() {
		System.out.println("===> 공지게시판 리스트");
		return ConSql.selectList("NoticeboardMapper.NoticeBoardListIn");
	}
	
	 
	// 게시판 리스트
	public List<LottoBoardBean> BoardList(Criteria cri) {
		System.out.println("===> 게시판 리스트");
		return ConSql.selectList("BoardMapper.tichuBoardList", cri);
	}

	//게시글 총 페이지
	public int findTotalCount() {

		return ConSql.selectOne("BoardMapper.findTotalCount");
	}
	
	//게시글 쓰면 포인트 업
	public void insertPointUp(Map<String, Object> paramMap) {

		System.out.println("포인트 업");
		ConSql.update("MemberMapper.insertPointUp", paramMap);
	}
	//게시글 쓰기
	public int insertBoard(Map<String, Object> paramMap) {
		System.out.println("글쓰기");
		return ConSql.insert("BoardMapper.TichuboardInsert", paramMap);
	}
	
	//게시글 상세페이지
	public LottoBoardBean BoardDetail(int tb_board_bno) {
		System.out.println("===> 게시글 상세페이지 + 번호 :" + tb_board_bno);
		return (LottoBoardBean) ConSql.selectOne("BoardMapper.TichuboardDetail", tb_board_bno);
	}
	
	
	//게시글 업데이트 
	public void BoardUpdate(Map<String, Object> paramMap) {
		System.out.println(paramMap.get("tb_board_content")+"123");
		System.out.println("===> 게시글 업데이트");
		ConSql.update("BoardMapper.tichuBoardUpdate", paramMap);
	}
	
	//게시글 삭제
	public void BoardDelete(Map<String, Object> paramMap) {
		System.out.println("===> 게시글 삭제해버렷!");
		ConSql.delete("BoardMapper.tichuBoardDelete", paramMap);
	}
	
	//히트수 업데이트
	public void BoardHits(int tb_board_bno) {
		System.out.println("hithit");
		ConSql.update("BoardMapper.BoardHit",tb_board_bno);
	}
	//댓글 입력
	public void regReply(Map<String, Object> paramMap) {
		System.out.println("대글 입력");
		ConSql.insert("BoardMapper.insertBoardReply", paramMap);
	}
	//대댓글 입력
	public void insertBoardReReply(Map<String, Object> paramMap)
	{
		System.out.println("대댓글 입력");
		ConSql.insert("BoardMapper.insertBoardReReply",paramMap);
	}
	
	//댓글 대댓글 리스트 가져 오기
	public List<TichuBoardReplyBean> replyList(int tb_board_bno) {
		
		System.out.println("댓글 대댓글 리스트");
		return ConSql.selectList("BoardMapper.replyBoardList", tb_board_bno);
	}
	
	//댓글 삭제
	public int delReply(Map<String, Object> paramMap) {
		System.out.println("댓글 삭제");
	 return ConSql.delete("BoardMapper.deleteBoardReply", paramMap);
	 
	}
	
	//대댓글 삭제
	public void delreplydel(Map<String, Object> paramMap)
	{
		System.out.println("대댓글 삭제");
		ConSql.delete("BoardMapper.deleteBoardReplyDE",paramMap);
	}
	
	public void pointUpdate(LottoBoardBean bean) {
		System.out.println("포인트업"+bean.getTb_board_bno());
		ConSql.update("BoardMapper.writeUpdate",bean);
	}
	
	//리플 수정을 위해서 컨턴츠 가져오기
	public Map<String, Object> bordreplyupdate(Map<String, Object> paramMap)
	{
		System.out.println("댓글 컨텐츠");

		return ConSql.selectOne("BoardMapper.replyUpdate",paramMap);
	}
	//대댓글 수정
	public void boardreUpdateput(Map<String, Object> paramMap) {
		System.out.println("대댓글 수정");

		ConSql.update("BoardMapper.replyUpdatesPut",paramMap);
	}
	//댓글 삭제
	public int boardDeleteReply(Map<String, Object> paramMap) {
		System.out.println("댓글삭제");

		return ConSql.selectOne("BoardMapper.boardDeletereplyCount",paramMap);
	}
	//대댓글 삭제
	public void boardDeleteReplydel(Map<String, Object> paramMap) {
		System.out.println("대댓글 삭제");
		ConSql.delete("BoardMapper.boardDeleteReplyDel",paramMap);
	}
	//게시글 좋아여
	public int boardUp( Map<String, Object> paramMap) {
		System.out.println("좋아요");

		return ConSql.insert("BoardMapper.boardUp",paramMap);
	}
	//게시글 싫어요
	public int boardDown( Map<String, Object> paramMap) {
		System.out.println("싫어요");

		return ConSql.insert("BoardMapper.boardDown",paramMap);
	}
	//게시글 좋아요 갯수
	public int boardUpCount(LottoBoardBean bean) {
		System.out.println("좋아요갯수");
		return ConSql.selectOne("BoardMapper.boardUpCount",bean);
	}
	//게시글 싫어 갯수
	public int boardDownCount(LottoBoardBean bean) {
		System.out.println("싫어요갯수");
		return ConSql.selectOne("BoardMapper.boardDownCount",bean);
	}
	//동일한 아이디로 좋아요 혹은 싫어 할수 없게 체크
	public int boardUpChk( Map<String, Object> paramMap) {
		System.out.println("갯수 카운트");
		return ConSql.selectOne("BoardMapper.boardUPChk",paramMap);
	}
	
	
}


