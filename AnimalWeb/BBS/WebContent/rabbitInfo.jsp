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
        <h1 align = "center" class = "a"> &lt;&lt;&nbsp;토끼에 대해&nbsp;&gt;&gt; </h1>
        
        <table class="tg" align = "center" width = "1000">
        <thead>
        	<tr>
        		<th class="tg-mv9k" height = "10" style = "text-align : center; font-size : 20;"><b>종류</b></th>
    			<th class="tg-mv9k" style = "text-align : center; font-size : 20;"><b>특징</b></th>
  			</tr>
		</thead>
		<tbody>
  			<tr>
    			<td style = "text-align: center; valign: center; width : 200;"><b>라이언 헤드</b></td>
				<td>집토끼의 한 품종이다. 몸무게는 1.7kg이며 털빛은 주로 흰색이 많지만, 귀 끝이 까만 종류와 갈색, 검은색, 회색 등 매우 다양하다. 얼굴 주변의 털이 마치 수컷 사자의 갈기를 닮았다. 몸집이 작고 털이 풍성하며 길다. 귀 길이는 8~9cm이다. 사교성이 좋다. 애완용으로 인기가 있으며 수명은 7~9년이다. 드워프와 스위스폭스를 교배한 개량종이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>네덜란드 드워프</b></td>
    			<td>홀란드(Holland)에서 개량된 소형토끼의 대명사로 최근에 가장 인기 있는 애완토끼로 자리잡았다. 무엇보다 기존의 토끼들에 비해 작은 크기가 특징인데, 순종일 경우 다 자라도 1.3kg 이내의 작은 몸집을 가진다. 크기만 작은 것이 아니라 외모에서도 동그란 눈과 얼굴, 짧은 귀, 보드랍고 촘촘한 털 등 깜찍하고 귀엽다. 흑진주처럼 까만 탠(tan), 산토끼 같은 느낌을 주는 갈색이나 회색의 아구티, 연한 색에서 진한 색으로의 그러데이션이 멋진 회색이나 연갈색톤의 세이블 타입까지 다양한 색상이 있다. 드와프오토(Dwarf Hotot)는 하얀 몸에 눈 주위만 새까매서 마치 마스카라를 칠한 것 같은 독특한 외모가 특징이다.</td>
  			</tr>
  			<tr>
   				<td style = "text-align: center; valign: center;"><b>더치</b></td>
    			<td>원산지는 네덜란드이며 영국에서 개량된 애완용 토끼이다. 몸무게 약 2kg의 미니 토끼로 체구가 작고 귀여워 관상용 애완종으로 널리 보급되어 있다. 털색깔은 원래 검은색과 흰색이지만 푸른색·노란색·초콜릿색·얼룩무늬 등 현재는 다양한 색깔로 바뀐 종류가 많다.얼굴은 코와 주둥이 부분만 희고 검정 또는 갈색 털이 눈 주위와 귀로 연결되어 있어 마치 V자를 거꾸로 뒤집어 놓은 듯한 특징적인 무늬가 있다. 목과 어깨에는 균일하게 몸 전체 길이의 3분의 1 정도의 흰색 띠가 있으며, 어깨의 흰 무늬는 항아리 모양으로 아래쪽이 넓다.전체적으로 몸 앞부분은 하얗고 중간에 뚜렷한 경계를 이루며 짙은 무늬가 뒤쪽으로 넓게 퍼져 있는 형태이다. 귀는 머리에 잘 붙어 있고 너무 길지 않으며 앞발과 뒷발은 모두 흰색이다. 
    				판다를 닮았다 하여 '판다토끼'라고도 한다. 임신기간은 약 30일이다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>롭</b></td>
    			<td>롭은 독특한 외모를 가진 토끼다. 두 귀가 강아지처럼 축 처진 것이 특징이며, 몸집은 둥글고 통통하다. 순하고 겁이 많은 편이며, 매우 다양하게 개량이 진행된 토끼다. 영국에서 처음 개량된 잉글리시롭(English Lop)은 모든 롭들의 조상격으로 바닥까지 끌리는 크고 긴 귀가 특징인데, 그 길이가 무려 68cm에 달한다고 한다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>표준 친칠라</b></td>
    			<td>프랑스에서 처음 육종되었으며, 그뒤 영국과 미국에서도 개량되었다. 이 품종은 남아메리카에 야생하는 친칠라의 모피색을 닮은 것이 특징이다. 표준종·중량종·거대종의 3가지가 있는데, 몸무게는 표준종이 약 3㎏, 중량종이 4∼5㎏, 거대종이 6∼7㎏이다. 가슴이 넓게 벌어져 있으며, 귀는 중간 크기로 곧게 서 있다. 털빛깔은 언뜻 보면 회색으로 보이나 털의 위치에 따라 색깔이 다르며, 모피의 질이 매우 우수하다. 성질이 온순하고, 체질이 튼튼하며, 번식력도 뛰어나다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>잉글리시 앙골라</b></td>
    			<td>토끼의 품종 중 하나. 터키가 원산인 품종으로 앙고라는 앙카라의 과거 이름이다. 털이 길고 복슬복슬하게 자라는 것이 특징으로 이 토끼의 털로 앙고라 니트라는 천을 짠다. 실제로 사진을 보면 털많은 토끼단계에서 토끼 머리만 보일 정도를 넘어 위 이미지처럼 솜뭉치인지 구분이 안가는 수준인 이미지가 여럿 나온다. 다만 실제로 앙고라 토끼가 흔히 알려진 것처럼 동글동글해지려면 털이 꽤 길어야 하는데, 그 정도로 나이를 먹어 자란 앙고라 토끼라면 무게가 꽤 나가게 된다. 성인 토끼 기준으로 가장 작은 잉글리시 종이 2~3kg 가량. 다른 종들은 5kg 내외까지 나간다.</td>
  			</tr>
  			<tr>
    			<td style = "text-align: center; valign: center;"><b>렉스</b></td>
    			<td>1919년 프랑스에서 벨지언종(Belgian) 토끼에서 돌연변이가 일어난 것을 기초로 하여 새로운 품종으로 개량한 것이다.한국에도 도입되어 도시 근교에서 부업으로 많이 기르고 있다. 털이 부드럽고 털빛깔이 고와 장식용 고급모피로 인기가 있다. 몸무게는 3.6∼5.5kg이고 성질이 온순하며 체질이 강건하여 기르기가 쉽다.</td>
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
