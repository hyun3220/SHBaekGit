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
<link rel="stylesheet" href="css/table.css">
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
	.tg  {border:none;border-collapse:collapse;border-color:#ccc;border-spacing:0;}
	.tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
  			font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg th{background-color:#f0f0f0;border-color:#ccc;border-style:solid;border-width:0px;color:#333;
  			font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-mv9k{border-color:#f0f0f0;text-align:left;vertical-align:top}
</style> 
</head>
<body background = "images/dogBack2.jpg" style = "background-position : -500px -92px">
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
    			<!-- <li class = "active"><a href = "petInfo.jsp">동물정보</a> -->
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
    </nav>
    <div class = "container">
        <h1 align = "center" class = "a"> &lt;&lt;&nbsp;기니피그에 대해&nbsp;&gt;&gt; </h1>
        
        <table class="tg" align = "center" width = "1000">
        <thead>
        	<tr>
        		<th class="tg-mv9k" height = "10" style = "text-align : center; font-size : 20;"><b>종류</b></th>
    			<th class="tg-mv9k" style = "text-align : center; font-size : 20;"><b>특징</b></th>
  			</tr>
		</thead>
		<tbody>
  			<tr>
    			<td style = "text-align: center; valign: center; width : 200;"><b>아비시니안</b></td>
				<td>1800년경 영국에서 개량되어 나온 품종이다. 털에 윤기가 흐르고 빛에 비추면 빛나는 특징을 가지고 있다. 털이 소용돌이처럼 서있고 길이는 3.5cm정도 된다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>아메리칸 세틴</b></td>
    			<td>흔히 볼 수 있는 품종으로, 털이 단정하고 짧은 것이 특징이다. 털의 길이는 3cm정도 되며, 구부러짐이 없는 반듯한 털로 구성되어 있다. 남미에서 유럽과 미국으로 수입된 품종이다. </td>
  			</tr>
  			<tr>
   				<td style = "text-align: center; valign: center;"><b>코로넷</b></td>
    			<td>원래는 존재하지 않았던 품종이지만 머리에 가마가 있는 크레스티드와 털이 긴 실키 품종 사이에서 태어났으며, 털이 길고 머리의 가마가 왕관처럼 보인다고 해서 붙여진 이름이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>페루비안</b></td>
    			<td>털이 제일 킨 품종으로 여러 장모종의 시초라고 할 수 있다. 1800년경 파리에서 등장했고, 엉덩이와 머리 부분에 가마가 있는 것이 특징인 페루비안은 털이 길게 자라기 때문에 앞 뒤를 구분하기 어렵다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>실키</b></td>
    			<td>몸 전체의 털이 다른 품종보다 길다. 머리 부분의 털을 짧지만 몸에 있는 털은 매달 2.2cm씩 자라고 가마가 없는게 특징이며, 1930년 경 페루비안이 모태이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>테디</b></td>
    			<td>테디는 털이 짧고 정전기가 생긴 것처럼 위로 서있는 털을 가지고 있다. 짧지만 곱슬곱슬하고 부드럽게 서있는 털이 특징이다. 영국의 렉스와 비슷한 품종이지만 서로 다른 유전자를 가졌다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>텍셀</b></td>
    			<td>텍셀은 1980년경 영국의 실키와 렉스를 품종 연구 뒤 탄생된 품종으로 텍셀의 특징으로 실키처럼 털이 길면서 곱슬곱슬한 털을 가지고 있어 엉키기 쉽다. 여러 품종 중 3번째로 인기가 많은 텍셀은 빗이 아닌 사람의 손으로 자주 관리해 주어야 한다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>메리노</b></td>
    			<td>메리노는 털이 길고 곱슬곱슬해 텍셀과 비슷하지만 머리에 가마가 있다는 점이 다르다. 몸의 뒤쪽 털이 다른 부분의 털보다 길고, 털 관리가 상당이 힘든 품종이기때문에 일일이 손으로 엉킨 부분을 풀어줘야한다. 매일 관리가 필요한 품종이기에 주변을 최대한 꺠끗하게 해야한다.</td>
  			</tr>
		</tbody>
	</table>		
		<!-- <a href = "animalInfo.jsp" class = "btn btn-primary pull-right">뒤로가기</a> -->
		<!-- <a href = "dogInfo2.jsp" class = "btn btn-primary pull-center">다음</a> -->
	    <a href = "animalInfo.jsp" class = "btn btn-success pull-right">메뉴</a> 
	</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
</body>
</html>
