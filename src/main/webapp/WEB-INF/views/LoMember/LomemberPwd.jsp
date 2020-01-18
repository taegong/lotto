<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE HTML>
<html>
	<head>
	
	 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script></script>
			<script type="text/javascript">
			  $(document).ready(function(){
				  
				  
			     	
			     	//로그인
			     	$("#PwdChk").click(function(){
			             
			     		//값 셋팅
			     		var objParams = {
			     				TB_member_ID		: $("#TB_member_ID").val(),
			     				TB_member_Password		: $("#TB_member_Password").val()
							};
			     		
			     		alert("1");
			     		
			     		
			     		//ajax 호출
			     		$.ajax({
			     			url			:	"/LottoPchkOk",
			     			dataType	:	"json",
			     			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
			     			type 		:	"post",
			     			async		: 	false, //동기: false, 비동기: ture
			     			data		:	objParams,
			     			success 	:	function(loginchk){
			     				alert("성공");
			     				if(loginchk == 0)
			     					{
			     					alert("비밀번호를 확인해주세요.");
			     					}
			     				else{
			     					
			     					 opener.location.href="/MemberUpdate";
			     					  self.close();
			     				}
			     			},
			     			error		:	function(request, status, error){
			     				console.log("AJAX_ERROR");
			     			}
			     		});
			     		
							
			     	});
			     	
			     	
			     
			     });
				
			</script>
		<title>오늘의 로또</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
	</head>
	
							<!-- Content -->
    <div class="container">
    <BR>
								<article>
						  <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원정보수정</h2>


    
                
                <input class="form-control" name="TB_member_ID" id="TB_member_ID" type="hidden" value="${sessionScope.memberinfo.TB_member_ID}">
               
           
            
            
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
            <button id="PwdChk" name="PwdChk" class="btn btn-flat waves-effect waves-light shopping-cart-button">로그인 하기</button>
					
        </div>
      </div>
      
   
    </div>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Theme CSS -->
  <link href="/resources/css/freelancer.min.css" rel="stylesheet">
	</body>
</html>