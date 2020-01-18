<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE HTML>


<html>
	<head>
	
			
	
		<title>오늘의 로또</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
	</head>
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
			     	
			     	//댓글 저장
			     	$("#Lidchk").click(function(){
			     		
			     		//널 검사
			             if($("#TB_member_ID").val().trim() == ""){
			             	alert("아이디를 입력 부탁 드립니다.");
			             	$("#TB_member_ID").focus();
			             	return false;
			             }
			     		
			             
			             
			     		//값 셋팅
			     		var objParams = {
			     				TB_member_ID		: $("#TB_member_ID").val()
							};
			     		
			     		var reply_id;
			     		
			     		//ajax 호출
			     		$.ajax({
			     			url			:	"/LottoIdchk",
			     			dataType	:	"json",
			     			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
			     			type 		:	"post",
			     			async		: 	false, //동기: false, 비동기: ture
			     			data		:	objParams,
			     			success 	:	function(LoIdckh){
			     				alert("성공");
			     				if(LoIdckh == 1)
			     					{
			     					alert("1");
			     					}
			     				else{
			     					alert("사용 가능 합니다.");
			     				}
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
							
			     	});
			     	
			     	
			     	
			     	
			     	//댓글 저장
			     	$("#join").click(function(){
			     		
			     		//널 검사
			             if($("#TB_member_ID").val().trim() == ""){
			             	alert("아이디를 입력 부탁 드립니다.");
			             	$("#TB_member_ID").focus();
			             	return false;
			             }
			     		
			             if($("#TB_member_Name").val().trim() == ""){
				             	alert("이름을 입력 부탁 드립니다.");
				             	$("#TB_member_Name").focus();
				             	return false;
				             }
			     		
			             if($("#TB_member_Password").val().trim() == ""){
				             	alert("비밀번호를 입력 부탁 드립니다.");
				             	$("#TB_member_Password").focus();
				             	return false;
				             }
			             
			             if($("#TB_member_Email").val().trim() == ""){
				             	alert("이메일를 입력 부탁 드립니다.");
				             	$("#TB_member_Email").focus();
				             	return false;
				             }
			             
			             if(document.getElementById('TB_member_ID').value.length >=  9)
							{ 
							
							alert("아이디는 8글자 이하 입니다.");
							$('#TB_member_ID').focus();
							return false;
							}
						
						if(document.getElementById('TB_member_Name').value.length >=  6)
						{ 
						
						alert("이름은는 6글자 이하 입니다.");
						$('#TB_member_Name').focus();
						return false;
						}
						
						var exptext = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

						if (exptext.test(TB_member_Email.value) == false) {

							//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

							alert("이 메일형식이 올바르지 않습니다.");

							$('#TB_member_Email').focus();
							alert(TB_member_Email.value);
							return false;
						}else {
							var objParams = {
				     				TB_member_ID		: $("#TB_member_ID").val(),
				     				TB_member_Name		: $("#TB_member_Name").val(),
				     				TB_member_Password		: $("#TB_member_Password").val(),
				     				TB_member_Email		: $("#TB_member_Email").val(),
				     				TB_member_Message : $("#TB_member_Message").val()
				     				
				     				
								};
				     		
				     		
				     		//ajax 호출
				     		$.ajax({
				     			url			:	"/LottoJoin",
				     			dataType	:	"json",
				     			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
				     			type 		:	"post",
				     			async		: 	false, //동기: false, 비동기: ture
				     			data		:	objParams,
				     			success 	:	function(LoIdckh){
				     				if(LoIdckh == 1)
				     					{
				     					alert("아이디중복체크 해주세요");
				     					}
				     				else{
				     					alert("회원가입 되셨습니다.");
				     					location.href="/";
				     				}
				     			},
				     			error		:	function(request, status, error){
				     				console.log("AJAX_ERROR");
				     			}
				     		});
				     		
								
				     
						}
			     		//값 셋팅
			    	});
			     });
				
			</script>
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

							<!-- Content -->
								<article>

						  <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원가입</h2>

      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <div class="row">
        <div class="col-lg-8 mx-auto" align="center">
            <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>I D</label>
               	
                <input class="form-control" name="TB_member_ID" id="TB_member_ID" type="text" placeholder="ID" >
               
                <p class="help-block text-danger"></p>
                
              </div>
            </div>
            
             <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>N A M E</label>
                <input class="form-control" id="TB_member_Name" name="TB_member_Name" type="text" placeholder="N A M E" >
                <p class="help-block text-danger"></p>
              </div>
            </div>
            
                <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>Pass Word</label>
                <input class="form-control" id="TB_member_Password" name="TB_member_Password" type="password" placeholder="Pass Word">
                <p class="help-block text-danger"></p>
              </div>
            </div>            
            
            
             <div class="control-group">
              <div class="form-group floating-label-form-group controls mb-0 pb-2">
                <label>E M A I L </label>
                <input class="form-control" id="TB_member_Email" name="TB_member_Email" type="text" placeholder="E mail" required="required" data-validation-required-message="Please enter your phone number.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            
            	<div class="control-group">
							<div
								class="form-group floating-label-form-group controls mb-0 pb-2">
								<label>Message</label>
								<textarea class="form-control" id="TB_member_Message"
									name="TB_member_Message" rows="5" placeholder="Message"
									required="required"
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
            <br>
            <div class="form-group">
            </div>
             <button id="join" name="join" value="회원가입" class="btn btn-flat waves-effect waves-light shopping-cart-button" >회원가입</button>
					<button  id="Lidchk" name="Lidchk" value="다시하기" 
					class="btn btn-flat waves-effect waves-light shopping-cart-button"  >다시하기</button>
					
					&nbsp;&nbsp;
          <br><br>
          
          
        </div>
      </div>
      
   
    </div>
  </section>

								</article>

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