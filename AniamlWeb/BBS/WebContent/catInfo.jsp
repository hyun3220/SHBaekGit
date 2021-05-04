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
        <h1 align = "center" class = "a"> &lt;&lt;&nbsp;고양이에 대해&nbsp;&gt;&gt; </h1>
        
        <table class="tg" align = "center" width = "1000" style = "world-break : break-all;">
        <thead>
        	<tr>
        		<th class="tg-mv9k" height = "10" style = "text-align : center; font-size : 20;"><b>종&nbsp;&nbsp;&nbsp;류</b></th>
    			<th class="tg-mv9k" style = "text-align : center; font-size : 20;"><b>특&nbsp;&nbsp;&nbsp;징</b></th>
  			</tr>
		</thead>
		<tbody>
  			<tr>
    			<td style = "text-align: center; valign: center; width : 200;"><b>페르시안</b></td>
				<td>길고 풍성한 털이 매력적인 페르시안은 가슴 쪽 장식 털이 유난히 풍성하며, 둥글고 넓적한 얼굴과 통통한 볼살을 갖고 있다. 또 두 눈의 간격이 넓고, 얼굴에 비해 작은 귀를 갖고 있으며 코가 납작하게 눌려있는 대표적인 단두종 고양이이기도 하다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>러시안 블루</b></td>
    			<td>러시아 북쪽의 아크엔젤(Archangel) 제도에서 유래한 고양이가 영국으로 전해진 이후 교배를 통하여 현재의 러시안블루가 만들어졌을 것이라 여겨진다. 가장 큰 외형적 특징은 탄탄하고 날렵한 몸을 짧은 은빛을 띤 푸른색의 털이 촘촘히 덮고 있는 것이다. 매끈거리는 털은 끝 부분으로 갈수록 은빛을 띤다. 무늬는 가지고 있지 않다. 머리는 V자 형이며 이마가 평평하고 목이 길고 가늘다.</td>
  			</tr>
  			<tr>
   				<td style = "text-align: center; valign: center;"><b>아비니시안</b></td>
    			<td>몸매는 힘 있는 곡선을 그리며, 눈 주변에 마치 아이라인을 그린 듯한 검은 띠가 있다. 눈의 색깔은 구리색, 금색, 노란연두, 녹색 등이 있으며 푸른색 눈이나 짝눈은 나타나지 않는다. 온순한 성격이면서도 대단히 활발하고 놀이를 좋아한다. 끊임없이 돌아다니기를 좋아하기 때문에 사람에게 얌전히 안겨 있는 것보다는 늘 주변을 맴돌며 주인이 무얼 하는지 지켜보는 것을 좋아한다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>노르웨이 숲</b></td>
    			<td>이름 그대로 노르웨이 숲에서 자연 발생한 고양이로, 추운 곳에서 살아남기 위해 장모의 털을 가지고 있으며, 이중모로 추위에 강하다. 4~7kg의 몸무게로 다른 종에 비해 조금 큰 중대형묘에 속하고, 일반적인 고양이들에 비해 3~4살, 늦으면 5살 까지 자란다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>메인쿤</b></td>
    			<td>온순한 성격의 고양이인 메인쿤은 어떤 환경에 대해서도 적응력이 높으며 무겁지만 윤기가 있는 피모를 가지고 있다. 중형에서 대형의 크기를 가지며, 암컷보다 수컷이 더 크다. 몸통은 길고 사각형 모양이며 꼬리 역시 길다. 이러한 특징으로 다른 고양이보다 훨씬 크게 보이는 경향이 있다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>시암 고양이</b></td>
    			<td>호리호리하고 날씬한 몸매에, 털은 짧고 가늘다. 머리는 삼각형이고 목은 비교적 길다. 귀도 삼각형으로 크며, 위를 향해 쫑긋 세워져 있다. 뒷다리가 앞다리보다 다소 길고, 꼬리는 길되 끝은 가늘다. 몸 빛깔은 회백색 또는 엷은 황갈색이며 귀·꼬리·주둥이·앞뒷다리 등의 말단부는 갈색, 붉은색 등의 짙은 색을 띤다. 눈은 모두 아름다운 사파이어색이며, 주위 환경이나 온도에 따라 색깔에 약간의 변화가 생기기도 한다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>아메리칸 숏헤어</b></td>
    			<td>몸체는 둥근 사각형의 느낌을 주지만 코비 체형보다는 몸체와 다리, 꼬리가 길며 특히 가슴이 넓다. 부드럽거나 처지지 않은 단단한 근육질 체형. 머리는 둥근 형태로 뺨이 통통하다. 실버계열의 고양이는 초록색, 브라운계열의 고양이는 금색 눈이 매우 잘 어울린다. 짧은 털이지만 털이 굵고 빽빽하기 때문에 주 2~3회 정도 빗질해준다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>스코티시 폴드</b></td>
    			<td>가장 독특하게 눈에 띄는 외형적 특성은 접힌 귀이다. 이 귀는 불완전 우성 유전자에 의한 것으로 접히지 않은 형태의 귀를 가진 새끼가 태어나는 경우도 있다. 갓 태어난 새끼는 모두 곧은 귀를 가지고 있으며 3~4주가 지나면 귀가 접히는지의 여부가 결정이 된다. 얼굴, 목, 몸통, 다리가 모두 짧고 통통하다. 짧고 부드러운 털이 온몸에 조밀하게 나 있다. 머리는 넓은 편이며 주둥이가 짧다. 두 눈 사이의 거리는 다소 멀다. 털의 색과 무늬는 매우 다양하다. 부드럽고 상냥한 인상과 접힌 귀 때문에 올빼미, 테디베어, 픽시(요정)라는 별명을 갖는다.</td>
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
