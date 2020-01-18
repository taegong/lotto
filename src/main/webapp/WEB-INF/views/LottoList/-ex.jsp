<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
 	<script type="text/javascript">
			  $(document).ready(function(){
				  
				  
			     	
			     	$("#LottoList").click(function(){
			     		
			     		
			     		alert($("#select_box option:selected").val());
			     		//값 셋팅
			     		var objParams = {
			     				Episode_Lotto		:$("#select_box option:selected").val()
							};
			     		var Episode_Lotto = $("#select_box option:selected").val();
				     	
			     		
			     		//ajax 호출
			     		$.ajax({
			     			url			:	"/lottomain/"+Episode_Lotto,
			     			dataType	:	"json",
			     			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
			     			type 		:	"post",
			     			async		: 	false, //동기: false, 비동기: ture
			     			data		:	objParams,
			     			success 	:	function(result){
			     				if(result == 0)
			     					{
			     					alert();
			     					location.href="/lottomain/"+Episode_Lotto
			     					}
			     				else{
			     					alert();
			     					location.href="/lottomain/"+Episode_Lotto
			     				}
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
							
			     	});
			     	
			     	
			     
			     });
				
			</script>
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
     
     
     	<div id="main-wrapper" class="box container">
				<div class="container">
    <div class="row marketing">
    
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">
          </div>
          <div class="panel-body" align="center">
                </span>
     <h3 class="panel-title"> ${LottoTal.episode_Lotto } 당첨결과
            </h3>    
           
          </div>
          <div class="panel-body" align="center"> 
           <span class="pull-right text-right">
           <select name="select_box" id="select_box">
           <c:forEach var = "option_num" begin="1" end="${lastEp}" step="1" >
			<option value="${lastEp-option_num +1}">${lastEp-option_num +1}</option>
						           	
           </c:forEach>
           </select>  
          <a href="#" id = "LottoList" name="LottoList">조회</a> 
      
          
          
          </div>
            		
				<div class="panel-body" align="center"> 
          당첨 번호  : ${LottoTal.num_One }, ${LottoTal.num_Two }, ${LottoTal.num_Three }, ${LottoTal.num_Four }, ${LottoTal.num_Five }, ${LottoTal.num_Six } 보너스번호 : ${LottoTal.num_bonus }        


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