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
        <h1 align = "center" class = "a"> &lt;&lt;&nbsp;앵무새에 대해&nbsp;&gt;&gt; </h1>
        
        <table class="tg" align = "center" width = "1000">
        <thead>
        	<tr>
        		<th class="tg-mv9k" height = "10" style = "text-align : center; font-size : 20;"><b>종류</b></th>
    			<th class="tg-mv9k" style = "text-align : center; font-size : 20;"><b>특징</b></th>
  			</tr>
		</thead>
		<tbody>
  			<tr>
    			<td style = "text-align: center; valign: center; width : 200;"><b>모란앵무</b></td>
				<td>니아사사랑새·모란잉꼬라고도 한다. 몸길이 13.5cm이다. 깃털은 녹색으로 등과 날개 쪽이 더 짙고 몸 밑부분은 연하다. 머리는 밝은 붉은색에서 오렌지색이고, 이마는 더 밝으며 뺨, 목, 가슴 위쪽은 더 연하다. 눈 주위의 테두리는 깃털이 없이 흰 피부가 보인다. 부리는 붉은색이고 다리는 회색이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>사랑앵무</b></td>
    			<td>녹색잉꼬라고도 한다. 몸길이 18∼20cm로 작고 유선형의 새이다. 뾰족한 날개와 꼬리, 작은 몸집, 독특한 깃털 빛깔 등으로 다른 종과 잘 구별된다. 이마는 노란색이고 머리는 노란색과 검은색 줄무늬가 있으며 뺨에는 자주색과 검은색의 반점이 있다. 부리는 뾰족하고 윗부리가 아랫부리보다 길며 목은 노란색이다.
					날개의 칼깃은 가운데가 검은색이고 그 테두리는 노란색이나 녹색이며 꼬리는 청록색이다. 사육종은 깃털 빛깔이 크게 다르다. 번식기의 암컷은 콧구멍을 덮고 있는 부리 주위의 피부가 파란색에서 옅은 갈색이나 베이지색으로 변한다.</td>
  			</tr>
  			<tr>
   				<td style = "text-align: center; valign: center;"><b>금강앵무</b></td>
    			<td>금강앵무는 홀로 또는 쌍으로 키운다. 금강앵무와 홍금강앵무는 모두 붉은색이 지배적이므로 혼동되나 금강앵무는 나출된 얼굴 피부는 흰색을 띠고 날개는 노란색과 청색의 같은 크기의 깃털이 있으며, 부리는 흰색이다. 애완용은 어린 새를 선택하는 것이 좋은데, 검은색 눈과 밤색 안면 깃털을 통해 알 수 있다. 이 새는 몸집은 크지만 작은 장에서도 쌍으로 키울 수 있다. 맥주통과 같은 큰 둥지를 마련해 주고 둥지 안에 나무토막을 설치해 준다. 번식기에는 주인에게도 공격적이며, 간섭을 싫어하므로 자유롭게 키운다.</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>썬코뉴어</b></td>
    			<td>썬코뉴어는 동그란 눈동자에 흰색의 눈테가 있고, 검은 부리와 머리부터 몸통까지는 썬코뉴어란 이름처럼 태양과 같은 강렬한 샛노란빛의 깃을 가졌고, 날개끝부터 꼬리깃은 진한 초록색이다.몸무게는 보통 100~120g이며 체장은 30cm 내외이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>왕관앵무</b></td>
    			<td>몸길이 30cm이다. 오스트레일리아 원산이다. 크기는 30cm정도이며 몸무게는 90~120g의 중형이며 꽁지가 길게 자란다. 머리꼭대기에는 도가머리(우관, 羽冠)가 특징인데 그래서 왕관앵무라고 부른다. 야생에서 자라는 왕관앵무는 노란색의 머리와 깃털은 회색이 대표적이지만 애완동물로 사육되는 종류는 흰색, 회색, 여린 노란색 등 다양하며 얼룩점이 있는 종류도 많다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>유황앵무</b></td>
    			<td>작은황관앵무라고도 한다. 몸길이 33∼35cm의 대형 앵무이다. 몸빛깔은 흰색이고 부리와 다리는 검은색이다. 머리에 노란 도가머리가 있으며 흰 깃털에서는 상당한 양의 미세한 가루가 떨어진다. 어릴 때부터 길들이면 사람을 잘 따르고 한번 놀라면 놀라게 한 물체를 평생 기억한다. 혼자 놓아 두면 친구(주인)를 찾기 위해 소리를 지르는데, 이 때 심하게 나무라면 성질이 나빠지고 자기 깃털을 뜯는 자학증세도 생긴다. 어릴 때부터 가르치면 10마디 안팎의 말도 할 수 있으나 말하는 능력은 그리 좋지 못하다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>회색앵무</b></td>
    			<td>회색앵무는 대형 새이지만 겁이 많은 편이며, 추위에 강하지만 첫 추위는 주의한다. 회색앵무의 체모는 대부분 흑회색이다. 머리와 등, 복부의 털 끝부분의 흰 줄무늬는 비늘 모양이다. 눈 주위와 얼굴 대부분은 나출된 흰 피부로 되어 있고, 날개는 암회색으로 검으며, 꼬리는 황색기가 도는 적색이다. 부리는 굵고 검으며, 다리는 흑회색이다. 암수 구별이 어려운데, 암컷은 수컷에 비해 다소 작고 굽은 쪽 부리가 크다. 이 새는 약간의 자극에도 거칠어지므로 침착해질 때까지 조용하게 다루며, 최소 2m×4m×3m 정도의 큰 새장에서 사육하는 것이 좋다.</tr>
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
