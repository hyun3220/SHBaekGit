<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class = "user.User" scope = "page" />
<jsp:setProperty name = "user" property="userID" />
<jsp:setProperty name = "user" property="userPW" />
<jsp:setProperty name = "user" property="userName" />
<jsp:setProperty name = "user" property="userGender" />
<jsp:setProperty name = "user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원정보 수정 처리 </title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if(user.getUserID() == null || user.getUserPW() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('빈 칸을 모두 입력해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.userUpdate(user);
		
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류가 발생했습니다.')");
				script.println("location.href = 'errorHandler.jsp'");
				script.println("</script>");
			}
			else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('정보가 수정되었습니다. 다시 로그인 해주세요.')");
				script.println("location.href = 'logoutAction.jsp'");
				script.println("</script>");
			}
		}
		
	%>
</body>
</html>
