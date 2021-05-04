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
        <h1 align = "center" class = "a"> &lt;&lt;&nbsp;강이지에 대해&nbsp;&gt;&gt; </h1>
        
        <table class="tg" align = "center" width = "1000">
        <thead>
        	<tr>
        		<th class="tg-mv9k" height = "10" style = "text-align : center; font-size : 20;"><b>종류</b></th>
    			<th class="tg-mv9k" style = "text-align : center; font-size : 20;"><b>특징</b></th>
  			</tr>
		</thead>
		<tbody>
  			<tr>
    			<td style = "text-align: center; valign: center; width : 200;"><b>말티즈</b></td>
				<td>말티즈는 피난처, 항구를 뜻하는 셈족의 언어 'malat'에서 유래했다. 체구는 작고 몸통은 길며, 하얀 피모를 가졌다. 매우 온순하며 굉장히 영리하다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>프렌치 불독</b></td>
    			<td>프렌치 불독은 소형 몰로시안 견종으로 작고 짧은 체구이나 다부진 체형을 가졌다. 매끄러운 털, 들창코, 쫑긋 서 있는 귀, 태성적으로 짧은 꼬리가 특징이다. 사교적이고 열정이 넘친다.</td>
  			</tr>
  			<tr>
   				<td style = "text-align: center; valign: center;"><b>비글</b></td>
    			<td>작고 야무진 체구에 단단한 근육질의 몸을 갖고 있는 사냥개로 원래 토끼사냥에 주로 쓰였다고 한다. 후각이 뛰어나게 발달해 최근 마약 탐지견 및 밀수품 탐지견으로도 쓰이고 있다. 깔끔하고 영리해 보이는 귀여운 외모와 함께 만화 〈스누피〉의 모델로도 유명하다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>골든 리트리버</b></td>
    			<td>골든 리트리버는 길고 윤기나는 황금빛 털을 가지고 있는 대형견이다. 처음에는 수렵 목적으로 이용됐지만 미국에서 반려견으로 사랑받은 이후 대표적인 반려견 중 하나로 떠올랐다. 온순하고 밝은 성격이 특징이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>닥스훈트</b></td>
    			<td> 닥스훈트는 몸은 길지만 전체적으로 작고 다부진 체형에 발달된 근육을 가진 견종이다. 후각이 우수하며 열정과 인내심을 두루 갖추고 민첩하게 움직이는 사냥견이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>버니즈 마운틴 도그</b></td>
    			<td>버니즈 마운틴 독은 농장에서 기르는 견종으로 체구는 중형 이상이며 전체적으로 조화롭고 균형이 잘 잡혔다. 성격은 원만하고 유순하다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>요크셔 테리어</b></td>
    			<td>요크셔 테리어는 1850년대에 처음 등장한 견종으로 옛 견종인 '블랙 앤 탄 테리어'에서 유래되었다. 기다란 털이 코에서부터 꼬리 끝까지 몸 양쪽에서 균등하게 나뉘어 아래로 곧게 뻗은 것이 특징이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>포메라니안</b></td>
    			<td>지금은 작은 애완견이지만 포메라니안은 북극에서 썰매를 끌던 개들의 후손으로 초창기에는 지금보다 큰 편이었다. 공처럼 둥글고 풍성하게 부풀어 오른 털이 특징이다.</td>
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
