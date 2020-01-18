<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>taegong</title>

  <!-- Custom fonts for this theme -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- Theme CSS -->
  <link href="/resources/css/freelancer.min.css" rel="stylesheet">
  <link href="/resources/css/freelance2.css" rel="stylesheet">

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


      <!-- Masthead Subheading -->
      <p class="masthead-subheading font-weight-light mb-0">Graphic Artist - Web Designer - Illustrator</p>

    </div>

  <!-- Portfolio Section -->
  <section class="page-section portfolio" id="portfolio">
    <div class="container">
    <br>
    <br>

      <!-- Portfolio Section Heading -->
      


 

<div id="container">
    <div align="right">


<div id="list">
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">티츄 카운트</h2>

      <!-- Icon Divider -->
      <div class="divider-custom">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <!-- Portfolio Grid Items -->
      <div class="row" align="right">
</div>
   
 
     
    <div>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	var fileIndex = 0;
	var totalscoreA = 0;
	var totalscoreB = 0;
	var roundscoreA =0;
	var roundscoreB =0;
	var stscore = 0;
	var st_A = null;
	var lt_A = null;
	var onetwo_A = null;
	var onetwo_B = null;
	var st_B = null;
	var lt_B = null;
	var tichu_A = "";
	var tichu_B = "";
	var onetwo_A = "";
	var onetwo_B = "";
	
	function myFunction(x) {
		 
	    var fileValue = $("input[name='fileData']").length;
	    var fileData = new Array(fileValue);
	    for(var i=0; i<fileValue; i++){                          
	         fileData[i] = $("input[name='fileData']")[i].value;
	    }
	}


	
function endNext() {

		
		var str4 = document.frm;
// 		str4.action="./tichuinsert";
		
		str4.submit();
		alert("저장하고 넘어갑니다.")
		
	};
	
	

// function scoreinsert() {

		
// 		var str4 = document.frm;
// 		str4.action="./tichuRe";
// 		str4.submit();
		
// 	}
	
		function date()
	{
		
// 		 totalA = document.getElementById("totalscoreA");
		alert(totalscoreA);
		 $('.st').append(
							'<input type= hidden name =TB_Score_A id = TB_Score_A value= '+ totalscoreA +'>' 
							+ '<td width=50% id=teamBwrite name =teamBwrite>'
							+'<input type= hidden name =TB_Score_B id = TB_Score_B value= '+ totalscoreB +'>' 
							
							
							

			);
	};
	
	// 점수를 계산 해서 넣는 코드 (자바스크립트로 HTML를 생성)
	function score()
	{
		
		 $('.fileView').append(
					'<tr id=f'+fileIndex+'>' + '<td>'
							+ (fileIndex + 1) + '</td>'
							+ '<td width=50% 	id=teamAwrite name = teamAwrite>' 
							+'<input type= hidden name =teamAwrite id = teamAwrite value= '+ roundscoreA + tichu_A + onetwo_A +'>' 
							+ roundscoreA	 + tichu_A + onetwo_A
							+'</td>'
							+ '<td width=50% id=teamBwrite name =teamBwrite>'
							+'<input type= hidden name =teamBwrite id = teamBwrite value= '+ roundscoreB + tichu_B + onetwo_B +'>' 
							+ roundscoreB + tichu_B + onetwo_B
							+ '</td></tr>'
							
							
							

			);
		 
		 
		

		 
		 // 토탈 점수 계산 해주는 식
			totalscoreA = totalscoreA + roundscoreA;
			totalscoreB = totalscoreB + roundscoreB;
			//토탈 점수 계산 해서 출력 해주는 소스
			document.getElementById("totalscoreA").innerHTML = totalscoreA; 
			document.getElementById("totalscoreB").innerHTML = totalscoreB; 
			
			document.getElementById("teamAscore").innerHTML = teamAscore; 
			document.getElementById("teamBscore").innerHTML = teamBscore; 
			
			
			fileIndex = fileIndex + 1;
			// 점수 계산 하고 지워 주는 소스
			document.getElementById([ 'teamAscore' ]).value = "";
			document.getElementById([ 'teamBscore' ]).value = "";
			
			
// 			 $('.list').append(
						
						
// 						'<input type= hidden name =TB_Score_A id = TB_Score_A value= '+totalscoreA  +'>' 
// 						+'<input type= hidden name =TB_Score_B id = TB_Score_B value= '+totalscoreB  +'>' 
						
						
						

// 		);
			
			// 변수값 초기화 
			 st_A = null;
			 lt_A = null;
			 onetwo_A = null;
			 onetwo_B = null;
			 st_B = null;
			 lt_B = null;
			 tichu_A = "";
			 tichu_B = "";
			 onetwo_A = "";
			 onetwo_B = "";
			
			
			
	};
	
	
	
function endGame() {
	$(function(){
		$('.add_set').hide();
		$('.endGame').show();
	});
};
	
	//티츄 버튼을 생성을 해주는 소스
	
	
	$(function(){
		
		//A팀 티츄 버튼 소스
		  $('.add_st_A').click(function(){
		     $('.st_A_succ').show();
		    $('.st_A_fail').show();
		    $('.st_A_cancel').show();
		    $('.lt_A_succ').hide();
		    $('.lt_A_fail').hide();
		    $('.lt_A_cancel').hide();
		    $('.onetwo_A_succ').hide();
		    $('.onetwo_A_cancel').hide();
// 		    alert(st_A); 
		    

		  });
		   
		  $('.st_A_succ').click(function(){
		    $('.st_A_succ').hide();
		    $('.st_A_fail').hide();
		    $('.st_A_cancel').hide();
		    st_A = true;
		    tichu_A = "티츄성공"; 
		    document.getElementById([ 'teamAscore' ]).value = 100 + parseInt($("#teamAscore").val());
// 		    alert(st_A);
		  }); 
		  
		  $('.st_A_fail').click(function(){
			    $('.st_A_succ').hide();
			    $('.st_A_fail').hide();
			    $('.st_A_cancel').hide();
			    st_A = false;
			    tichu_A = "티츄실패"; 
			    document.getElementById([ 'teamAscore' ]).value = -100 + parseInt($("#teamAscore").val());
// 			    alert(st_A);
			  }); 
		  
		  $('.st_A_cancel').click(function(){
			    $('.st_A_succ').hide();
			    $('.st_A_fail').hide();
			    $('.st_A_cancel').hide();
			    st_A = null;
			    document.getElementById([ 'teamAscore' ]).value ="";
			    document.getElementById([ 'teamBscore' ]).value ="";
// 			    alert(st_A);
			  }); 
		  
		 
		 
		}); 
	
	$(function(){
		//A팀 라티 소스
		  $('.add_lt_A').click(function(){
		     $('.lt_A_succ').show();
		    $('.lt_A_fail').show();
		    $('.lt_A_cancel').show();
		    $('.st_A_succ').hide();
		    $('.st_A_fail').hide();
		    $('.st_A_cancel').hide();
		    $('.onetwo_A_succ').hide();
		    $('.onetwo_A_cancel').hide();
// 		    alert(lt_A+"lt"); 
		    
		  });
		   
		  $('.lt_A_succ').click(function(){
		    $('.lt_A_succ').hide();
		    $('.lt_A_fail').hide();
		    $('.lt_A_cancel').hide();
		    document.getElementById([ 'teamAscore' ]).value = 200 + parseInt($("#teamAscore").val());
		    lt_A = true;
		    tichu_A = "라티성공"; 
// 		    alert(lt_A+"lt");
		  }); 
		  
		  $('.lt_A_fail').click(function(){
			    $('.lt_A_succ').hide();
			    $('.lt_A_fail').hide();
			    $('.lt_A_cancel').hide();
			    document.getElementById([ 'teamAscore' ]).value = -200 + parseInt($("#teamAscore").val());
			    lt_A = false;
			    tichu_A = "라티실패"; 
// 			    alert(lt_A);
			  }); 
		  
		  $('.lt_A_cancel').click(function(){
			    $('.lt_A_succ').hide();
			    $('.lt_A_fail').hide();
			    $('.lt_A_cancel').hide();
			    lt_A = null;
			    document.getElementById([ 'teamAscore' ]).value ="";
			    document.getElementById([ 'teamBscore' ]).value ="";
// 			    alert(lt_A);
			  }); 
		 
		}); 
	
	$(function(){
		//A팀 원투 소스
		  $('.add_onetwo_A').click(function(){
		    $('.st_A_succ').hide();
		    $('.st_A_fail').hide();
		    $('.st_A_cancel').hide();
		    $('.lt_A_succ').hide();
		    $('.lt_A_fail').hide();
		    $('.lt_A_cancel').hide();
		    document.getElementById([ 'teamAscore' ]).value = 200;
		    document.getElementById([ 'teamBscore' ]).value = 0;
		    onetwo_A = "원투성공";
// 		    alert(onetwo_A);
		  });
		  
// 		  $('.onetwo_A_succ').click(function(){
// 			    $('.onetwo_A_succ').hide();
// 			    $('.onetwo_A_cancel').hide();
// 			    $('.st_A_succ').hide();
// 			    $('.st_A_fail').hide();
// 			    $('.st_A_cancel').hide();
// 			    $('.lt_A_succ').hide();
// 			    $('.lt_A_fail').hide();
// 			    $('.lt_A_cancel').hide();
// 			    document.getElementById([ 'teamAscore' ]).value = 200;
// 			    document.getElementById([ 'teamBscore' ]).value = 0;
// 			    onetwo_A = "원투성공";
// 			    alert(onetwo_A);
// 			  });
		  
// 		  $('.onetwo_A_cancel').click(function(){
// 			    $('.onetwo_A_succ').hide();
// 			    $('.onetwo_A_cancel').hide();
// 			    $('.st_A_succ').hide();
// 			    $('.st_A_fail').hide();
// 			    $('.st_A_cancel').hide();
// 			    $('.lt_A_succ').hide();
// 			    $('.lt_A_fail').hide();
// 			    $('.lt_A_cancel').hide();
// 			    onetwo_A = ""; 
// 			    alert(onetwo_A);
// 			  });
	});

	$(function(){
		//B팀 티츄 버튼 
		  $('.add_st_B').click(function(){
		    $('.st_B_succ').show();
		    $('.st_B_fail').show();
		    $('.st_B_cancel').show();
		    $('.lt_B_succ').hide();
		    $('.lt_B_fail').hide();
		    $('.lt_B_cancel').hide();
		    $('.onetwo_B_succ').hide();
		    $('.onetwo_B_cancel').hide();
// 		    alert(st_B);
		  });
		   
		//B팀 티츄 소스
		  $('.st_B_succ').click(function(){
		    $('.st_B_succ').hide();
		    $('.st_B_fail').hide();
		    $('.st_B_cancel').hide();
		    st_B = true;
		    tichu_B = "티츄성공"; 
		    document.getElementById([ 'teamBscore' ]).value = 100 + parseInt($("#teamBscore").val());
// 		    alert(st_B);
		  }); 
		  
		  $('.st_B_fail').click(function(){
			    $('.st_B_succ').hide();
			    $('.st_B_fail').hide();
			    $('.st_B_cancel').hide();
			    document.getElementById([ 'teamBscore' ]).value = -100 + parseInt($("#teamBscore").val());
			    st_B = false;
			    tichu_B = "티츄실패"; 
// 			    alert(st_B);
			  }); 
		  
		  $('.st_B_cancel').click(function(){
			    $('.st_B_succ').hide();
			    $('.st_B_fail').hide();
			    $('.st_B_cancel').hide();
			    document.getElementById([ 'teamAscore' ]).value ="";
			    document.getElementById([ 'teamBscore' ]).value ="";
			    st_B = null;
// 			    alert(st_B);
			  }); 
		 
		}); 
	

	$(function(){
		//B팀 라티 소스
		  $('.add_lt_B').click(function(){
		    $('.lt_B_succ').show();
		    $('.lt_B_fail').show();
		    $('.lt_B_cancel').show();
		    $('.st_B_succ').hide();
		    $('.st_B_fail').hide();
		    $('.st_B_cancel').hide();
		    $('.onetwo_B_succ').hide();
		    $('.onetwo_B_cancel').hide();
		    
// 		    alert(lt_B);
		  });
		   
		  $('.lt_B_succ').click(function(){
		    $('.lt_B_succ').hide();
		    $('.lt_B_fail').hide();
		    $('.lt_B_cancel').hide();
		    lt_B = true;
		    tichu_B = "라티성공"; 
		    document.getElementById([ 'teamBscore' ]).value = 200 + parseInt($("#teamBscore").val());
// 		    alert(lt_B);
		  }); 
		  
		  $('.lt_B_fail').click(function(){
			    $('.lt_B_succ').hide();
			    $('.lt_B_fail').hide();
			    $('.lt_B_cancel').hide();
			    lt_B = false;
			    tichu_B = "라티실패"; 
			    document.getElementById([ 'teamBscore' ]).value = -200 + parseInt($("#teamBscore").val());
// 			    alert(lt_B);
			  }); 
		 
		  $('.lt_B_cancel').click(function(){
			    $('.lt_B_succ').hide();
			    $('.lt_B_fail').hide();
			    $('.lt_B_cancel').hide();
			    document.getElementById([ 'teamAscore' ]).value ="";
			    document.getElementById([ 'teamBscore' ]).value ="";
			    lt_B = null;
// 			    alert(lt_B);
			  }); 
		}); 
	
	
	$(function(){
		
		//B팀 원투 소스
		  $('.add_onetwo_B').click(function(){
		    $('.st_B_succ').hide();
		    $('.st_B_fail').hide();
		    $('.st_B_cancel').hide();
		    $('.lt_B_succ').hide();
		    $('.lt_B_fail').hide();
		    $('.lt_B_cancel').hide();
		    document.getElementById([ 'teamBscore' ]).value = 200;
		    document.getElementById([ 'teamAscore' ]).value = 0;
		    onetwo_B = "원투 성공";
// 		    alert(onetwo_B);
		  });
		  
// 		  $('.onetwo_B_succ').click(function(){
// 			    $('.onetwo_B_succ').hide();
// 			    $('.onetwo_B_cancel').hide();
// 			    $('.st_B_succ').hide();
// 			    $('.st_B_fail').hide();
// 			    $('.lt_B_succ').hide();
// 			    $('.lt_B_fail').hide();
// 			    document.getElementById([ 'teamBscore' ]).value = 200;
// 			    document.getElementById([ 'teamAscore' ]).value = 0;
// 			    onetwo_B = "원투 성공";
// 			    alert(onetwo_B);
// 			  });
		  
// 		  $('.onetwo_B_cancel').click(function(){
// 			    $('.onetwo_B_succ').hide();
// 			    $('.onetwo_B_cancel').hide();
// 			    $('.st_B_succ').hide();
// 			    $('.st_B_fail').hide();
// 			    $('.lt_B_succ').hide();
// 			    $('.lt_B_fail').hide();
// 			    onetwo_B = "";
// 			    alert(onetwo_B);
// 			  });
	});
	
	
	//input 에 숫자만 입력 받기
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			
			return;
		/* else
			return false; */
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			
			return;
		else
			
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
		
	}

	// 한쪽의 값을 넣으면 반대편에 값 넣기
	
	function onblur_eventA(){
        /* onblur 이벤트 */
        
        var teamB_CAL = 100 - $("#teamAscore").val();
        document.getElementById([ 'teamBscore' ]).value = teamB_CAL;
        
      }
	
	function onblur_eventB(){
	var teamA_CAL = 100 - $("#teamBscore").val();
    document.getElementById([ 'teamAscore' ]).value = teamA_CAL;
	}

	// 점수가 들어 가는 버튼
	$(function() {
		$('.add_set').click(
				function() {
					var teamA = $("#teamAscore").val();
					roundscoreA =parseInt(teamA);
					var teamB = $("#teamBscore").val();
					roundscoreB =parseInt(teamB);
					var form = document.frm;
					

					if (form.teamAscore.value == "") {
						alert("A팀 점수를 입력 하세요");
						form.teamAscore.focus();
						return;
					}
						
					if (form.teamBscore.value == "") {
						alert("B팀 점수를 입력 하세요");
						form.teamBscore.focus();
						return;
					}
					
					if(roundscoreA+roundscoreB == 100 )
						{
						score();
						}
					
					else if(roundscoreA+roundscoreB == 200)
						{
						score();
						}
					
					else if(roundscoreA+roundscoreB == 300)
					{
					score();
					}
					else if(roundscoreA+roundscoreB == 0)
					{
					score();
					}
					
					else if(roundscoreA+roundscoreB == 400)
						{
						score();
						}
					else
						{
						alert("수치가 맞지 않습니다.");
						form.teamAscore.focus();
						document.getElementById([ 'teamAscore' ]).value = "";
						document.getElementById([ 'teamBscore' ]).value = "";
						
						return;
						}
					
			
					 
					if(totalscoreA >= 1000)
						{
						
						if(totalscoreA >= 1000 && totalscoreB >= 1000)
						{
							if(totalscoreA > totalscoreB)
								 {
								alert("A팀 승.");
								date();
								endGame();
								 }
							else
								{
								alert("B팀 승.");
								date();
								endGame();
								}
						
						}
						else 
							{
							alert("끗A.");
							date();
							endGame();
							}
						
						}
					
					if(totalscoreB >= 1000)
						{
						
						if(totalscoreA >= 1000 && totalscoreB >= 1000)
							{
							
							if(totalscoreA > totalscoreB)
								{
								alert("A팀 승.");
								date();
								endGame();
								}
							
							else
								{
								alert("B팀승.");
								date();
								endGame();
								}
							
							}
						
						else 
						{
						alert("끗B.");
						date();
						endGame();
						}
						
						}
					
					
						
				});
			// 잘못 입력 했을 때 지우는 구분
	 	$('.remove_set').click(function() {
			 remove_scoreA =parseInt($('#socreRemoveA'+ (fileIndex - 1)).text());
			 remove_scoreB =parseInt($('#socreRemoveB'+ (fileIndex - 1)).text());
			
			 totalscoreA = totalscoreA - remove_scoreA;
			 totalscoreB = totalscoreB - remove_scoreB;
			 
			document.getElementById("totalscoreA").innerHTML = totalscoreA; 
			document.getElementById("totalscoreB").innerHTML = totalscoreB; 
			$('#f' + (fileIndex - 1)).remove();
			$('#socreRemoveA' + (fileIndex - 1)).remove();
			$('#socreRemoveB' + (fileIndex - 1)).remove();
			
			
			fileIndex = fileIndex - 1;
			
			
		}); 
	});
	

</script>
     <form method="post" id="tichu_score" action="/tichuinsert" name="frm" >
				<table width="550" align="center" border="1" class="table table-striped table-bordered table-hover"
					cellpadding="5">

					<tr>
						<td height="30" align="center" bgcolor="#FFFFFF" width="30%" class="st" name=teamA id=teamA>
						<input type="text" id = "TB_Count_A1" name="TB_Count_A1" >
						<input type="text" id = "TB_Count_A2" name="TB_Count_A2">
						<c:choose>
						<c:when test="${null ne sessionScope.memberinfo }">
						<input type="hidden" id = "TB_member_Name" name="TB_member_Name" value="${sessionScope.memberinfo.TB_member_Name}">
						<input class="form-control" id="TB_member_ID" name="TB_member_ID" type="hidden" value="${sessionScope.memberinfo.TB_member_ID }">																		
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
						
						
						<br>
						<input type="button" value="스티 " class="add_st_A">
						<input type="button" value="라티 " class="add_lt_A">
						<input type="button" value="원투 " class="add_onetwo_A">
						<br><br>
						
						<input type="button" value="성공 " class="st_A_succ" style="display: none" >
						<input type="button" value="실패 " class="st_A_fail" style="display: none" >
						<input type="button" value="취소 " class="st_A_cancel" style="display: none" >
						
						<input type="button" value="성공 " class="lt_A_succ" style="display: none" >
						<input type="button" value="실패 " class="lt_A_fail" style="display: none" >
						<input type="button" value="취소 " class="lt_A_cancel" style="display: none" >
						
						<input type="button" value="성공 " class="onetwo_A_succ" style="display: none" >
						<input type="button" value="실패 " class="onetwo_A_cancel" style="display: none" >
						 
						 
						</td>
						<td height="30" align="center" bgcolor="#FFFFFF" width="30%" name=teamA id=teamA>
							<input type="text" id = "TB_Count_B1" name="TB_Count_B1">
						<input type="text" id = "TB_Count_B2" name="TB_Count_B2">
							
							
							<br>
						<input type="button" value="스티 " class="add_st_B">
						<input type="button" value="라티 " class="add_lt_B">
						<input type="button" value="원투 " class="add_onetwo_B">
						<br><br>
						<input type="button" value="성공 " class="st_B_succ" style="display: none" >
						<input type="button" value="실패 " class="st_B_fail" style="display: none" >
						<input type="button" value="취소 " class="st_B_cancel" style="display: none" >
						
						<input type="button" value="성공 " class="lt_B_succ" style="display: none" >
						<input type="button" value="실패 " class="lt_B_fail" style="display: none" >
						<input type="button" value="취소 " class="lt_B_cancel" style="display: none" >
						
						<input type="button" value="성공 " class="onetwo_B_succ" style="display: none" >
						<input type="button" value="실패 " class="onetwo_B_cancel" style="display: none" >
							</td>
					</tr>

					<tr>
						<td width="50%" align="center" id="totalscoreA" name="totalscoreA">
						<script>
						document.write(totalscoreA); 
						</script> 
						</td>
						<td width="50%" align="center" id="totalscoreB">
						<script>
 						document.write(totalscoreB);
						</script>
						
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
								</table>
						</td>
					</tr>
					<td colspan="2" align="center" bgcolor="#FFFFFF">
					
					<input type="text" name="teamAscore" id="teamAscore" onblur="onblur_eventA();" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'> 
						<input type="text" name="teamBscore" id="teamBscore" onblur="onblur_eventB();" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'> 
						 <input type="button" value="end " class="endGame" style="display: none" onclick="endNext();">
						 <input type="button" value=" 추가 "  style="display: show"  class="add_set">
<!-- 						   -->
<%-- 						 ${vo.no } --%>
						  <input type="button" value=취소 class="remove_set" style="display: show">  

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


			</form>
      
        <div id="paging">
       
       
         <div  align="right">
    </div>
    </div>
</div>

<div  align="right">
<%--         <c:if test="${not empty memberinfo.TB_member_ID }"> --%>
<!--          <button class="btn btn-primary btn-sm" style="float:right;" onclick="location.href='/board_insert'">글쓰기</button> -->
<%--          </c:if> --%>
         </div>
      </div>
    </div>
  </div>
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
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="/resources/js/jqBootstrapValidation.js"></script>
  <script src="/resources/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/js/freelancer.min.js"></script>

</body>

</html>
