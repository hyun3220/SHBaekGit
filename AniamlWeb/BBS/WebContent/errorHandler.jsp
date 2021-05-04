<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page isErrorPage = "true" %>	<!-- 현재 페이지가 error 발생 시 출력되는 페이지 임을 알려줌 -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/slider.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> 
<meta charset="UTF-8">
<title> Error Page </title>
<style>
	tr, tr:hover {
		color : #000000;
		text-decoration: none;
	}
	h1 {
		background-color : yellow;
	}
</style>
</head>
<body>
<br/><br/><br/><br/><br/>
 <div class = "container">
    	<div class = "jumbotron">
    		    <div class = "container">
    		    	 <h1 style = "font-size: 30px;" align = "center" >&lt;&lt;회원정보 수정 중 오류가 발생했습니다.&gt;&gt;</h1> 
    		    	 <p style = "font-size: 19px;">
    		    	    빠른 시일 내에 처리하겠습니다.<br/>
    		    	    자세한 사항은 아래 이메일로 문의해 주시기 바랍니다.<br/>
    		    	 <h2>문의 : jspTest@naver.com</h2></p>
    		    	<a href = "main.jsp" class = "btn btn-primary pull-right">홈으로</a>
    		    </div>
    	</div>
    </div>
</body>
</html>
