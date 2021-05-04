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
        <h1 align = "center" class = "a"> &lt;&lt;&nbsp;고슴도치에 대해&nbsp;&gt;&gt; </h1>
        
        <table class="tg" align = "center" width = "1000">
        <thead>
        	<tr>
        		<th class="tg-mv9k" height = "10" style = "text-align : center; font-size : 20;"><b>종류</b></th>
    			<th class="tg-mv9k" style = "text-align : center; font-size : 20;"><b>특징</b></th>
  			</tr>
		</thead>
		<tbody>
  			<tr>
    			<td style = "text-align: center; valign: center; width : 200;"><b>스노우 샴페인</b></td>
				<td>스노우 샴페인은 가시의 30%가 흰색, 크림색을 띄며 나머지는 아주 연한 갈색을 띄고있다. 눈은 블랙 루비와 레드 루비 색으로 구분된다. </td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>플라티나</b></td>
    			<td>플라티나는 입 주변과 귀 발 부분의 검은 갈색을 띄고 있다. 가시가 스탠다드 보다 더 진하다</td>
  			</tr>
  			<tr>
   				<td style = "text-align: center; valign: center;"><b>스탠다드</b></td>
    			<td>가장 일반적이고 대표적인 고슴도치 종류로 검은 눈에 얕은 회색 피부, 회색 마스크에 검은 코를 가지고 있으며 다리에 검은색이 적거나 없다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>화이트 초코</b></td>
    			<td>화이트 초코는 가시 색이 스노우 샴페인보다 더 진한색이며 화이트 초코 밴드가 더 진한색을 띄고 있다. 코는 진한 밤색/갈색 계통으로, 얼굴과 귀는 밝은 갉색이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>실버챠콜</b></td>
    			<td>실버챠콜은 마스크와 귀 부분은 어두운 갈색을 띄고 있으며 가시의 80%는 화이트 색이고 나머지 20%가 어두운 갈색으로 덮여있다. 눈은 검은색이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>알비노</b></td>
    			<td>선천적인 색소 결핌으로 온 몸과 가시가 하얀색을 띄고, 눈도 빨갛게 보이며 빛에 약한 특징을 가지고 있다. 시력 또한 일반적인 고슴도치보다 훨씬 떨어진다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>화이트 샴페인</b></td>
    			<td>스노우 샴페인과 같은 샴페인 계열의 한 종류이다. 95~97% 가시는 밴드 없는 흰색이며, 나머지는 밝은 오렌지와 회색의 밴드가 있다. 눈이 블랙 루비와 레드 루비가 있다. 등과 배는 핑크색으로 코는 갈색 테두리가 있는 분홍색이다.</td>
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
