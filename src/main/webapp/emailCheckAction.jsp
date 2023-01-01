<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.*, util.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	if(request.getParameter("code") != null) 
		code = request.getParameter("code");
	UserDAO userDAO = new UserDAO();
	String userID = null;
	if(session.getAttribute("userID") != null) 
		userID = (String) session.getAttribute("userID");
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	String userEmail = userDAO.getUserEmail(userID);
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	if(isRight) {
		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>