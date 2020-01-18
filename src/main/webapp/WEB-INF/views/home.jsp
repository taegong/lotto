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

			<!-- Banner -->
				<div id="banner-wrapper">
					<div id="banner" class="box container">
						<div class="row">
							<div class="col-7 col-12-medium">
								<h2>${LottoTal.episode_Lotto } 로또 번호 </h2>
								<P> ${LottoTal.num_One }, ${LottoTal.num_Two }, ${LottoTal.num_Three }, ${LottoTal.num_Four }, ${LottoTal.num_Five }, ${LottoTal.num_Six } 보너스번호 : ${LottoTal.num_bonus }        </P>
								<p>${LottoTal.episode_Lotto } 회차 1등 당첨금  : ${LottoTal.num_One_Price }원 </p>
								<p>당첨인원  : ${LottoTal.num_One_Price_Inwon } </p>  
								<p>1인 당첨금 : ${LottoTal.num_OP_price }
							</div>
							<div class="col-5 col-12-medium">
								<ul>
								
								<style>
								
								.col-5 img {
								
								  overflow: hidden;
						            display: flex;
						            align-items: center;
						            justify-content: center;
						            max-width: 100%;
						            height: 250px;
            							}
								</style>
									<img alt="" src="/resources/img/party-lights.jpg" >		
									<br><br>						
									</ul>
							</div>
						</div>
					</div>
				</div>

			<!-- 이미지뷰어-->
				<div id="features-wrapper">
					<div class="container">
						<div class="row">
							

								<!-- Box -->
								<style>
								
								.col-12-medium a .qeu{
								
								  overflow: hidden;
						            display: flex;
						            align-items: center;
						            justify-content: center;
						            max-width: 100%;
						            min-width: 100%;
						            height: 200px;
            							}
								</style>	
								  <c:forEach var="MainSum" items="${MainSum}">
								  <div class="col-4 col-12-medium">
									<section class="box feature">
										<a href="/boarddetail/${MainSum.tb_board_bno }" class="image featured"><img src="${MainSum.tb_board_content }" class="qeu" > </a>
										<div class="inner">
											<header>
												<h2>${MainSum.tb_board_subject }</h2>
											</header>
											<p>${MainSum.tb_board_bno }</p>
											<p>${MainSum.tb_board_reg_date }</p>
											<p>${MainSum.tb_board_hit }</p>
										</div>
									</section>
			
							</div>
							    </c:forEach>
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