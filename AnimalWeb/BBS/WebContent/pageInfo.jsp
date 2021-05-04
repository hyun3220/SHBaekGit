<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
<% 
String target = request.getParameter("target");
if (target == null) {
	target = "imgSlider";
}
String targetPage = target + ".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/slider.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> 
<title> I Love Pet </title>
<style>
	h1 {
		font-family: 'Do Hyeon', sans-serif;
		font-size: 5px;
	}
	h1.a {
		font-weight: normal;
	}
</style> 
</head>
<body>
	<%
		String userID = null;
	
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
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
    			<li class = "active"><a href = "pageInfo.jsp">페이지소개</a>
    			<li><a href = "bbs.jsp">자유게시판</a>
    			<!-- <li><a href = "petInfo.jsp">동물정보</a> -->
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
    					<li><a href = "userUpdate.jsp">정보수정</a></li>
    					<li><a href = "userDelete.jsp">회원탈퇴</a></li>
    				</ul>
    			</li>
    		</ul>
    		
    		<% 
    			}
    		%>
    		
    	</div>
    </nav><br/><br/><br/><br/><br/>
    <div class = "container">
    	<div class = "jumbotron">
    		    <div class = "container">
    		    	 <h1 style = "font-size: 26px;">I Love Pet 홈페이지는 모든 사람들에게 반려동물에 대한 각종 정보와 지식을 제공하는 홈페이지 입니다.</h1> 
    		    	 <p style = "font-size: 19px;">
    		    	    <b>1.</b> &nbsp;자유게시판은 모든 회원이 열람 가능하지만 글 작성은 회원만 가능합니다.<br/>
    		    	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>└</b> &nbsp;글 수정 및 삭제 버튼은 작성자 본인에게만 표시되며, 그 외의 회원에게는 보이지 않습니다.<br/>
    		    		<b>2.</b> &nbsp;동물 정보 게시판에서 각종 동물의 정보를 간단히 알 수 있습니다.<br/>
    		    		<b>3.</b> &nbsp;로그인을 완료한 회원은 회원 전용 메뉴를 이용할 수 있습니다.<br/>
    		    		<b>4.</b> &nbsp;회원 전용 메뉴에는 병원 안내, 유용한 사이트의 하위 메뉴가 존재합니다.<br/>
    		    		<b>5.</b> &nbsp;병원 안내 게시판은  가까운 동물 병원의 위치를 제공합니다.<br/>
    		    		<b>6.</b> &nbsp;유용한 사이트 게시판은 반려동물과 관련된 다양한 사이트를 제공합니다.<br/></p>
    		    </div>
    	</div>
    </div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
</body>
</html>
