<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title> 회원가입 </title>
</head>
<body background = "images/dogBack2.jpg" style = "background-position : -500px -92px">
	<!-- 메뉴바(네비게이션) -->
	<%
		String userID = null;
		String userName = null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if (session.getAttribute("userName") != null) {
			userName = (String) session.getAttribute("userName");
		}
	%>
	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" 
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span>
     			<span class="icon-bar"></span>
     			<span class="icon-bar"></span>
    		</button>
    		<a class = "navbar-brand" href = "main.jsp" style = "font-size: 25px;">I Love Pet</a>
    	</div>
    	<div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
    		<ul class = "nav navbar-nav">
    			<li><a href = "main.jsp">홈</a>
    			<li><a href = "#">페이지소개</a>
    			<li><a href = "bbs.jsp">자유게시판</a>
    			<!-- <li><a href = "#">동물정보</a> -->
    			<li><a href = "animalInfo.jsp">동물정보</a>
    			
    			
    			<!-- <li><a href = "#">병원안내</a> -->
    		    <%
    				if(userID != null) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("menu.style.display = 'visible'");
						script.println("</script>");
				%>
	 			<li class = "dropdown">
    				<a href = "#" class = "dropdown-toggle" data-toggle = "dropdown" role = "button" aria-haspopup = "true"
    					aria-expanded = "false">회원전용<span class = "caret"></span></a>
    				<ul class = "dropdown-menu">
    					<li><a href = "hospitalInfo.jsp">병원안내</a></li>
    					<li><a href = "tipInfo.jsp">유용한사이트</a></li>
    				</ul>
    				<%	
    					} else {
    						PrintWriter script = response.getWriter();
    						script.println("<script>");
    						script.println("menu.style.display = 'hidden'");
    						script.println("</script>");
    					}
       			 	%>
    		</ul>
    		<%
    			if(userID == null) {
    		%>
    		<ul class = "nav navbar-nav navbar-right">
    			<li class = "dropdown">
    				<a href = "#" class = "dropdown-toggle" data-toggle = "dropdown" role = "button" aria-haspopup = "true"
    					aria-expanded = "false">회원메뉴<span class = "caret"></span></a>
    				<ul class = "dropdown-menu">
    					<li><a href = "login.jsp">로그인</a></li>
    					<li><a href = "join.jsp">회원가입</a></li>
    				</ul>
    			</li>
    		</ul>
    		<%
    			} else {
    		%>
    		
    		    		<ul class = "nav navbar-nav navbar-right">
    			<li class = "dropdown">
    				<a href = "#" class = "dropdown-toggle" data-toggle = "dropdown" role = "button" aria-haspopup = "true"
    					aria-expanded = "false">회원관리<span class = "caret"></span></a>
    				<ul class = "dropdown-menu">
    					<li><a href = "logoutAction.jsp">로그아웃</a></li>
    					<li><a href = "userDelete.jsp">회원탈퇴</a></li>
    				</ul>
    			</li>
    		</ul>
    		
    		<% 
    			}
    		%>
    	</div>
    </nav>
<!-- 로그인 폼 -->
<div class="container">
	<div class="col-lg-4"></div>
  		<div class="col-lg-4">
   			<div class="jumbotron" style="padding-top: 20px;">
   				<form method = "post" action = "userUpdateAction.jsp">
   					<h3 style = "text-align : center;"> 회원정보 수정 </h3>
   					<div class = "form-group">			
   						<input type = "text" class = "form-control" value = "<%= userID %>" name="userID" maxlength="20" readonly>
   					</div>
   					<div class = "form-group">
   						<input type = "password" class = "form-control" placeholder="변경할 비밀번호" name="userPW" maxlength="20">
   					</div>
   					 <div class="form-group">
   					  	<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
   					  </div>
   					  <div class="form-group" style = "text-align : center;">
   					  	<div class = "btn-group" data-toggle = "buttons">
   					  		<label class = "btn btn-primary active">
    							<input type = "radio" name = "userGender" autocomplete = "off" value = "남성" checked>남성
    						</label>
    						<label class = "btn btn-primary">
    							<input type = "radio" name = "userGender" autocomplete = "off" value = "여성" >여성
    						</label>
    					</div>
   					 </div>
  					 <div class="form-group">
     					<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
    				 </div>
   					    <input onclick = "return confirm('수정하시겠습니까?')" type="submit" class="btn btn-primary form-control" value="확인">
   				</form>
   			</div>
   		</div>
   		<div class = "col-lg-4"></div>
   </div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
</body>
</html>
