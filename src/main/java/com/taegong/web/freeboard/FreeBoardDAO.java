package com.taegong.web.freeboard;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taegong.web.board.LottoBoardBean;
import com.taegong.web.home.Criteria;
import com.taegong.web.member.*;
import com.taegong.web.noticeboard.NoticeBoardBean;

@Repository
public class FreeBoardDAO{
	
	@Inject
	private SqlSessionTemplate ConSql;
	
	//	공지 리스트
	
	public List<NoticeBoardBean> NoticeBoardList() {
		return ConSql.selectList("NoticeboardMapper.FreeBoardList");
	}

	 
	// 게시판 리스트
	public List<FreeBoardBean> BoardList(Criteria cri) {
		System.out.println("===> 게시판 리스트"+cri.getPageStart()+"1:"+cri.getPerPageNum());
		return ConSql.selectList("FreeboardMapper.freeBoardList", cri);
	}

	//게시글 총 페이지
	public int findTotalCount() {

		return ConSql.selectOne("FreeboardMapper.findTotalCount");
	}
	
	//게시글 쓰면 포인트 업
	public void insertPointUp(Map<String, Object> paramMap) {

		System.out.println("포인트 업");
		ConSql.update("MemberMapper.insertPointUp", paramMap);
	}
	//게시글 쓰기
	public int insertBoard(Map<String, Object> paramMap) {
		System.out.println("글쓰기");
		return ConSql.insert("FreeboardMapper.freeboardInsert", paramMap);
	}
	
	//게시글 상세페이지
	public FreeBoardBean BoardDetail(int tb_board_bno) {
		System.out.println("===> 게시글 상세페이지 + 번호 :" + tb_board_bno);
		return (FreeBoardBean) ConSql.selectOne("FreeboardMapper.freeboardDetail", tb_board_bno);
	}
	
	//게시글 업데이트 
		public void BoardUpdate(Map<String, Object> paramMap) {
			System.out.println(paramMap.get("tb_board_content")+"123");
			System.out.println("===> 게시글 업데이트");
			ConSql.update("FreeboardMapper.freeBoardUpdate", paramMap);
		}
	
	
	//게시글 삭제
	public void BoardDelete(Map<String, Object> paramMap) {
		System.out.println("===> 게시글 삭제해버렷!");
		ConSql.delete("FreeboardMapper.freeBoardDelete", paramMap);
	}
	
	//히트수 업데이트
	public void BoardHits(int tb_board_bno) {
		System.out.println("hithit");
		ConSql.update("FreeboardMapper.BoardHit",tb_board_bno);
	}
	//댓글 입력
	public void regReply(Map<String, Object> paramMap) {
		System.out.println("대글 입력");
		ConSql.insert("FreeboardMapper.FreeinsertBoardReply", paramMap);
	}
	//대댓글 입력
	public void insertBoardReReply(Map<String, Object> paramMap)
	{
		System.out.println("대댓글 입력");
		ConSql.insert("FreeboardMapper.FreeinsertBoardReReply",paramMap);
	}
	
	//댓글 대댓글 리스트 가져 오기
	public List<FreeBoardReplyBean> replyList(int tb_board_bno) {
		
		System.out.println("댓글 대댓글 리스트");
		return ConSql.selectList("FreeboardMapper.FreereplyBoardList", tb_board_bno);
	}
	
	//댓글 삭제
	public int delReply(Map<String, Object> paramMap) {
		System.out.println("댓글 삭제");
	 return ConSql.delete("FreeboardMapper.freedeleteBoardReply", paramMap);
	 
	}
	//리플 수정을 위한 컨텐츠
	public Map<String, Object> bordreplyupdate(Map<String, Object> paramMap)
	{
		return ConSql.selectOne("FreeboardMapper.freereplyUpdate",paramMap);
	}
	//리플 수정
	public void boardreUpdateput(Map<String, Object> paramMap) {
		ConSql.update("FreeboardMapper.freereplyUpdatesPut",paramMap);
	}
	//좋아요
	public int boardUpCount(FreeBoardBean bean) {
		System.out.println("카운트DAO");
		return ConSql.selectOne("FreeboardMapper.FreeboardUpCount",bean);
	}
	//싫어오
	public int boardDownCount(FreeBoardBean bean) {
		System.out.println("카운트DAO");
		return ConSql.selectOne("FreeboardMapper.FreeboardDownCount",bean);
	}
	//싫어요 좋아요 중복체크
	public int boardUpChk( Map<String, Object> paramMap) {
		return ConSql.selectOne("FreeboardMapper.FreeboardUPChk",paramMap);
	}
}


