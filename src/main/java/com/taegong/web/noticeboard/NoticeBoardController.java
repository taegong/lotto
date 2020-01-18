package com.taegong.web.noticeboard;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.taegong.web.board.BoardService;
import com.taegong.web.home.Criteria;
import com.taegong.web.home.PageMaker;


@Controller
public class NoticeBoardController {

	@Inject
	private NoticeBoardService noticeboardService;
	
	@Inject
	private BoardService boardService;
	private String uploadPath;
	//회원 게시판
		@RequestMapping(value = "/LotteNoticeBrd" , method = RequestMethod.GET)
			private String LoMember(Model model ,Criteria cri) {
				
				//페이징 처리용
				PageMaker pageMaker = new PageMaker();
				//페이지처리용
				pageMaker.setCri(cri);
				
				 try {
					 //페이징 처리 시작페이지
					 pageMaker.getStartPage();
					 System.out.println("시작페이지"+pageMaker.getStartPage());
					 
				
					 //페이지처리 하면서 리스트 가져 오기
					 List list =  noticeboardService.BoardList(cri);
					
					 //	총 개시물 갯수	
					 pageMaker.setTotalCount(noticeboardService.findTotalCount());
					 System.out.println(pageMaker.getStartPage());
						 
					 
					 //리스트로 넘기기
					 model.addAttribute("list", list);
					 model.addAttribute("pageMaker", pageMaker);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 return "NoticeBoard/NoticeBoard"; //생성할 jsp
		    }
			
		
		//글쓰기 페이지로 이동
				@RequestMapping(value = "/NoticeBoardInsert", method = RequestMethod.GET)
				private String TichuBoardInsert()
				{
					
					return "NoticeBoard/NoticeBoardInsert";
				}
				
				
				@RequestMapping(value = "/NoticeBoardInsertX", method = RequestMethod.POST)
				@ResponseBody
				public  Object  board_insertX(@RequestParam Map<String, Object> paramMap,String editor) {
					
					try {
						int result = 0;
//						System.out.println("아이디"+paramMap.get("TB_member_ID"));
//						System.out.println("이름"+paramMap.get("TB_member_Name"));
//						System.out.println("제목"+paramMap.get("tb_board_subject"));
//								System.out.println("컨텐트"+paramMap.get("tb_board_content"));
//								System.out.println("셀렉트"+paramMap.get("tb_board_type"));
//						//컨텐츠에 텍스트에어리가  DB 에 줄 바꿈이 안되서 줄 바꾸고 저장 하기 위한 리플레이스
//					 
//						System.out.println("아이디"+paramMap.get("TB_member_ID"));
//						System.out.println("이름"+paramMap.get("TB_member_Name"));
//						System.out.println("제목"+paramMap.get("tb_board_subject"));
						
//								System.out.println("컨텐트"+paramMap.get("tb_board_content"));
								System.out.println(result+":리저틀");
								
								if(paramMap.get("TB_member_ID").equals(""))
								{
									result = 0;
								}
								else if(paramMap.get("tb_board_type").equals(""))
								{
									result = 3;
								}
								else 
								{
									System.out.println("입력한다0:"+result);
									noticeboardService.InsertPointUp(paramMap);
									 result = noticeboardService.insertBoard(paramMap);
								}
								
						
								return result;

						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				
					
					return paramMap;
					
				}
				@RequestMapping(value = "/noticeboarddetail/{tb_board_bno}",method = RequestMethod.GET)
				public String BoardDetailPage(@PathVariable int tb_board_bno, Model model, NoticeBoardBean bean)
				{
					try {
							
						//게시글 번호값 가져와서 디테일 검색 하기
						model.addAttribute("tb_board_detail",noticeboardService.BoardDetail(tb_board_bno));
						//대댓글 리스트 tb_board_bno를기준으로 검색해옴
//						model.addAttribute("replylist",noticeboardService.replyBoardList(tb_board_bno));
						noticeboardService.Boardhits(tb_board_bno);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return "NoticeBoard/NoticeBoardDetail";
				}
				
				
				@RequestMapping(value = "/noticeboardupdate/{tb_board_bno}",method = RequestMethod.GET)
				public String BoardUpdatePage(@PathVariable int tb_board_bno , Model model)
				{
					
					try {
						System.out.println("====="+tb_board_bno);
						//게시글 번호값 받아와서 게시글 수정 페이지로 이동
						
						NoticeBoardBean bean = noticeboardService.BoardDetail(tb_board_bno);
						
						bean.setTb_board_content(bean.getTb_board_content().replace("<br />", "\n"));
						System.out.println(bean.getTB_member_Name()+"L 아이디");
						System.out.println(bean.getTB_member_ID()+"L 이름");
						System.out.println(bean.getTb_board_content()+"L 컨텐트");
						model.addAttribute("tb_board_update",bean);
						System.out.println("====="+tb_board_bno);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return "NoticeBoard/NoticeBoardUpdate";
				}
				
				@RequestMapping(value = "/noticeboard_updates", method = RequestMethod.POST)
				@ResponseBody
				public  Object  board_updates(@RequestParam Map<String, Object> paramMap) {
					
					try {
						
						//컨텐츠에 텍스트에어리가  DB 에 줄 바꿈이 안되서 줄 바꾸고 저장 하기 위한 리플레이스
						int result = 1;
						System.out.println("아이디"+paramMap.get("TB_member_ID"));
						System.out.println("게시글번호"+paramMap.get("tb_board_bno"));
						System.out.println("이름"+paramMap.get("TB_member_Name"));
						System.out.println("제목"+paramMap.get("tb_board_subject"));
								System.out.println("컨텐트"+paramMap.get("tb_board_content"));
								noticeboardService.BoardUpdate(paramMap);
								System.out.println("리절트"+result);
//							boardService.InsertPointUp(paramMap);
						
								return result;

						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				
					
					return paramMap;
					
				}
				
				@RequestMapping(value = "/notice_board_del", method = RequestMethod.POST)
				@ResponseBody
				public  Object  board_del(@RequestParam Map<String, Object> paramMap) {
					
					try {
						
						//컨텐츠에 텍스트에어리가  DB 에 줄 바꿈이 안되서 줄 바꾸고 저장 하기 위한 리플레이스
						int result = 1;
						
						noticeboardService.BoardDelete(paramMap);
								return result;

						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				
					
					return paramMap;
					
				}
				
				@RequestMapping(value = "/noticeboardUp",method = RequestMethod.POST)
				@ResponseBody
				public Object boardUp(@RequestParam Map<String, Object> paramMap)
				{
					int result =0;
					int CountResult = 0;
					if(paramMap.get("TB_member_ID").equals(""))
					{
						result =0;
					}
					else
					{
						CountResult = noticeboardService.BoardUpChk(paramMap);
						if(CountResult==0) {
							result = boardService.BoardUp(paramMap);
						}
						else {
							result =3;
						}
					 
					}
						
					return result;
				}
				
				@RequestMapping(value = "/noticeboardDown",method = RequestMethod.POST)
				@ResponseBody
				public Object boardDown(@RequestParam Map<String, Object> paramMap)
				{
					int result =0;
					int CountResult = 0;
					if(paramMap.get("TB_member_ID").equals(""))
					{
						result =0;
					}
					else
					{
						CountResult = noticeboardService.BoardUpChk(paramMap);
						if(CountResult==0) {
						 result = boardService.BoardDown(paramMap);
						}
						else {
							result =3;
						}
					}
					
					
						
					return result;
				
		}
}
