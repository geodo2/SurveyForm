<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, java.util.ArrayList, java.net.URLEncoder" %>

<%@ page import="user.*, survey.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
    	.anything{
    		background-color: white;
    		float: right;
    	}
        .some{ 
        	  background-color: F1F1F1;
        	  width:1500px;'
			  color: white;
			  border: 2px solid black;
			  margin: 70px;
			  margin-left:370px;
			  padding: 20px;
			  
			  }
		.titleName{
				width: 450px;
				margin-right:20px;
				font-size:30px;
				font-weight:20px;
		}
		
		.when{
		font-size:20px;
		font-weight:20px;
		}
		.lookanswer{
		float: right;
		margin-bottom:50px;
		position: relative;
	    left: px;
	    top:-43px;
	    margin-right:30px;
		}
		.make-btn {
	    color: #fff;
	    background-color: tomato;
	    border-color: #28a745;
		}       
  </style>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name= "viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>설문조사 서비스</title>
<!-- 부트스트랩 추가하기 -->
<link rel= "stylesheet" href = "./css/bootstrap.min.css">
<!-- 커스텀 추가하기 -->
<link rel= "stylesheet" href = "./css/custom.css">
</head>
<body>
<% 
   request.setCharacterEncoding("UTF-8");

   String sid_num =request.getParameter("survey_num");
   int sid_number = Integer.parseInt(sid_num);
   Survey_answer_DAO surveyO = new Survey_answer_DAO();
   Survey_answer_list_VO[] answer_list = surveyO.answer_list(sid_number);	
	System.out.println(answer_list[0].getReg_data());
	System.out.println(answer_list[0].getUser_id());
	int answer_count = answer_list.length; 

%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">설문조사 서비스</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button> 
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" >메인</a>
				</li>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						회원관리
					</a>
			<div class="dropdown-menu"  aria-labelledby="dropdown">
				<a class="dropdown-item" href="userLogin.jsp">로그인</a>
				<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
				<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
			</div>
		</li>
	</ul>
</div>
</nav>
<%
 	 for(int i=0; i<answer_count; i++)
 	 {
		
%>			
	<div class="some">
				<div class="row">
					<img src="./image/tugas.jpg" alt="이미지" style="width:20;" />
						<div class="titleName">
							<%=answer_list[i].getUser_id()%>
							</div>
								<div class="when">
						<%=answer_list[0].getReg_data()%>
								</div>
							</div>
						
						<div class="lookanswer">
							<form method="post" action="./Survey_each_result.jsp?survey_num=<%=sid_number%>&&user_id=<%=answer_list[i].getUser_id()%>">
								<button type="submit"  class="btn btn-secondary float-right">응답 확인</button>
							</form>
						</div>
							
			</div>

 
<%
	 }
%>  
</body>
</html>