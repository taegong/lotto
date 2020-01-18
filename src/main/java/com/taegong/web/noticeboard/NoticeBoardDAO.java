package com.taegong.web.noticeboard;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.taegong.web.freeboard.FreeBoardBean;
import com.taegong.web.home.Criteria;
import com.taegong.web.member.*;

@Repository
public class NoticeBoardDAO{
	
	@Inject
	private SqlSessionTemplate ConSql;
	
	 
	// 게시판 리스트
	public List<NoticeBoardBean> BoardList(Criteria cri) {
		System.out.println("===> 게시판 리스트");
		return ConSql.selectList("NoticeboardMapper.NoticeBoardList", cri);
	}

	//게시글 총 페이지
	public int findTotalCount() {

		return ConSql.selectOne("NoticeboardMapper.findTotalCount");
	}
	
	//게시글 쓰면 포인트 업
	public void insertPointUp(Map<String, Object> paramMap) {

		System.out.println("포인트 업");
		ConSql.update("MemberMapper.insertPointUp", paramMap);
	}
	//게시글 쓰기
	public int insertBoard(Map<String, Object> paramMap) {
		System.out.println("글쓰기");
		return ConSql.insert("NoticeboardMapper.noticeboardInsert", paramMap);
	}
	
	//게시글 상세페이지
	public NoticeBoardBean BoardDetail(int tb_board_bno) {
		System.out.println("===> 게시글 상세페이지 + 번호 :" + tb_board_bno);
		return (NoticeBoardBean) ConSql.selectOne("NoticeboardMapper.noticeboardDetail", tb_board_bno);
	}
	
	//게시글 업데이트 
		public void BoardUpdate(Map<String, Object> paramMap) {
			System.out.println(paramMap.get("tb_board_content")+"123");
			System.out.println("===> 게시글 업데이트");
			ConSql.update("NoticeboardMapper.noticeBoardUpdate", paramMap);
		}
	
	//게시글 삭제
	public void BoardDelete(Map<String, Object> paramMap) {
		System.out.println("===> 게시글 삭제해버렷!");
		ConSql.delete("NoticeboardMapper.noticeBoardDelete", paramMap);
	}
	
	//히트수 업데이트
	public void BoardHits(int tb_board_bno) {
		System.out.println("hithit");
		ConSql.update("NoticeboardMapper.BoardHit",tb_board_bno);
	}
	
	public int boardUp( Map<String, Object> paramMap) {
		return ConSql.update("NoticeboardMapper.boardUp",paramMap);
	}
	
	public int boardDown( Map<String, Object> paramMap) {
		return ConSql.update("NoticeboardMapper.boardDown",paramMap);
	}
	
	public int boardUpCount(NoticeBoardBean bean) {
		System.out.println("카운트DAO");
		return ConSql.selectOne("NoticeboardMapper.NoticeboardUpCount",bean);
	}
	
	public int boardDownCount(NoticeBoardBean bean) {
		System.out.println("카운트DAO");
		return ConSql.selectOne("NoticeboardMapper.NoticeboardDownCount",bean);
	}
	
	public int boardUpChk( Map<String, Object> paramMap) {
		return ConSql.selectOne("NoticeboardMapper.NoticeboardUPChk",paramMap);
	}
}


