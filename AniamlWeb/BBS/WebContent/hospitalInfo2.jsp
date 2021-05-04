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
  			font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;text-align: center; valign: center;}
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
    					<li class = "active"><a href = "hospitalInfo.jsp">병원안내</a></li>
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
        <h1 align = "center" class = "a"> &lt;&lt;&nbsp;병원 안내&nbsp;&gt;&gt; </h1>
        
        <table class="tg" align = "center" width = "1000">
        <thead>
        	<tr>
        		<th class="tg-mv9k" height = "10" style = "text-align : center; font-size : 20;"><b>병원명</b></th>
    			<th class="tg-mv9k" style = "text-align : center; font-size : 20;"><b>위치</b></th>
    			<th class="tg-mv9k" style = "text-align : center; font-size : 20;"><b>주소</b></th>
    			<th class="tg-mv9k" style = "text-align : center; font-size : 20;"><b>전화번호</b></th>
  			</tr>
		</thead>
		<tbody>
  			<tr>
    			<td style = "valign: center; width : 200;"><b>로뎀동물병원</b></td>
				<td>경기 부천시 원미로 117</td>
				<td>-</td>
				<td>032-611-8976</td>
  			</tr>
  			<tr>
    			<td><b>햇빛 동물병원</b></td>
    			<td>경기 부천시 평천로 718</td>
    			<td>-</td>
    			<td>032-676-7584</td>
  			</tr>
  			<tr>
   				<td><b>서울베스트동물병원</b></td>
    			<td>경기 부천시 장말로 219</td>
    			<td>-</td>
    			<td>032-652-0075</td>
  			</tr>
  			<tr>
    			<td><b>쿨펫동물병원 이마트중동점</b></td>
    			<td>경기 부천시 석천로 188</td>
    			<td>-</td>
    			<td>032-325-9617</td>
  			</tr>
  			<tr>
    			<td><b>24시이지동물의료센터</b></td>
    			<td>경기 부천시 부일로 712</td>
    			<td>http://ezamc.kr/</td>
    			<td>0507-1425-7976</td>
  			</tr>
  			<tr>
    			<td><b>동물병원Be</b></td>
    			<td>경기 부천시 범안로 55</td>
    			<td>-</td>
    			<td>032-349-7975</td>
  			</tr>
  			<tr>
    			<td><b>24시 스카이 동물병원</b></td>
    			<td>경기 부천시 길주로 252</td>
    			<td>http://www.skyamg.com</td>
    			<td>0507-1304-7579</td>
  			</tr>
  			<tr>
    			<td><b>다솜 동물병원</b></td>
    			<td>경기 부천시 지봉로 116</td>
    			<td>-</td>
    			<td>032-351-3031</td>
  			</tr>
  			<tr>
    			<td><b>현대동물병원</b></td>
    			<td>경기 부천시 송내대로265번길 85</td>
    			<td>-</td>
    			<td>032-328-8440</td>
  			</tr>
  			<tr>
    			<td><b>원종동물병원</b></td>
    			<td>경기 부천시 소사로 793</td>
    			<td>http://blog.naver.com/wonjongah</td>
    			<td>032-679-5575</td>
  			</tr>
		</tbody>
	</table>		
		<!-- <a href = "animalInfo.jsp" class = "btn btn-primary pull-right">뒤로가기</a> -->
		<!-- <a href = "dogInfo2.jsp" class = "btn btn-primary pull-center">다음</a> -->
		<a href = "hospitalInfo.jsp" class = "btn btn-success pull-right">◀이전</a> 
	</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
</body>
</html>
