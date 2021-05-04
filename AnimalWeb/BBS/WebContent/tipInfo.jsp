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
    			<li><a href = "pageInfo.jsp">페이지소개</a>
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
    					<li class = "active"><a href = "tipInfo.jsp">유용한사이트</a></li>
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
    		    	 <h1 style = "font-size: 26px;">※ 반려동물을 키우며 도움이 되는 사이트 추천 ※</h1> 
    		    	 <p style = "font-size: 19px;">
    		    	    <b>에이비펫</b> : 반려동물 종합 포털 사이트 <a href = "http://www.abpet.co.kr/" target="_blank">http://www.abpet.co.kr/</a><br/>
    		    		<b>마이펫 플러스</b> : 반려동물 전문 소셜 커머스 <a href = "https://www.mypetplus.co.kr/" target = "_black">https://www.mypetplus.co.kr/</a><br/>
						<b>야호펫</b> : 온라인 반려동물 매거진 모음<a href = "http://www.yahopet.co.kr" target = "_black">http://www.yahopet.co.kr</a><br/>
						<b>비마이펫</b> : 반려동물 ＆ 미디어 정보 제공 사이트 <a href = "https://mypetlife.co.kr/" target = "_black">https://mypetlife.co.kr/</a><br/>
						<b>동물조아</b> : 동물 관련 취업, 알바 등의 채용 정보 사이트 <a href = "http://job.zoozoa.com/main" target = "_black">http://job.zoozoa.com/main</a><br/>
						<b>노트펫</b> : 동물에 관한 뉴스를 제공하는 사이트 <a href = "https://www.notepet.co.kr/" target = "_black">https://www.notepet.co.kr/</a><br/>
						<b>동물보호관리시스템</b> : 유기묘, 유기견 등의 입양, 보호를 제공하는 사이트 <a href = "https://www.animal.go.kr/" target = "_black">https://www.animal.go.kr/</a><br/>
						<b>엔터펫</b> : 애완동물의 사료와 간식을 구매할 수 있는 사이트 <a href = "http://www.enterpet.com/" target = "_black">http://www.enterpet.com/</a><br/>
						<b>애완잡</b> : 동물 관련 구인, 구직 사이트 <a href = "https://www.aewanjob.com/" target = "_black">https://www.aewanjob.com/</a><br/>
    		    </div>
    	</div>
    </div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
</body>
</html>
