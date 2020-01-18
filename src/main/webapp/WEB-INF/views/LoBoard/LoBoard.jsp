<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

				<!-- Main -->
					<div id="main-wrapper">
					<div class="container">
						<div id="content">
        <table class="table">
 <thead>
  <tr>
     <th width="10%">번호</th>
            <th width="*" align="left">제목</th>
            <th  width="15%">작성자</th>
            <th width="10%">조회</th>
            <th  width="10%">작성일</th>
  </tr>
  </thead>
   <tbody>
 <c:forEach var="notice" items="${noticelist }">
 <tr onclick="location.href='/noticeboarddetail/${notice.tb_board_bno}'" bgcolor="gray">
                      <td>공지사항</td>
                      <td>${notice.tb_board_subject}</td>
                      <td>${notice.TB_member_Name}</td>
                     
                    <td>
                    ${notice.tb_board_hit }
                    </td>
                     <td>
                        <fmt:formatDate value="${notice.tb_board_reg_date}" pattern="yyyy.MM.dd"/>
                    </td>
                  </tr>
 </c:forEach>
  <c:forEach var="l" items="${list}">
                  <tr onclick="location.href='/boarddetail/${l.tb_board_bno}'">
                      <td>${l.tb_board_bno}</td>
                      <td>${l.tb_board_subject}</td>
                      <td>${l.TB_member_Name}</td>
                     
                    <td>
                    ${l.tb_board_hit }
                    </td>
                     <td>
                        <fmt:formatDate value="${l.tb_board_reg_date}" pattern="yyyy.MM.dd"/>
                    </td>
                  </tr>
              </c:forEach>
        </tbody>
      
      </table>
        <hr>
      
      
      
            <div id="paging">
       
       
         <div  align="center" style="font-size: 15px">
         
         <c:if test="${pageMaker.startPage  > 0}">
    <c:if test="${pageMaker.prev }">
    	
        <a href='<c:url value="/LotteBrd?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
    
    </c:if>
    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
        <a href='<c:url value="/LotteBrd?page=${idx }"/>'><i class="fa">${idx } </i> </a>
        
        
    </c:forEach>
    </c:if></div>
     <div  align="right" style="margin-top: 15px;">
        <c:if test="${not empty memberinfo.TB_member_ID }">
         <a class="btn btn-outline-secondary" style="float:right;" onclick="location.href='/board_insert'">글쓰기</a>
         </c:if>
         </div>
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