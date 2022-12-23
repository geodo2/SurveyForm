<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<style>
		.logbtn{
		    color: #fff;
		    background-color: #19416c;
		    line-height: 3.3;
		    width:100%;
		    margin-top:70px;
	        border: none;
		}
		.joinbtn{
		    color: #fff;
		 
	        border: none; 
		    width:100%;
		    background-color: #1d2124;
	
		    line-height: 3.3;
		}
		.joincomponent{
		    display: block;
		    width: 100%;
		    padding: .375rem .75rem;
		    font-size: 1rem;
		    line-height: 1.5;
		    color: #495057;
		    background-color: #dae0e5;
		    background-clip: padding-box;
		    border: 1px solid #ced4da;
		    border-radius: 0rem;
		    transition:
		}
		.surveyphoto{
	    position: fixed;
	    top:140px;
	    right:100px;
	    color: white;
	 
		}
		.loginbar{
		left: 100px;
	    margin-left: 100px;
	    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 4.5;
	    color: #212529;
	    
		width: 102%;
	    padding-right: 26px;
	    padding-left: 15px;
	    margin-right: auto;
		}
		.mk-4, .mk-4 {
		    margin-top: 9.5rem!important;
		}
		.brandlogo {
			top:120px;
			left:100px;
			position:fixed;
		    display: inline-block;
		    padding-top: .3125rem;
		    padding-bottom: .3125rem;
		    margin-right: 1rem;
		    font-size: 3.25rem;
		    line-height: inherit;
		    white-space: nowrap;
		    color:black;
		}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>설문조사 서비스</title>
<!-- bootstrap CSS 추가 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- custom CSS 추가 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
%>
	
		<a class="brandlogo" href="index.jsp">설문조사 서비스</a>

		
	<section class="loginbar mt-3" style="max-width: 560px;">
		<form method="post" action="./userLoginAction.jsp" style="
    margin-top: 220px;">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="userID" class="joincomponent">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="userPassword" class="joincomponent">
			</div>
			<button type="submit" class="logbtn">로그인</button>
		</form>
		<form method="post" action="./userJoin.jsp">
		<button type="submit" class="joinbtn" >회원가입</button>
		</form>
	</section>
	<div class= "surveyphoto"><img src="./image/easy_photo.jpg" alt="이미지" style="height:550px" /></div>
	
	
	
	</footer>
	<!-- jQuery 추가 -->
	<script src="./js/jquery.min.js"></script>
	<!-- pooper 추가 -->
	<script src="./js/popper.js"></script>
	<!-- bootstrap.js 추가 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>