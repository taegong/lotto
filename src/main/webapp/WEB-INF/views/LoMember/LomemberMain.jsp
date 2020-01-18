<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE HTML>
<html>
	<head>
	
	 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script></script>
			<script type="text/javascript">
			  $(document).ready(function(){
				  
				  var TB_member_ID = document.getElementById('TB_member_ID');
					var TB_member_Name = document
							.getElementById('TB_member_Name');
					var TB_member_Password = document
							.getElementById('TB_member_Password');
					var TB_member_Email = document
							.getElementById('TB_member_Email');
			     	
			     	var status = false; //수정과 대댓글을 동시에 적용 못하도록
			     	
			     	//로그인
			     	$("#login").click(function(){
			     		
			     		//널 검사
			             if($("#TB_member_ID").val().trim() == ""){
			             	alert("아이디를 입력 부탁 드립니다.");
			             	$("#TB_member_ID").focus();
			             	return false;
			             }
			             if($("#TB_member_Password").val().trim() == ""){
				             	alert("비밀번호를 입력 부탁 드립니다.");
				             	$("#TB_member_Password").focus();
				             	return false;
				             }
			     		
			             
			             
			     		//값 셋팅
			     		var objParams = {
			     				TB_member_ID		: $("#TB_member_ID").val(),
			     				TB_member_Password		: $("#TB_member_Password").val()
							};
			     		
			     		var reply_id;
			     		
			     		//ajax 호출
			     		$.ajax({
			     			url			:	"/LottoLogin",
			     			dataType	:	"json",
			     			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
			     			type 		:	"post",
			     			async		: 	false, //동기: false, 비동기: ture
			     			data		:	objParams,
			     			success 	:	function(loginchk){
			     				if(loginchk == 0)
			     					{
			     					alert("아이디랑 비밀번호를 확인 부탁 드립니다.");
			     					}
			     				else{
			     					location.href="/";
			     				}
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
							
			     	});
			     	
			     	
  				$("#logout").click(function(){
			     		
			             
			     		//값 셋팅
				     		//ajax 호출
						location.href="/logout";
			     		
							
			     	});
			     	
			     	
			     	$("#memberUpdate").click(function(){
						window.open("/LottoPchk", "a", "width=400, height=450, left=100, top=50"); 
						             
						     	});
			     	
			     	$("#memberRe").click(function(){
						window.open("/LottoPchkRe", "a", "width=400, height=450, left=100, top=50"); 
						             
						     	});
			     });
				
			</script>
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
				<c:choose>
							<c:when test="${empty sessionScope.memberinfo }">
			<div id="main-wrapper">
					<div class="container">
						<div id="content">


							<!-- Content -->
								<article>

						  <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원로그인</h2>

      <div class="row">
        <div class="col-lg-8 mx-auto">
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>I D</label>
                
                <input class="form-control" name="TB_member_ID" id="TB_member_ID" type="text" placeholder="ID" required="required" >
               
                <p class="help-block text-danger"></p>
                
              </div>
            </div>
            
            
            
             <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Pass Word</label>
                <input class="form-control" id="TB_member_Password" name="TB_member_Password" type="password" placeholder="Pass Word" required="required" data-validation-required-message="Please enter your phone number.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <br>
            <div id="success"></div>
            <div class="form-group">
            </div>
            <button id="login" name="login" class="btn btn-flat waves-effect waves-light shopping-cart-button">로그인 하기</button>
					
					&nbsp;&nbsp;
          <br><br>
          
          
										<a href="/LotteMbj"><p>
												회원가입</font>
											</p></a>
        </div>
      </div>
      
   
    </div>
  </section>

								</article>
 </c:when>
 <c:when test="${not empty sessionScope.memberinfo.TB_member_ID}">
 <section class="page-section" id="contact">
 	<div id="main-wrapper">
					<div class="container">
						<div id="content">


							<!-- Content -->
								<article>


      <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원정보</h2>


				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								
								<label>ID</label> 
								<p>ID : 
								${sessionScope.memberinfo.TB_member_ID}
								</p>
								<input type="hidden" value=" ">
							</div>
						</div>

					</div>
				</div>


				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>NAME</label>
								<p>NAME :
								 ${sessionScope.memberinfo.TB_member_Name}
								 </p>

							</div>
						</div>

					</div>
				</div>


				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>email</label>
								<p>email : 
								${sessionScope.memberinfo.TB_member_Email }
								</p>

							</div>
						</div>

					</div>
				</div>

				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>마지막 로그인</label>
								<p>마지막로그인날짜 :
									
									${sessionScope.memberinfo.TB_member_DATE }
									</p>

							</div>
						</div>

					</div>
				</div>


				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>회원등급</label>
								<p> 회원등급 : 
								<c:choose>
										<c:when test="${sessionScope.memberinfo.TB_member_YN eq '1'}">
											    일반 회원 입니다.
											  </c:when>
										<c:when test="${sessionScope.memberinfo.TB_member_YN eq '2'}">
												    정회원 입니다.
												  </c:when>
									</c:choose></p>

							</div>
						</div>

					</div>
				</div>


	<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label> 가입날짜 </label>
								<p>가입날짜: 
								${sessionScope.memberinfo.TB_member_Join_date }
								</p>
								
							</div>
						</div>

					</div>
				</div>
				
			
<br>
<br>
			<div  align="center">
							<a id="memberUpdate" name="memberUpdate" >회원정보 수정</a>
							 &nbsp;&nbsp;/&nbsp;&nbsp;
							<a  id= "memberRe" name ="memberRe">회원탈퇴</a>
							&nbsp;&nbsp;/&nbsp;&nbsp;
							<a  id="logout" name="logout">로그아웃</a>
			
			</div>
		
	



			

		</div>
		
  </section>
  </c:when>
  </c:choose>
  
  
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
<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <!-- Theme CSS -->
  <link href="/resources/css/freelancer.min.css" rel="stylesheet">
	</body>
</html>