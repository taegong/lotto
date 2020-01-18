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
   		location.href="/noticeboardupdate/"+tb_board_bno;
			             
			     		
							
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
 			url			:	"/notice_board_del",
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
 					location.href="/LotteNoticeBrd";
 				}
 			},
 			error		:	function(request, status, error){
 				console.log("AJAX_ERROR");
 			}
 		});
 		
			
 	});   	
	
   	$("#back_list").click(function(){

 		location.href="/LotteNoticeBrd";
			     	});
   	
	

 	
 	
 	
	$(document).on("click","a[name='boardU']",function(){
   		
	var tb_board_bno =  		$("#tb_board_bno").val(); 
 		//값 셋팅
 		var objParams = {
 				TB_member_ID		: $("#TB_member_ID").val(),
 				tb_board_type		: "1",
 				tb_board_bno		: $("#tb_board_bno").val()
			};
 		 
 		//ajax 호출
 		$.ajax({
 			url			:	"/noticeboardUp",
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
	 				tb_board_type		: "1",
	 				tb_board_bno		: $("#tb_board_bno").val()
				};
	 		 
	 		//ajax 호출
	 		$.ajax({
	 			url			:	"/noticeboardDown",
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
             ${tb_board_detail.tb_board_subject }<span class="pull-right text-right">  <fmt:formatDate value="${tb_board_detail.tb_board_reg_date}" pattern="yyyy.MM.dd"/> </span>
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