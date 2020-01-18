<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<head>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
 
     $(document).ready(function(){
     	
     	var status = false; //수정과 대댓글을 동시에 적용 못하도록
     	
     	$("#list").click(function(){
     		location.href = "/board/list";
     	});
     	
     	//댓글 저장
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
     				TB_index		: $("#tb_board_bno").val(),
     				depth			: "0",
     				TB_member_Name	: $("#TB_member_Name").val(),
     				reply_content	: reply_content,
     				reply_id : $("#reply_id").val()
				};
     		
     		var reply_id;
     		
     		//ajax 호출
     		$.ajax({
     			url			:	"/tichu/reply/save",
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
     	
     	
     	
     	//댓글 삭제
     	$(document).on("click","button[name='reply_del']", function(){
     		
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
//      		alert(objParams.reply_id);
     		//ajax 호출
     		$.ajax({
     			url			:	"/tichu/reply/del",
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
     	$(document).on("click","button[name='reply_reply']",function(){ //동적 이벤트
     		1234
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
     		var last_check = false;//마지막 tr 체크
//      		입력받는 창 등록
     		 var replyEditor = 
     			'<tr id="reply_add" class="reply_reply">'+
         		'	<td width="70%" colspan="2">'+
         		'		<textarea name="reply_reply_content" rows="1" cols="50"></textarea>'+
         		'	</td>'+
         		'	<td align="center" width= "">'+
         		'		<button name="reply_reply_save" parent_id="'+reply_id+'">등록</button>'+
         		'		<button name="reply_reply_cancel">취소</button>'+
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
     	$(document).on("click","button[name='reply_reply_save']",function(){
     		          		
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
     				TB_index		: $("#tb_board_bno").val() ,
     				parent_id		: $(this).attr("parent_id"),	
     				depth			: "1",
     				TB_member_Name	: $("#TB_member_Name").val(),
     				reply_content	: reply_reply_content_val
				};
     		 
     		var reply_id;
     		var parent_id;
     		
     		//ajax 호출
     		$.ajax({
     			url			:	"/tichu/Rereply/save",
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
     	$(document).on("click","button[name='reply_reply_cancel']",function(){
     		$("#reply_add").remove();
     		
     		status = false;
     	});
     	
     	//글수정
     	$("#modify").click(function(){
     		
     		var password = $("input[name='password']");
     		
     		if(password.val().trim() == ""){
             	alert("패스워드를 입력하세요.");
             	password.focus();
             	return false;
             }
     		            		
     		//ajax로 패스워드 검수 후 수정 페이지로 포워딩
     		//값 셋팅
     		var objParams = {
     				id		 : $("#board_id").val(),	
     				password : $("#password").val()
				};
     		            		
     		//ajax 호출
     		$.ajax({
     			url			:	"/board/check",
     			dataType	:	"json",
     			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
     			type 		:	"post",
     			async		: 	false, //동기: false, 비동기: ture
     			data		:	objParams,
     			success 	:	function(retVal){

     				if(retVal.code != "OK") {
     					alert(retVal.message);
     				}else{
         				location.href = "/board/edit?id="+$("#board_id").val();
     				}
     				
     			},
     			error		:	function(request, status, error){
     				console.log("AJAX_ERROR");
     			}
     		});
     		
     	});
     	
     	//글 삭제
			$("#delete").click(function(){
				
				var password = $("input[name='password']");
     		
     		if(password.val().trim() == ""){
             	alert("패스워드를 입력하세요.");
             	password.focus();
             	return false;
             }
     		
     		//ajax로 패스워드 검수 후 수정 페이지로 포워딩
     		//값 셋팅
     		var objParams = {
     				id		 : $("#board_id").val(),	
     				password : $("#password").val()
				};
     		            		
     		//ajax 호출
     		$.ajax({
     			url			:	"/board/del",
     			dataType	:	"json",
     			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
     			type 		:	"post",
     			async		: 	false, //동기: false, 비동기: ture
     			data		:	objParams,
     			success 	:	function(retVal){

     				if(retVal.code != "OK") {
     					alert("삭제 되었습니다.");
     				}else{
     					
     					alert(retVal.message);
         				location.href = "/board/list";
     				}
     				
     			},
     			error		:	function(request, status, error){
     				console.log("AJAX_ERROR");
     			}
     		});
     		
     	});
     	
     });
 </script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>taegong web</title>

  <!-- Custom fonts for this theme -->
  <link href="/resources//vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <!-- Theme CSS -->
  <link href="/resources//css/freelancer.min.css" rel="stylesheet">

</head>

<body id="page-top">

   <!-- Navigation -->
  <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="/">Taegong</a>
      <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <c:choose>

							<c:when test="${empty sessionScope.memberinfo }">
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
          			
          			
          			

								<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
									href="/login">MEMBER</a>

							

						
												
						</li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/board">BOARD</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/tichu">TICHU</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
          <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"></a>
          </li>
        </ul>
      </div>
      
      
      </c:when>
      
      
							<c:otherwise>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
          			
          			
          			

								<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
									href="/memberlogin">MEMBER</a>

							

						
												
						</li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/board">BOARD</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/tichu">TICHU</a>
          </li>
          <li class="nav-item mx-0 mx-lg-1">
          <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/memberlogout">로그아웃</a>
          </li>
        </ul>
      </div>
      
							</c:otherwise>

						</c:choose>
      
          			
						
												
          
    </div>
  </nav>

 <section class="page-section" id="contact">
    <div class="container">
    <br>
    <br>







      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">티츄카운터</h2>

      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>
      				
	<table width="550" align="center" border="1" class="table table-striped table-bordered table-hover"
					cellpadding="5">

					
									<tr>
						<td width="50%" align="center" id="totalscoreA" name="totalscoreA">
						${tichuDetail.TB_Count_A1 },${tichuDetail.TB_Count_A2 }
						<br>
						${tichuDetail.TB_Score_A }
						</td>
						<td width="50%" align="center" id="totalscoreB">
						
						${tichuDetail.TB_Count_B1 },${tichuDetail.TB_Count_B2 }
						<br>
						${tichuDetail.TB_Score_B }
						</td>
						
					</tr>

					<tr>

						<td colspan="2" height="30" align="center" bgcolor="#FFFFFF" >
								<table id="table_content" width="560" class="table table-striped table-bordered table-hover fileView" bgcolor="#FFFFFF">
									<tr bgcolor="#FFFFFF">
										<td width=6% bgcolor="#FFFFFF">R</td>
										<td width=52% bgcolor="#FFFFFF">A점수</td>
										<td width=52% bgcolor="#FFFFFF">B점수</td>
						</tr>	
						
						
						<c:forEach var="scoreListA" items="${scoreListA}" varStatus="status">	
						
						<tr>
						<td>
						${status.count }
						</td>
						<td>
						${scoreListA}
						</td>
						<td>
						${scoreListB[status.index]}
						</td>
						</tr>	
						</c:forEach>
						
						<tr>
					<td colspan="3" align="center">
					 결과 : 
					${tichuDetail.TB_match }
					</td>
					</tr>
										
								</table>
						</td>
					</tr>
	<table>
				
				<tr reply_type="all"  style="display:none"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
   					<td colspan="4"></td>
   				</tr>
	   			<!-- 댓글이 들어갈 공간 -->
	   			<c:forEach var="replyList" items="${replylist}" varStatus="status">
					<tr reply_type="<c:if test="${replyList.depth == '0'}">main</c:if>
					<c:if test="${replyList.depth == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
			    		<td width="10%">
			    			${replyList.TB_member_Name}
			    			<input type="hidden" id= "reply_id" name ="reply_id" value="${replyList.reply_id}">
			    		</td>
			    		
			    		<td width="70%">
			    			<c:if test="${replyList.depth == '1'}"> → </c:if>${replyList.reply_content}
			    		</td>

						<td align="center"><c:if test="${replyList.depth != '1'}">
								<button name="reply_reply" parent_id="${replyList.reply_id}"
									reply_id="${replyList.reply_id}">댓글</button>
								<!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
							</c:if>
<%-- 							<button name="reply_modify" parent_id="${replyList.parent_id}" --%>
<%-- 								r_type=" --%>
<%-- 			    			<c:if test="${replyList.depth == '0'}">main</c:if> --%>
<%-- 			    			<c:if test="${replyList.depth == '1'}">sub</c:if>" --%>
<%-- 								reply_id="${replyList.reply_id}">수정</button> --%>
							<button name="reply_del"
								r_type="<c:if test="${replyList.depth == '0'}">main</c:if>
								<c:if test="${replyList.depth == '1'}">sub</c:if>"
								reply_id="${replyList.reply_id}">삭제</button></td>
					</tr>
			    </c:forEach>
   				<tr>
   				
   				<td width="70%" colspan="2">
   				<input type="hidden" id="tb_board_bno" name="tb_board_bno" value="${tichuDetail.TB_index}">
   				<input type="hidden" id="TB_member_Name" name="TB_member_Name" value="${sessionScope.memberinfo.TB_member_Name}">
   						<textarea id="reply_content" name="reply_content"  rows="1" style="width:100%;" placeholder="댓글을 입력하세요."></textarea>
   					</td>
   					<td>
   					<button id="reply_save" name="reply_save" >댓글 등록</button>
   					</td>
   				</tr>
				
				</table>
				</table>
				
			
<!-- <script type="text/javascript"> -->
<!--  $("#list_set").click(function(){ -->
<!--             $("input[name='teamAwrite']").each(function (i) { -->
 
<!--                  alert( i + "점수  값 : " + $("input[name='teamAwrite']").eq(i).attr("value") ); -->
 
<!--             }); -->
            
<!--             $("input[name='teamAwriteS']").each(function (i) { -->
            	 
<!--                 alert( i + "스티 값 : " + $("input[name='teamAwriteS']").eq(i).attr("value") ); -->

<!--            }); -->
            
<!--             $("input[name='teamAwriteO']").each(function (i) { -->
           	 
<!--                 alert( i + "원투 값 : " + $("input[name='teamAwriteO']").eq(i).attr("value") ); -->

<!--            }); -->
<!--         }); -->
 
 
 
<!-- </script> -->

			
<br>
<br>
			  <div class="btn-group btn-group-sm" role="group" style="float:right;">
<%-- 			  <c:if test="${sessionScope.memberinfo.TB_member_Name eq tb_board_detail.tb_board_name}"> --%>
<%--           <button type="button" class="btn btn-default" onclick="location.href='/boarddelete/${tb_board_detail.tb_board_bno}'">삭제</button> --%>
<%--           <button type="button" class="btn btn-default" onclick="location.href='/boardupdate/${tb_board_detail.tb_board_bno}'">수정</button> --%>
<%--           </c:if> --%>
          <button type="button" class="btn btn-default" onclick="location.href='/tichu'"> 목록 </button>
        </div>




			<%-- 			</c:when> --%>
			
<%-- 			<c:when test="${empty sessionScope.memberinfo.TB_member_ID }"> --%>
			
<%-- 			</c:when> --%>
			

		</div>
  </section>

  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <div class="row">

        <!-- Footer Location -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">Location</h4>
          <p class="lead mb-0">2215 John Daniel Drive
            <br>Clark, MO 65243</p>
        </div>

        <!-- Footer Social Icons -->
        <div class="col-lg-4 mb-5 mb-lg-0">
          <h4 class="text-uppercase mb-4">Around the Web</h4>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-facebook-f"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-twitter"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-linkedin-in"></i>
          </a>
          <a class="btn btn-outline-light btn-social mx-1" href="#">
            <i class="fab fa-fw fa-dribbble"></i>
          </a>
        </div>

        <!-- Footer About Text -->
        <div class="col-lg-4">
          <h4 class="text-uppercase mb-4">About Freelancer</h4>
          <p class="lead mb-0">Freelance is a free to use, MIT licensed Bootstrap theme created by
            <a href="http://startbootstrap.com">Start Bootstrap</a>.</p>
        </div>

      </div>
    </div>
  </footer>

  <!-- Copyright Section -->
  <section class="copyright py-4 text-center text-white">
    <div class="container">
      <small>Copyright &copy; Your Website 2019</small>
    </div>
  </section>

  <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
  <div class="scroll-to-top d-lg-none position-fixed ">
    <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
      <i class="fa fa-chevron-up"></i>
    </a>
  </div>

  <!-- Portfolio Modals -->

  <!-- Portfolio Modal 1 -->
  <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Log Cabin</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/cabin.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 2 -->
  <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-labelledby="portfolioModal2Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Tasty Cake</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/cake.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 3 -->
  <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-labelledby="portfolioModal3Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Circus Tent</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/circus.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 4 -->
  <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-labelledby="portfolioModal4Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Controller</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/game.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 5 -->
  <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-labelledby="portfolioModal5Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Locked Safe</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/safe.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Portfolio Modal 6 -->
  <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-labelledby="portfolioModal6Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Submarine</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="img/portfolio/submarine.png" alt="">
                <!-- Portfolio Modal - Text -->
                <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                <button class="btn btn-primary" href="#" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="/resources//vendor/jquery/jquery.min.js"></script>
  <script src="/resources//vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/resources//vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="/resources//js/jqBootstrapValidation.js"></script>
  <script src="/resources//js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources//js/freelancer.min.js"></script>

</body>

</html>
