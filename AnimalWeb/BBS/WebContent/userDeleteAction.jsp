<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class = "user.User" scope = "page" />
<jsp:setProperty name = "user" property="userID" />
<jsp:setProperty name = "user" property="userPW" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title> 회원탈퇴 처리 </title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}

		if(user.getUserID() == null || user.getUserPW() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('빈 칸을 모두 입력해 주세요.')");
				script.println("history.back()");
				script.println("</script>");
		}
		else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.userDelete(user.getUserID(), user.getUserPW());
		
			if(result == 1) {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원탈퇴가 완료되었습니다.')");
				script.println("location.href = 'logoutAction.jsp'");
				script.println("</script>");
			}
			else if (result == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 일치하지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디가 일치하지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if (result == -2) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('DB오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
