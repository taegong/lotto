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
			     			async		: 	false, //동기: false, 비동기: ture
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
			     	
			     	
			     
			     });
			  //첫번째 차트
			     google.charts.load('current', {'packages':['corechart']});
			      google.charts.setOnLoadCallback(drawVisualization1);

			      function drawVisualization1() {
			        // Some raw data (not necessarily accurate)
			        var data = google.visualization.arrayToDataTable([
			             ['번호', 'Total',{ role: 'annotation' }],
			              <c:forEach items="${OneStlist}" var="OneStlist">
			              ['${OneStlist.num_One}',${OneStlist.cnt1},'${OneStlist.cnt1}'],
			              </c:forEach>
			        ]);
			        var options = {
			          title : '로또 1번째 번호',
			          vAxis: {title: '발생건수'},
			          hAxis: {title: '번호'},
			          seriesType: 'bars',
			          series: {5: {type: 'line'}} ,width:"100%",height:"100%"   };

			        var chart = new google.visualization.ComboChart(document.getElementById('tableDiv'));
			        chart.draw(data, options);
			        //반응형 그래프 출력 - 반응형 그래프를 원하지 않을 시 제거하거나 주석처리 하세요.
			        window.addEventListener('resize', function() { chart.draw(data, options); }, false);

			      
			      }
			      
			      //두번째 차트
			          google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization2);

		      function drawVisualization2() {
		        // Some raw data (not necessarily accurate)
		        var data = google.visualization.arrayToDataTable([
		             ['번호', 'Total',{ role: 'annotation' }],
		              <c:forEach items="${Twolist}" var="twolist">
		              ['${twolist.num_Two}',${twolist.cnt2},'${twolist.cnt2}'],
		              </c:forEach>
		        ]);
		        var options = {
		          title : '로또 2번째 번호',
		          vAxis: {title: '발생건수'},
		          hAxis: {title: '번호'},
		          seriesType: 'bars',
		          series: {5: {type: 'line'}} ,width:"100%",height:"100%"   };

		        var chart = new google.visualization.ComboChart(document.getElementById('tableDiv2'));
		        chart.draw(data, options);
		        //반응형 그래프 출력 - 반응형 그래프를 원하지 않을 시 제거하거나 주석처리 하세요.
		        window.addEventListener('resize', function() { chart.draw(data, options); }, false);

		      }
		      
		      //세번째 차트
		      
		      
		      
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization3);

		      function drawVisualization3() {
		        // Some raw data (not necessarily accurate)
		        var data = google.visualization.arrayToDataTable([
		             ['번호', 'Total',{ role: 'annotation' }],
		              <c:forEach items="${Threelist}" var="Threelist">
		              ['${Threelist.num_Three}',${Threelist.cnt3},'${Threelist.cnt3}'],
		              </c:forEach>
		        ]);
		        var options = {
		          title : '로또 3번째 번호',
		          vAxis: {title: '발생건수'},
		          hAxis: {title: '번호'},
		          seriesType: 'bars',
		          series: {5: {type: 'line'}} ,width:"100%",height:"100%"   };

		        var chart = new google.visualization.ComboChart(document.getElementById('tableDiv3'));
		        chart.draw(data, options);
		        //반응형 그래프 출력 - 반응형 그래프를 원하지 않을 시 제거하거나 주석처리 하세요.
		        window.addEventListener('resize', function() { chart.draw(data, options); }, false);

		      }
		      
		      //네번째
		      
		      
		      
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization4);

		      function drawVisualization4() {
		        // Some raw data (not necessarily accurate)
		        var data = google.visualization.arrayToDataTable([
		             ['번호', 'Total',{ role: 'annotation' }],
		              <c:forEach items="${Fourlist}" var="Fourlist">
		              ['${Fourlist.num_Four}',${Fourlist.cnt4},'${Fourlist.cnt4}'],
		              </c:forEach>
		        ]);
		        var options = {
		          title : '로또 4번째 번호',
		          vAxis: {title: '발생건수'},
		          hAxis: {title: '번호'},
		          seriesType: 'bars',
		          series: {5: {type: 'line'}} ,width:"100%",height:"100%"   };

		        var chart = new google.visualization.ComboChart(document.getElementById('tableDiv4'));
		        chart.draw(data, options);
		        //반응형 그래프 출력 - 반응형 그래프를 원하지 않을 시 제거하거나 주석처리 하세요.
		        window.addEventListener('resize', function() { chart.draw(data, options); }, false);

		      }
			      
		      
 //다섯번째
		      
		      
		      
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization5);

		      function drawVisualization5() {
		        // Some raw data (not necessarily accurate)
		        var data = google.visualization.arrayToDataTable([
		             ['번호', 'Total',{ role: 'annotation' }],
		              <c:forEach items="${fivelist}" var="Fivelist">
		              ['${Fivelist.num_Five}',${Fivelist.cnt5},'${Fivelist.cnt5}'],
		              </c:forEach>
		        ]);
		        var options = {
		          title : '로또 5번째 번호',
		          vAxis: {title: '발생건수'},
		          hAxis: {title: '번호'},
		          seriesType: 'bars',
		          series: {5: {type: 'line'}} ,width:"100%",height:"100%"   };

		        var chart = new google.visualization.ComboChart(document.getElementById('tableDiv5'));
		        chart.draw(data, options);
		        //반응형 그래프 출력 - 반응형 그래프를 원하지 않을 시 제거하거나 주석처리 하세요.
		        window.addEventListener('resize', function() { chart.draw(data, options); }, false);

		      }
			      
		      //여섯번째
		      
		        google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization5);

		      function drawVisualization5() {
		        // Some raw data (not necessarily accurate)
		        var data = google.visualization.arrayToDataTable([
		             ['번호', 'Total',{ role: 'annotation' }],
		              <c:forEach items="${fivelist}" var="Fivelist">
		              ['${Fivelist.num_Five}',${Fivelist.cnt5},'${Fivelist.cnt5}'],
		              </c:forEach>
		        ]);
		        var options = {
		          title : '로또 5번째 번호',
		          vAxis: {title: '발생건수'},
		          hAxis: {title: '번호'},
		          seriesType: 'bars',
		          series: {5: {type: 'line'}} ,width:"100%",height:"100%"   };

		        var chart = new google.visualization.ComboChart(document.getElementById('tableDiv5'));
		        chart.draw(data, options);
		        //반응형 그래프 출력 - 반응형 그래프를 원하지 않을 시 제거하거나 주석처리 하세요.
		        window.addEventListener('resize', function() { chart.draw(data, options); }, false);

		      }  google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization6);

		      function drawVisualization6() {
		        // Some raw data (not necessarily accurate)
		        var data = google.visualization.arrayToDataTable([
		             ['번호', 'Total',{ role: 'annotation' }],
		              <c:forEach items="${sixlist}" var="Sixlist">
		              ['${Sixlist.num_Six}',${Sixlist.cnt6},'${Sixlist.cnt6}'],
		              </c:forEach>
		        ]);
		        var options = {
		          title : '로또 6번째 번호',
		          vAxis: {title: '발생건수'},
		          hAxis: {title: '번호'},
		          seriesType: 'bars',
		          series: {5: {type: 'line'}} ,width:"100%",height:"100%"   };

		        var chart = new google.visualization.ComboChart(document.getElementById('tableDiv6'));
		        chart.draw(data, options);
		        //반응형 그래프 출력 - 반응형 그래프를 원하지 않을 시 제거하거나 주석처리 하세요.
		        window.addEventListener('resize', function() { chart.draw(data, options); }, false);

		      }
			      
				
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
          </div>
          
          <div id="tableDiv"></div>
          
           <div id="tableDiv2"></div>
           
           <div id="tableDiv3"></div>
           
           <div id="tableDiv4"></div>
           
           <div id="tableDiv5"></div>
           
           <div id="tableDiv6"></div>
          
          
          <div class="panel-body" align="center"> 
 <h3> 번호 결과</h3>
    <c:forEach var="l" items="${LottoLimit}">
						        <p>
						 ${l}
						        </p>
						        <br>   	
           </c:forEach>
           <br>
           <br>
          
          
          </div>
            		
				<div class="panel-body" align="center"> 


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