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
		font-size: 40px;
	}
	h1.a {
		font-weight: normal;
	}
	h1.b {
		font-weight: normal;
		font-size: 25px;
	}
	.tg  {border:none;border-collapse:collapse;border-color:#ccc;border-spacing:0;}
	.tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
 			 font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{background-color:#fff;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
 		 	font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-cly1{text-align:left;vertical-align:middle}
	.tg .tg-lboi{border-color:inherit;text-align:left;vertical-align:middle}
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
    			<li class = "active"><a href = "animalInfo.jsp">동물정보</a>
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
    </nav><br/><br/>
   <!-- <a href = "dogInfo.jsp"><img src = "images/dogInfo.png" width = "300" height = "500"></a> -->
    <!-- <h1 align = "center" class = "a"> I Love Pet 홈페이지에 오신것을 환영합니다! </h1> -->
        <h1 align = "center" class = "a"> &lt;&lt;&nbsp;원하는 동물을 클릭하세요&nbsp;&gt;&gt; </h1><br>
	<table class="tg" align = "center">
	<thead>
  		<tr>
    		<th class="tg-lboi"><a href = "dogInfo.jsp"><img src = "images/dogInfo.png" width = "300" height = "400" title = "강아지 정보 확인하기" alt = "강아지 사진"></a></th>
    		<th class="tg-lboi"><a href = "catInfo.jsp"><img src = "images/catInfo.png" width = "300" height = "400" title = "고양이 정보 확인하기" alt = "고양이 사진"></a></th>
   			<th class="tg-lboi"><a href = "parrotInfo.jsp"><img src = "images/parrotInfo.png" width = "300" height = "400" title = "앵무새 정보 확인하기" alt = "앵무새 사진"></a></th>
  		</tr>
	</thead>
	<tbody>
  		<tr>
   			<td class="tg-cly1"><a href = "HedgehogInfo.jsp"><img src = "images/HedgehogInfo.png" width = "300" height = "400" title = "고슴도치 정보 확인하기" alt = "고슴도치 사진"></a></td>
    		<td class="tg-cly1"><a href = "rabbitInfo.jsp"><img src = "images/rabbitInfo.png" width = "300" height = "400" title = "토끼 정보 확인하기" alt = "토끼 사진"></a></td>
    		<td class="tg-cly1"><a href = "guineapigInfo.jsp"><img src = "images/guineapigInfo.png" width = "300" height = "400" title = "기니피그 정보 확인하기" alt = "기니피그 사진"></a></td>
  		</tr>
	</tbody>
	</table>
  <footer class="navbar navbar-default">
    <div class="navbar-footer">
      <p class="m-0 text-center text-white" style = "font-size : 15px; "><strong>Copyright &copy; I Love Pet 2020 </strong><br/> 201607057 백승현</p>
    </div>
  </footer>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
</body>
</html>
