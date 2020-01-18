<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" />
<!-- include libraries(jQuery, bootstrap) -->
</head>
<style>
/* Space out content a bit */
body {
  padding-top: 20px;
  padding-bottom: 20px;
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

.jumbotron .btn {
  padding: 14px 24px;
  font-size: 21px;
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
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

  <c:if test="${not empty message}">
    <div>
      <h2>${message}</h2>
    </div>
  </c:if>
<div id="main-wrapper">
					<div class="container">
						<div id="content">
        <div class="form-area">
          <form id="articleForm" role="form" action="/article" method="post">
            <br style="clear: both">
            <h3 style="margin-bottom: 25px;">${tb_board_update.TB_member_Name }</h3>
             <input class="form-control" id="TB_member_ID" name="TB_member_ID" type="hidden" value="${tb_board_update.TB_member_ID }">
				<input class="form-control" id="TB_member_Name" name="TB_member_Name" type="hidden" value="${tb_board_update.TB_member_Name }">
				<input class="form-control" id="tb_board_bno" name="tb_board_bno" type="hidden" value="${tb_board_update.tb_board_bno }">
            <div class="form-group">
              <input type="text" class="form-control" id="tb_board_subject" name="tb_board_subject" placeholder="subject" value="${tb_board_update.tb_board_subject }"  required>
            </div>
            <div class="form-group">
<!--               <textarea class="form-control" id="summernote" name="content" placeholder="content" maxlength="140" rows="7"></textarea> -->
              <textarea class="form-control" id="summernote" name="tb_board_content" placeholder="content" maxlength="140" rows="7">${tb_board_update.tb_board_content }</textarea>
            </div>
            <a  href="#" id="board_update" name="board_update">등록</a>
          </form>
        </div>
      </div>
    </div>
    <div id="imageBoard">
      <ul>
        <c:forEach items="${files}" var="file">
          <li><img src="/image/${file}" width="480" height="auto"/></li>
        </c:forEach>
      </ul>
    </div>
  </div>
  </body>
  
   <!-- /container -->
  <script type="text/javascript">
      $(document).ready(function() {
        $('#summernote').summernote({
        	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        minWidth: 370,
	        maxWidth: null,
	        focus: true, 
	        lang : 'ko-KR',
			maximumImageFileSize: 1048576
        });
      });
      
      $("#board_update").click(function(){
			var board_bno = $("#tb_board_bno").val();
   		alert( $("#tb_board_bno").val());
           var contentReplce = $("textarea[name='tb_board_content']").val();
           contentReplce = contentReplce.replace(/(?:\r\n|\r|\n)/g, '<br />');
           
   		//값 셋팅
   		var objParams = {
   				tb_board_bno        : board_bno ,
   				TB_member_ID		: $("#TB_member_ID").val(),
   				TB_member_Name		: $("#TB_member_Name").val(),
   				tb_board_subject		: $("#tb_board_subject").val(),
   				tb_board_content : contentReplce
				};
   		
   		//ajax 호출
   		$.ajax({
   			url			:	"/noticeboard_updates",
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
   					location.href="/noticeboarddetail/"+board_bno;
   				}
   			},
   			error		:	function(request, status, error){
   				console.log("AJAX_ERROR");
   			}
   		});
   		
				
   	});
   	
  </script>
       

      




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
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<!-- Theme CSS -->
  <link href="/resources/css/freelancer.min.css" rel="stylesheet">
	</body>
</html>