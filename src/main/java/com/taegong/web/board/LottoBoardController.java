package com.taegong.web.board;

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

import com.taegong.web.home.Criteria;
import com.taegong.web.home.PageMaker;


@Controller
public class LottoBoardController {

	@Inject
	private BoardService boardService;
	private String uploadPath;
	//회원 게시판
		@RequestMapping(value = "/LotteBrd" , method = RequestMethod.GET)
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
					 List list =  boardService.BoardList(cri);
					
					 List noticelist = boardService.NoticeBoardList();
					 //	총 개시물 갯수	
					 pageMaker.setTotalCount(boardService.findTotalCount());
					 System.out.println(pageMaker.getStartPage());
						 
					 
					 //리스트로 넘기기
					 model.addAttribute("noticelist",noticelist);
					 model.addAttribute("list", list);
					 model.addAttribute("pageMaker", pageMaker);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 return "LoBoard/LoBoard"; //생성할 jsp
		    }
			
		
		//글쓰기 페이지로 이동
				@RequestMapping(value = "/board_insert", method = RequestMethod.GET)
				private String TichuBoardInsert()
				{
					
					return "LoBoard/LoBoardInsert";
				}
				
				
				@RequestMapping(value = "/board_insertX", method = RequestMethod.POST)
				@ResponseBody
				public  Object  board_insertX(@RequestParam Map<String, Object> paramMap,String editor) {
					
					try {
						
								System.out.println("컨텐트"+paramMap.get("tb_board_content"));
						//컨텐츠에 텍스트에어리가  DB 에 줄 바꿈이 안되서 줄 바꾸고 저장 하기 위한 리플레이스
						int result = boardService.insertBoard(paramMap);
								//아이디가 없으면 로그인 하라는 알럿창 띠우기 위해 result 값 변경
								if(paramMap.get("TB_member_ID").equals(""))
								{
									result = 0;
								}
								else 
								{
									//아이디가 있으면 게시글 저장
									boardService.InsertPointUp(paramMap);
								}
								
								return result;

						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				
					
					return paramMap;
					
				}
				


				//디테일 페이지
				@RequestMapping(value = "/boarddetail/{tb_board_bno}",method = RequestMethod.GET)
				public String BoardDetailPage(@PathVariable int tb_board_bno, Model model, LottoBoardBean bean)
				{
					try {
						//게시글 번호값 가져와서 디테일 검색 하기
						model.addAttribute("tb_board_detail",boardService.BoardDetail(tb_board_bno));
						//대댓글 리스트 tb_board_bno를기준으로 검색해옴
						model.addAttribute("replylist",boardService.replyBoardList(tb_board_bno));
						boardService.Boardhits(tb_board_bno);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return "LoBoard/LoBoardDetail";
				}
				
				
				@RequestMapping(value = "/boardupdate/{tb_board_bno}",method = RequestMethod.GET)
				public String BoardUpdatePage(@PathVariable int tb_board_bno , Model model)
				{
					
					try {
						//게시글 번호값 받아와서 게시글 수정 페이지로 이동
						
						LottoBoardBean bean = boardService.BoardDetail(tb_board_bno);
						
						bean.setTb_board_content(bean.getTb_board_content().replace("<br />", "\n"));
						model.addAttribute("tb_board_update",bean);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return "LoBoard/LoBoardUpdate";
				}
				//글 수정
				@RequestMapping(value = "/board_updates", method = RequestMethod.POST)
				@ResponseBody
				public  Object  board_updates(@RequestParam Map<String, Object> paramMap) {
					
					try {
						
						//컨텐츠에 텍스트에어리가  DB 에 줄 바꿈이 안되서 줄 바꾸고 저장 하기 위한 리플레이스
						int result = 1;
								boardService.BoardUpdate(paramMap);
						
								return result;

						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				
					
					return paramMap;
					
				}
				//글 삭제
				@RequestMapping(value = "/board_del", method = RequestMethod.POST)
				@ResponseBody
				public  Object  board_del(@RequestParam Map<String, Object> paramMap) {
					
					try {
						
						int result = 1;
						
						boardService.BoardDelete(paramMap);
						
								return result;

						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				
					
					return paramMap;
					
				}
				//댓글 저장
				@RequestMapping(value = "/reply/save", method = RequestMethod.POST)
				@ResponseBody
				public Object replyboardinsert( @RequestParam Map<String, Object> paramMap) {
					
					//ajax로 Map 데이터를 실어서 보내면 그 기준으로 댓글 쓰고 다시 그 페이지로 돌려 주기
					boardService.boardreply(paramMap);
					return paramMap;
				}
				//댓글삭제
				@RequestMapping(value = "/reply/del",method = RequestMethod.POST)
				@ResponseBody
				public Object replyDelte(@RequestParam Map<String, Object> paramMap)
				{
					
					//글번호와 아이디로 일치하면 삭제 후 1 아니면 0을 반환
					int result = boardService.delReply(paramMap);
					// result 값이 1 이면 대댓글도 같이 삭제 대댓글이 없을시에 댓글만 삭제
					if(result == 1)
					{
						System.out.println("삭제");
						boardService.delReplydel(paramMap);
					}
					//아니면 둘자 삭제 안함
					else {
						System.out.println("0s");
					}
					
						
					return result;
				}
				//대댓글 저장
				@RequestMapping(value = "/Rereply/save", method = RequestMethod.POST)
				@ResponseBody
				public Object Rereplyboardinsert( @RequestParam Map<String, Object> paramMap) {
					
					//ajax갑에 값이 실어서 보내면 대댓글 저장
					boardService.boardRereply(paramMap);
					
					return paramMap;
				}
				
				//댓글 수정
				@RequestMapping(value = "/board/reply/updatedate", method = RequestMethod.POST)
				@ResponseBody
				public Object Rereplyboardupdatedata( @RequestParam Map<String, Object> paramMap,Model model) {
					
					//ajax갑에 값이 실어서 보내면 대댓글 저장
					
					Map<String, Object> result  = boardService.replyUpdate(paramMap);
					return result;
				}
				
				//댓글 수정
				@RequestMapping(value = "/board/reply/update", method = RequestMethod.POST)
				@ResponseBody
				public Object Rereplyboardupdate( @RequestParam Map<String, Object> paramMap,Model model) {
					
					//ajax갑에 값이 실어서 보내면 대댓글 저장
					
					int result = 1;
					
					
					boardService.replyUpdatePut(paramMap);
					return result;
				}
				
				//좋아요
				@RequestMapping(value = "/boardUp",method = RequestMethod.POST)
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
						CountResult = boardService.BoardUpChk(paramMap);
						if(CountResult==0) {
							result = boardService.BoardUp(paramMap);
						}
						else {
							result =3;
						}
					 
					}
						
					return result;
				}
				//싫어요
				@RequestMapping(value = "/boardDown",method = RequestMethod.POST)
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
						CountResult = boardService.BoardUpChk(paramMap);
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
