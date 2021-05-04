<%@page import="com.mysql.cj.x.protobuf.MysqlxDatatypes.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title> 자유게시판 </title>
<style>
	a, a:hover {
		color : #000000;
		text-decoration: none;
	}
	h1 {
		font-family: 'Do Hyeon', sans-serif;
		font-size: 40px;
	}
	h1.a {
		font-weight: normal;
	}
</style>
</head>
<body background = "images/dogBack2.jpg" style = "background-position : -500px -92px">
	<%
		String userID = null;
	
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
    			<li class = "active"><a href = "bbs.jsp">자유게시판</a>
    			<!-- <li><a href = "petInfo.jsp">동물정보</a> -->
    			<li><a href = "animalInfo.jsp">동물정보</a>
    			
				<!-- <li><a href = "#">병원안내</a>  -->
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
    <h1 align = "center" class = "a"> &lt;&lt;&nbsp;자유게시판&nbsp;&gt;&gt; </h1><br>
    <div class = "container">
    	<div class = "row">
  			<table class = "table table-striped" style = "text-align : center; border : 1px solid #dddddd;">
  				<thead>
  					<tr>
  						<th style = "background-color : #eeeeee; text-align : center;">번호</th>
  						<th style = "background-color : #eeeeee; text-align : center;">제목</th>
  						<th style = "background-color : #eeeeee; text-align : center;">작성자</th>
  						<th style = "background-color : #eeeeee; text-align : center;">작성일</th>
  					</tr>
  				</thead>
  				<tbody>
  				<%
  					BbsDAO bbsDAO = new BbsDAO();
  					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
  					for(int i = 0; i < list.size(); i++) {
  				%>
  					<tr>
  						<td><%= list.get(i).getBbsID() %></td>
  						<td><a href = "view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
  						<td><%= list.get(i).getUserID() %> </td>
  						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16)  + "분" %> </td>
  					</tr>
  				<%
  					}
  				%>
  			</tbody>
  		</table>
  		<%
  			if(pageNumber != 1) {
  		%>
  			<a href = "bbs.jsp?pageNumber=<%= pageNumber-1 %>" class = "btn btn-success btn-arrow-left">◀이전</a>
  		<% 
  			} 
  			if (bbsDAO.nextPage(pageNumber + 1)) {
  		%>
  		<a href = "bbs.jsp?pageNumber=<%= pageNumber+1 %>" class = "btn btn-success btn-arrow-left">다음▶</a>
  		<%
  			}
  		%>
  		<a href = "write.jsp" class = "btn btn-primary pull-right">작성</a>
  	</div>
  </div>
    
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<script src="js/bootstrap.js"></script>
</body>
</html>
