<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<style>
/* Space out content a bit */
body {
  padding-top: 20px;
  padding-bottom: 20px;
}

img {
 max-width: 80%;
  height: auto;
}

/* Everything but the jumbotron gets side spacing for mobile first views */
.header, .marketing, .footer {
  padding-right: 15px;
  padding-left: 15px;
}

/* Custom page header */
.header {
  padding-bottom: 20px;
  border-bottom: 1px solid #e5e5e5;
}
/* Make the masthead heading the same height as the navigation */
.header h3 {
  margin-top: 0;
  margin-bottom: 0;
  line-height: 40px;
}

/* Custom page footer */
.footer {
  padding-top: 19px;
  color: #777;
  border-top: 1px solid #e5e5e5;
}

/* Customize container */
@media ( min-width : 768px) {
  .container {
    max-width: 900px;
  }
}

.container-narrow>hr {
  margin: 30px 0;
}

/* Main marketing message and sign up button */
.jumbotron {
  text-align: center;
  border-bottom: 1px solid #e5e5e5;
}

/* Supporting marketing content */
.marketing {
  margin: 40px 0;
}

.marketing p+h4 {
  margin-top: 28px;
}

/* Responsive: Portrait tablets and up */
@media screen and (min-width: 768px) {
  /* Remove the padding we set earlier */
  .header, .marketing, .footer {
    padding-right: 0;
    padding-left: 0;
  }
  /* Space out the masthead */
  .header {
    margin-bottom: 30px;
  }
  /* Remove the bottom border on the jumbotron for visual effect */
  .jumbotron {
    border-bottom: 0;
  }
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script></script>
			<script type="text/javascript">
			  $(document).ready(function(){
				  
			     	
   	$("#board_update").click(function(){

		  var tb_board_bno = $("#tb_board_bno").val();
   		location.href="/freeboardupdate/"+tb_board_bno;
			     	});
   	
   	
	$("#board_del").click(function(){
			var board_bno = $("#tb_board_bno").val();
         
 		//값 셋팅
 		var objParams = {
 				tb_board_bno        : board_bno ,
 				TB_member_ID		: $("#TB_member_ID").val(),
 				TB_member_Name		: $("#TB_member_Name").val()
			};
 		
 		//ajax 호출
 		$.ajax({
 			url			:	"/free_board_del",
 			dataType	:	"json",
 			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
 			type 		:	"post",
 			async		: 	false, //동기: false, 비동기: ture
 			data		:	objParams,
 			success 	:	function(result){
 				if(result == 0)
 					{
 					alert("아이디랑 비밀번호를 확인 부탁 드립니다.");
 					}
 				else{
 					location.href="/LotteFreeBrd";
 				}
 			},
 			error		:	function(request, status, error){
 				console.log("AJAX_ERROR");
 			}
 		});
 		
			
 	});   	
	
   	$("#back_list").click(function(){

 		location.href="/LotteFreeBrd";
			     	});
   	
	
	$("#reply_save").click(function(){
 		
 		//널 검사
         if($("#TB_member_Name").val().trim() == ""){
         	alert("로그인 부탁 드립니다.");
         	$("#TB_member_Name").focus();
         	return false;
         }
 		
         
         if($("#reply_content").val().trim() == ""){
         	alert("내용을 입력하세요.");
         	$("#reply_content").focus();
         	return false;
         }
        
         var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
         
 		//값 셋팅
 		var objParams = {
 				tb_board_bno		: $("#tb_board_bno").val(),
 				depth			: "0",
 				TB_member_Name	: $("#TB_member_Name").val(),
 				reply_content	: reply_content
			};
 		
 		var reply_id;
 		
 		//ajax 호출
 		$.ajax({
 			url			:	"/reply/freesave",
 			dataType	:	"json",
 			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
 			type 		:	"post",
 			async		: 	false, //동기: false, 비동기: ture
 			data		:	objParams,
 			success 	:	function(paramMap){
 				location.reload();
 			},
 			error		:	function(request, status, error){
 				console.log("AJAX_ERROR");
 			}
 		});
 		

			
 	});
	
	
	 $(document).on("click","a[name='reply_modify']", function(){
		 if(status){
	            alert("수정과 대댓글은 동시에 불가합니다.");
	            return false;
	        }
      var reply_id = $(this).attr("reply_id");
      var naem= $(this).attr("replyListName");
       
   	var objParams = {
				tb_board_bno		: $("#tb_board_bno").val(),
				reply_id             :reply_id
		};
    var rel ="";
      //ajax 호출
      $.ajax({
          url         :   "/board/reply/freeupdatedate",
          dataType    :   "json",
          contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
          type        :   "post",
          async       :   false, //동기: false, 비동기: ture
          data        :   objParams,
          success     :   function(result){
            rel  = result.reply_content;
          },
          error       :   function(request, status, error){
              console.log("AJAX_ERROR");
          }
      });
			
			
         status = true;
         
 		$("#reply_modify").remove();
 		
 		var reply_id = $(this).attr("reply_id");
 		var last_check = false;//마지막 tr 체크
//  		입력받는 창 등록
 		 var replyEditor = 
 			'<tr id="reply_modify" class="reply_modify">'+
     		'	<td width="70%" colspan="2">'+
     		'		<textarea class="form-control" name="reply_modify_content" cols="25" maxlength="140" rows="3">'+rel+'</textarea>'+
     		'	</td></tr><tr>'+
     		'	<td align="right" width= "" colspan="3" id = "reply_modify_two">'+
     		'		<a name="reply_modify_save" parent_id="'+reply_id+'" >등록</a>'+
     		'		<a name="reply_modify_cancel" >취소</a>'+
     		'	</td>'+
     		'</tr>';
			var prevTr = $(this).parent().parent().next();
     	
     	//부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
 		//마지막 리플 처리
 		if(prevTr.attr("reply_type") == undefined){
 			prevTr = $(this).parent().parent();
 		}else{
 			while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                 prevTr = prevTr.next();
             }
 			
 			if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
 				last_check = true;
 			}else{
 				prevTr = prevTr.prev();
 			}
 			
 		}
     	
     	if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
     		$('#reply_area tr:last').after(replyEditor);	
     	}else{
     		prevTr.after(replyEditor);
     	}

 	});
	 
	 
	 $(document).on("click","a[name='reply_modify_save']", function(){
	 		
	 		var reply_id = $(this).attr("parent_id");
	 		var reply_modify_content = $("textarea[name='reply_modify_content']");
	 		var reply_reply_content_val = reply_modify_content.val().replace("\n", "<br>");
	 		//값 셋팅
	 		var objParams = {
	 				reply_id		: reply_id,
	 				reply_content			: reply_reply_content_val
				};
	 		//ajax 호출
	 		$.ajax({
	 			url			:	"/board/reply/freeupdate",
	 			dataType	:	"json",
	 			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
	 			type 		:	"post",
	 			async		: 	false, //동기: false, 비동기: ture
	 			data		:	objParams,
	 			success 	:	function(result){
	 				if(result == 0)
	 					{
	 					alert("삭제 되지 않았습니다. 다시 한번 확인 부탁 합니다.");
	 					}
	 				else{
	 					
	 					
	 					location.reload();
	 				}
	 			},
	 			error		:	function(request, status, error){
	 				console.log("AJAX_ERROR");
	 			}
	 		});
	 		
	 			
	 	});
	
	//댓글 삭제
 	$(document).on("click","a[name='reply_del']", function(){
 		
 		var check = false;
 		var reply_id = $(this).attr("reply_id");
 		var r_type = $(this).attr("r_type");
 		
 		
 		//패스워드와 아이디를 넘겨 삭제를 한다.
 		//값 셋팅
 		var objParams = {
 				reply_id		: reply_id,
 				r_type			: r_type,
 				TB_member_Name	: $("#TB_member_Name").val()
			};
//  		alert(objParams.reply_id);
 		//ajax 호출
 		$.ajax({
 			url			:	"/reply/freedel",
 			dataType	:	"json",
 			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
 			type 		:	"post",
 			async		: 	false, //동기: false, 비동기: ture
 			data		:	objParams,
 			success 	:	function(result){
 				if(result == 0)
 					{
 					alert("삭제 되지 않았습니다. 다시 한번 확인 부탁 합니다.");
 					}
 				else{
 					
 					
 					location.reload();
 				}
 			},
 			error		:	function(request, status, error){
 				console.log("AJAX_ERROR");
 			}
 		});
 		
 		if(check){
 			
 			if(r_type=="main"){//depth가 0이면 하위 댓글 다 지움
 				//삭제하면서 하위 댓글도 삭제
					var prevTr = $(this).parent().parent().next(); //댓글의 다음
         		
         		while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                     prevTr.remove();
                     prevTr = $(this).parent().parent().next();
                 }
         		                    		
         		$(this).parent().parent().remove();	
 			}else{ //아니면 자기만 지움
 				$(this).parent().parent().remove();	
 			}
 			
 		}
 		
 	});
	
 	//대댓글 입력창
 	$(document).on("click","a[name='reply_reply']",function(){ //동적 이벤트
 		if(status){
            alert("수정과 대댓글은 동시에 불가합니다.");
            return false;
        }
 	
 		 if($("#TB_member_Name").val().trim() == ""){
          	alert("로그인 부탁 드립니다.");
          	$("#TB_member_Name").focus();
          	return false;
          }
  		
         status = true;
         
 		
 		$("#reply_add").remove();
 		
 		var reply_id = $(this).attr("reply_id");
 		var last_check = false;//마지	막 tr 체크
//  		입력받는 창 등록
 		 var replyEditor = 
 			'<tr id="reply_add" class="reply_reply">'+
     		'	<td colspan="2">'+
     		'		<textarea class="form-control" name="reply_reply_content" rows="1" cols="25" maxlength="140" rows="3"></textarea>'+
     		'	</td></tr><tr>'+
     		'	<td colspan="3" align="right" id="reply_add_two">'+
     		'		<a name="reply_reply_save"parent_id="'+reply_id+'">등록</a> /'+
     		'		<a name="reply_reply_cancel">취소</a>'+
     		'	</td>'+
     		'</tr>';
     		
     		 
			var prevTr = $(this).parent().parent().next();
     	
     	//부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
 		//마지막 리플 처리
 		if(prevTr.attr("reply_type") == undefined){
 			prevTr = $(this).parent().parent();
 		}else{
 			while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                 prevTr = prevTr.next();
             }
 			
 			if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
 				last_check = true;
 			}else{
 				prevTr = prevTr.prev();
 			}
 			
 		}
     	
     	if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
     		$('#reply_area tr:last').after(replyEditor);	
     	}else{
     		prevTr.after(replyEditor);
     	}
 		
 	});
 	
 	//대댓글 등록
 	$(document).on("click","a[name='reply_reply_save']",function(){
 		          		
 		var reply_reply_writer = $("input[name='reply_reply_writer']");
 		var reply_reply_content = $("textarea[name='reply_reply_content']");
 		var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리
 		
 		//널 검사
 		
         
         if(reply_reply_content.val().trim() == ""){
         	alert("내용을 입력하세요.");
         	reply_reply_content.focus();
         	return false;
         }
         var reply_id = $(this).attr("reply_id");
 		//값 셋팅
 		var objParams = {
 				tb_board_bno		: $("#tb_board_bno").val() ,
 				parent_id		: $(this).attr("parent_id"),	
 				depth			: "1",
 				TB_member_Name	: $("#TB_member_Name").val(),
 				reply_content	: reply_reply_content_val
			};
 		 
 		var reply_id;
 		var parent_id;
 		
 		//ajax 호출
 		$.ajax({
 			url			:	"/Rereply/freesave",
 			dataType	:	"json",
 			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
 			type 		:	"post",
 			async		: 	false, //동기: false, 비동기: ture
 			data		:	objParams,
 			success 	:	function(retVal){

 				location.reload();     				
 			},
 			error		:	function(request, status, error){
 				console.log("AJAX_ERROR");
 			}
 		});
 		
 		
 	});
 	
 	//대댓글 입력창 취소
 	$(document).on("click","a[name='reply_reply_cancel']",function(){
 		$("#reply_add").remove();
 		$("#reply_add_two").remove();
 		location.reload(); 
 		status = false;
 		
 	});
 	
 	//수정 버튼 취소
 	$(document).on("click","a[name='reply_modify_cancel']",function(){
 		$("#reply_modify").remove();
 		$("#reply_modify_two").remove();
 		location.reload();
 		status = false;
 		
 	});
 	
 	
 	
 	
	$(document).on("click","a[name='boardU']",function(){
   		
	var tb_board_bno =  		$("#tb_board_bno").val(); 
 		//널 검사
         
 		//값 셋팅
 		var objParams = {
 				TB_member_ID		: $("#TB_member_ID").val(),
 				tb_board_type		: "3",
 				tb_board_bno		: $("#tb_board_bno").val()
			};
 		 
 		//ajax 호출
 		$.ajax({
 			url			:	"/boardUp",
 			dataType	:	"json",
 			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
 			type 		:	"post",
 			async		: 	false, //동기: false, 비동기: ture
 			data		:	objParams,
 			success 	:	function(result){
				if(result==0){
					alert("로그인 부탁드립니다.");
				}else if(result==3){
					alert("한 아이디로는 한번만 추천 가능 합니다.");
				}else {
					location.reload();
				}
				
 			},
 			error		:	function(request, status, error){
 				console.log("AJAX_ERROR");
 			}
 		});
 		
 		
 	});
	
	$(document).on("click","a[name='boardD']",function(){
   		
		var tb_board_bno =  		$("#tb_board_bno").val(); 
	 		//널 검사
	         
	 		//값 셋팅
	 		var objParams = {
	 				TB_member_ID		: $("#TB_member_ID").val(),
	 				tb_board_type		: "3",
	 				tb_board_bno		: $("#tb_board_bno").val()
				};
	 		 
	 		//ajax 호출
	 		$.ajax({
	 			url			:	"/boardDown",
	 			dataType	:	"json",
	 			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
	 			type 		:	"post",
	 			async		: 	false, //동기: false, 비동기: ture
	 			data		:	objParams,
	 			success 	:	function(result){
	 				if(result==0){
						alert("로그인 부탁드립니다.");
					}else if(result==3){
						alert("한 아이디로는 한번만 추천 가능 합니다.");
					}else {
						location.reload();
					}
	 			},
	 			error		:	function(request, status, error){
	 				console.log("AJAX_ERROR");
	 			}
	 		});
	 		
	 		
	 	});
     	
			     });
			  
			  
				
			</script>
<html>

	<head>
	
	
		<title>오늘의 로또</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
	</head>
	<body class="is-preload homepage">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h2><a href="/">오늘의 로또</a></h2>
							</div>

						<!-- Nav -->
						<nav id="nav">
								<ul>
									<li>
									
									<a href="/LotteBrd">로또인증 게시판</a>
									<ul>
									<li><a href="/LotteFreeBrd" >회원 자유 게시판</a></li>
									<li><a href="/LotteNoticeBrd" >공지 사항 게시판</a></li>
									</ul>
									</li>
									
									
									<li>
									<a href="/lottomain">로또당첨번호</a>
									<ul>
									
									
									<li><a href="/lottolimitr">로또번호추첨</a></li>
									</ul>
									</li>
									<li>
											<a href="/LotteMbr">회원로그인</a>
										<ul>
											<li><a href="/LotteMbr" >회원정보</a></li>
											<c:if test="${empty sessionScope.memberinfo }">
											<li><a  href="/LotteMbj">회원가입</a></li>
											</c:if>
											<c:if test="${not empty sessionScope.memberinfo }">
											<li><a href="/logout">로그아웃</a></li>
											</c:if>
										</ul>
									</li>
								</ul>
							</nav>

					</header>
				</div>


				<!-- Main -->
				<div id="main-wrapper">
					<div class="container">
						<div id="content">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">
             ${tb_board_detail.tb_board_subject }<span class="pull-right text-right">  <fmt:formatDate value="${tb_board_detail.tb_board_reg_date}" pattern="yyyy.MM.dd"/></span>
            </h3>
             <input class="form-control" id="tb_board_bno" name="tb_board_bno" type="hidden" value="${tb_board_detail.tb_board_bno }">
          </div>
          <div class="panel-body" align="center"> ${tb_board_detail.tb_board_content }</div>
        
            		
				<div class="table_layout" align="right">
						<input type="hidden" id="tb_board_bno" name="tb_board_bno" value="${tb_board_detail.tb_board_bno}">
						<input  id="TB_member_ID" name="TB_member_ID" type="hidden" value="${sessionScope.memberinfo.TB_member_ID }">
				<input  id="TB_member_Name" name="TB_member_Name" type="hidden" value="${sessionScope.memberinfo.TB_member_Name }">
                    <div class="panel-body" align="center">   <a name="boardU">
            <img alt="" src="/resources/img/3.png" width="30px" height="50px">
            
            ${tb_board_detail.tb_board_up }
            </a>
             <a  name="boardD">
            <img alt="" src="/resources/img/7.png" width="30px" height="50px">
            ${tb_board_detail.tb_board_down }
            </a></div>
                  <div class="panel-body">
                    <a value="수정" id="board_update" name="board_update" class="btn btn-outline-secondary"> 수정</a>
                     <a value="삭제" id="board_del" name="board_del" class="btn btn-outline-secondary"> 삭제</a>
                      <a value="목록" id="back_list" name="back_list" class="btn btn-outline-secondary">목록</a>
</div>

</div>
            <div class="panel-body">
   						
   						<div class="form-group">
<!--               <textarea class="form-control" id="summernote" name="content" placeholder="content" maxlength="140" rows="7"></textarea> -->
              <textarea class="form-control" id="reply_content" name="reply_content" placeholder="content" maxlength="140" rows="4"></textarea>
            </div>
            <br>
            <div align="right">
            <a  href="#" id="reply_save" name="reply_save">등록</a>
            </div>
        </div>
             <div class="panel-body">
             <style>
             .rwd-table tr {
             
             border: none;
             	text-align: left;
				}
				.ad{
				background-color: gray;
				color: white;
				}
             </style> 
             <table class="rwd-table">
   
            <tr reply_type="all"  ><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
   					<td colspan="4"></td>
   				</tr>
	   			<!-- 댓글이 들어갈 공간 -->
	   			<c:forEach var="replyList" items="${replylist}" varStatus="status">
					<tr reply_type="<c:if test="${replyList.depth == '0'}" >main</c:if>
					<c:if test="${replyList.depth == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
			    		<td class="ad">
			    			${replyList.TB_member_Name}
			    			<input type="hidden" id= "replyListName" name ="replyListName" value="${replyList.TB_member_Name}">
			    			<input type="hidden" id= "reply_id" name ="reply_id" value="${replyList.reply_id}">
			    			<input type="hidden" id= "rep_depth" name ="rep_depth" value="${replyList.depth}">
			    		</td>
			    		
			    			
						</tr>
						<tr style="margin-left: 200px;width: 90%; ">
						<td><c:if test="${replyList.depth == '1'}"> @ </c:if>${replyList.reply_content}
								</td>
						<tr>
						
						<td align="right"><c:if test="${replyList.depth != '1'}">
						  
								<a name="reply_reply" parent_id="${replyList.reply_id}"
									reply_id="${replyList.reply_id}" >댓글</a>
								<!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
							</c:if>
							  <c:if test="${sessionScope.memberinfo.TB_member_Name eq replyList.TB_member_Name}">
							<a name="reply_modify" parent_id="${replyList.parent_id}"
								r_type="
			    			<c:if test="${replyList.depth == '0'}">main</c:if>
			    			<c:if test="${replyList.depth == '1'}">sub</c:if>"
								reply_id="${replyList.reply_id}" >수정</a>
							<a name="reply_del"
								r_type="<c:if test="${replyList.depth == '0'}">main</c:if>
								<c:if test="${replyList.depth == '1'}">sub</c:if>"
								reply_id="${replyList.reply_id}" >삭제</a>
								</c:if>
								</td>
								
					</tr>
					<tr>
					<td colspan="3" align="right">
					<a class="btn" name="">
			              <img alt="" src="/resources/img/7.jpg" width="20px" height="20px">
			              </a>
			              
			              <a class="btn" name="">
			              <img alt="" src="/resources/img/7.jpg" width="20px" height="20px">
			              </a>
					</td>
					</tr>
			    </c:forEach>
			    </tbody>
			    </table>
             </div>
             
             
    
						<br>
						<div id="content">
			
                </div>
             
             </div>
             
        </div>
      </div>
    </div>
  </div>
				
			  



			<!-- Footer -->
				<div id="footer-wrapper">
					<footer id="footer" class="container">
					<div id="banner-wrapper">
					<div id="banner" class="box container">
						<div class="row">
							광고
						</div>
					</div>
				</div>
						<div class="row">
							<div class="col-12">
								<div id="copyright" >
								<br>
								<br>
								<br>
								<p align="center" >오늘의 로또 : 만든이 : 태공 </p>
								</div>
							</div>
						</div>
					</footer>
				</div>

			</div>
		<!-- Scripts -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>
			<!-- Theme CSS -->
  <link href="/resources/css/freelancer.min.css" rel="stylesheet">

	</body>
</html>