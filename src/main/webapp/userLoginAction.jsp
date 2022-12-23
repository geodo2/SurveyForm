<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.*, util.*"%>
<%@ page import='java.net.URLEncoder' %>
<%@ page import='java.net.URLDecoder' %>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPassword = null;
	if(request.getParameter("userID") != null)
		userID = request.getParameter("userID");
	if(request.getParameter("userPassword") != null)
		userPassword = request.getParameter("userPassword");

	if(userID == null || userPassword == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");

		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(userID, userPassword);
	if(result == 1) {
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	} else if(result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");

		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else if(result == -1){
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");

		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else if(result == -2){
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");

		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
		
	}
%>