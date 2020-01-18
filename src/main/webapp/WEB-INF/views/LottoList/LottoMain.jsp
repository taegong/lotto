<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
	<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
 	<script type="text/javascript">
			  $(document).ready(function(){
				  
				  
// 				  function date_to_str(format)

// 				  {

// 				      var year = format.getFullYear();

// 				      var month = format.getMonth() + 1;

// 				      if(month<10) month = '0' + month;

// 				      var date = format.getDate();

// 				      if(date<10) date = '0' + date;

// 				      var hour = format.getHours();

// 				      if(hour<10) hour = '0' + hour;

// 				      var min = format.getMinutes();

// 				      if(min<10) min = '0' + min;

// 				      var sec = format.getSeconds();

// 				      if(sec10) sec = '0' + sec;

				      

// 				      return year + "-" + month + "-" + date + " " + hour + ":" + min + ":" + sec;

// 				  }



			     	$("#LottoList").click(function(){
			     		
			     		
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
			     			data		:	objParams,
			     			success 	:	function(result){
			     				if(result == 0)
			     					{
			     					location.href="/lottomain/"+Episode_Lotto
			     					}
			     				else{
			     					location.href="/lottomain/"+Episode_Lotto
			     				}
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
							
			     	});
			     	
			     	$(".searchbutton").click(function(){
			     		var values = $('#searchvalue').val();
			     		var searchTitle = "";
			     		var searchUrl = "";
			     		var searchLine="----------------------------------------------------------------------------------------";
			     		var searchWebParam = {
			     				'query'		:values ,
			     				'size' : 5
							};
			     		
			     		var searchWebParam = {
			     				'query'		:values ,
			     				'size' : 5
							};
							if($('#searchvalue').val()==""){
								alert("검색을 입력해 주세요");
							}	
							$("#searchlist").empty();
							$("#searchmov").empty();
							$("#searchimg").empty();
							$("#searchblog").empty();
							$("#searchbook").empty();
							$("#searchcafe").empty();
							$("#searchtip").empty();
					
							$("#searchlist").append(searchLine); 
			     		//웹검색 호출
			     		$.ajax({
			     			url			:	"https://dapi.kakao.com/v2/search/web",
			     			dataType	:	"json",
			     			  headers: {'Authorization': 'KakaoAK 47c2d6a67633ad388b1397d2d39a3ef2'},

			     			type 		:	"get",
			     			data : searchWebParam,	
			     			success 	:	function(r){
// 			     				r.documents
			     				$.each(r.documents, function (i, search) {
			     					searchTitle = "<br><a href=\"";
			     					var contents= "";
			     					if(search.contents.length >= 30){
			     					     contents=search.contents.substr(0,30)+"...";
			     					}
			     					
			     					searchTitle =searchTitle+search.url+"\"target=\"_blank\">"+search.title+" 날짜 : "+search.datetime.substring( 0, 10 )+"<br><br>"+contents+"</a><br>";
			     					
			     					$("#searchlist").append(searchTitle); 
// 			                        alert("i : "+i);
// 			                        alert("url : "+search.url);
// 			                        alert("title : "+search.title);
			                    });
			                    
			                    
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
			     		$("#searchlist").append(searchLine); 
			     		
			     		//동영상 검색
			     		
			     		$.ajax({
			     			url			:	"https://dapi.kakao.com/v2/search/vclip",
			     			dataType	:	"json",
			     			  headers: {'Authorization': 'KakaoAK 47c2d6a67633ad388b1397d2d39a3ef2'},

			     			type 		:	"get",
			     			data : searchWebParam,	
			     			success 	:	function(r){
// 			     				r.documents
			     				$.each(r.documents, function (i, search) {
			     					searchTitle = "<div><a href=\"";
			     					
			     					searchTitle =searchTitle+search.url+"\"target=\"_blank\"><img src='"+search.thumbnail+"'/><br><br>"+search.title+" 날짜 : "+search.datetime.substring( 0, 10 )+"</a></div>";
			     					
			     					$("#searchmov").append(searchTitle); 
// 			                        alert("i : "+i);
// 			                        alert("url : "+search.url);
// 			                        alert("title : "+search.title);
			                    });
			                    
			                    
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
			     		$("#searchimg").append(searchLine); 
			     		//이미지 검색
			     		$.ajax({
			     			url			:	"https://dapi.kakao.com/v2/search/image",
			     			dataType	:	"json",
			     			  headers: {'Authorization': 'KakaoAK 47c2d6a67633ad388b1397d2d39a3ef2'},

			     			type 		:	"get",
			     			data : searchWebParam,	
			     			success 	:	function(r){
// 			     				r.documents
			     				$.each(r.documents, function (i, search) {
			     					searchTitle = "<div><a href=\"";
			     					
			     					searchTitle =searchTitle+search.doc_url+"\"target=\"_blank\"><img src='"+search.thumbnail_url+"'/><br><br> 날짜 :" +search.datetime.substring( 0, 10 )+"</a></div>";
			     					
			     					$("#searchimg").append(searchTitle); 
// 			                        alert("i : "+i);
// 			                        alert("url : "+search.url);
// 			                        alert("title : "+search.title);
			                    });
			                    
			                    
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
			     		$("#searchblog").append(searchLine); 
			     		
			     		//블로그 검색
			     	$.ajax({
			     			url			:	"https://dapi.kakao.com/v2/search/blog",
			     			dataType	:	"json",
			     			  headers: {'Authorization': 'KakaoAK 47c2d6a67633ad388b1397d2d39a3ef2'},

			     			type 		:	"get",
			     			data : searchWebParam,	
			     			success 	:	function(r){
// 			     				r.documents
			     				$.each(r.documents, function (i, search) {
			     					searchTitle = "<br><a href=\"";
			     					var contents= "";
			     					if(search.contents.length >= 30){
			     					     contents=search.contents.substr(0,30)+"...";
			     					}
			     					
			     					searchTitle =searchTitle+search.url+"\"target=\"_blank\"><img src='"+search.thumbnail+"'/><br>"+search.title+" 날짜 : "+search.datetime.substring( 0, 10 )+contents+"</a><br>";
			     					
			     					$("#searchblog").append(searchTitle); 
// 			                        alert("i : "+i);
// 			                        alert("url : "+search.url);
// 			                        alert("title : "+search.title);
			                    });
			                    
			                    
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
			     		
			     		
			     		$("#searchtip").append(searchLine); 
			     		
			     		//팁검색
			     		$.ajax({
			     			url			:	"https://dapi.kakao.com/v2/search/tip",
			     			dataType	:	"json",
			     			  headers: {'Authorization': 'KakaoAK 47c2d6a67633ad388b1397d2d39a3ef2'},

			     			type 		:	"get",
			     			data : searchWebParam,	
			     			success 	:	function(r){
// 			     				r.documents
			     				$.each(r.documents, function (i, search) {
			     					searchTitle = "<br><a href=\"";
			     					
			     					searchTitle =searchTitle+search.q_url+"\"target=\"_blank\">"+search.title+" 날짜 : "+search.datetime.substring( 0, 10 )+"</a><br>";
			     					
			     					$("#searchtip").append(searchTitle); 
// 			                        alert("i : "+i);
// 			                        alert("url : "+search.url);
// 			                        alert("title : "+search.title);
			                    });
			                    
			                    
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
			     		$("#searchbook").append(searchLine); 
			     		
			     		//책 검색
			     		
			     		$.ajax({
			     			url			:	"https://dapi.kakao.com/v3/search/book?target=title",
			     			dataType	:	"json",
			     			  headers: {'Authorization': 'KakaoAK 47c2d6a67633ad388b1397d2d39a3ef2'},

			     			type 		:	"get",
			     			data : searchWebParam,	
			     			success 	:	function(r){
// 			     				r.documents
			     				$.each(r.documents, function (i, search) {
			     					searchTitle = "<br><a href=\"";
			     					
			     					searchTitle =searchTitle+search.url+"\"target=\"_blank\"><img src='"+search.thumbnail+"'/><br>"+search.title+" 날짜 : "+search.datetime.substring( 0, 10 )+"</a><br>";
			     					
			     					$("#searchbook").append(searchTitle); 
// 			                        alert("i : "+i);
// 			                        alert("url : "+search.url);
// 			                        alert("title : "+search.title);
			                    });
			                    
			                    
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
			     		$("#searchcafe").append(searchLine); 
			     		
			     		//cafe검색
			     		
			     		$.ajax({
			     			url			:	"https://dapi.kakao.com/v2/search/cafe",
			     			dataType	:	"json",
			     			  headers: {'Authorization': 'KakaoAK 47c2d6a67633ad388b1397d2d39a3ef2'},

			     			type 		:	"get",
			     			data : searchWebParam,	
			     			success 	:	function(r){
// 			     				r.documents
			     				$.each(r.documents, function (i, search) {
			     					searchTitle = "<br><a href=\"";
			     					var contents= "";
			     					if(search.contents.length >= 30){
			     					     contents=search.contents.substr(0,30)+"...";
			     					}
			     					searchTitle =searchTitle+search.url+"\"target=\"_blank\"><img src='"+search.thumbnail+"'/><br>"+search.title+" 날짜 : "+search.datetime.substring( 0, 10 )+"</a><br>"+contents;
			     					
			     					$("#searchcafe").append(searchTitle); 
// 			                        alert("i : "+i);
// 			                        alert("url : "+search.url);
// 			                        alert("title : "+search.title);
			                    });
			                    
			                    
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		$("#searchend").append(searchLine);
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
     
     
     	<div id="main-wrapper">
					<div class="container">
						<div id="content">
						
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">
          </div>
          <div class="panel-body" align="center">
              <h3 class="panel-title"> ${LottoTal.episode_Lotto } 당첨결과
            </h3>
           
          </div>
          
          
          
              <div class="panel-body" align="center"> 
           <span class="pull-right text-right">
           <select name="select_box" id="select_box">
           <c:forEach var = "option_num" begin="1" end="${lastEp}" step="1" >
			<option value="${lastEp-option_num +1}">&nbsp; ${lastEp-option_num +1} &nbsp;</option>
						           	
           </c:forEach>
           </select> 
            &nbsp;&nbsp;
          <a href="#" id = "LottoList" name="LottoList">조회</a> 
      
          </span>
          
          </div>
            		
				<div class="panel-body" align="center"> 
          당첨 번호  : ${LottoTal.num_One }, ${LottoTal.num_Two }, ${LottoTal.num_Three }, ${LottoTal.num_Four }, ${LottoTal.num_Five }, ${LottoTal.num_Six } 보너스번호 : ${LottoTal.num_bonus }        
	<br>
	<input type="text" size="30" id="searchvalue" name="searchvalue"> <a href="#" class="searchbutton">검색</a>
	
		<div id="searchlist">
		123
		<p></p>
</div>

<div id="searchmov">
		
		<p></p>
</div>

<div id="searchimg">
		
		<p></p>
</div>

<div id="searchblog">

		<p></p>
</div>

<div id="searchtip">

		<p></p>
</div>
<div id="searchbook">

		<p></p>
</div>

<div id="searchcafe">
		
		<p></p>
</div>

<div id="searchend">
		
		<p></p>
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
</html></html>