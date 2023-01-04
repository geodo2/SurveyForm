<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"  %>
<%@ page import="user.*, survey.*" %>
    <%@ page import="java.io.PrintWriter, java.util.*"%>
<%@ page import="survey.*, util.*"%>

<%@ page import='user.UserDAO' %>
<%@ page import='java.lang.reflect.Method, java.util.ArrayList' %>
<!DOCTYPE html>
<html>
<head>
    <style>
    	.anything{
    		float: right;
    	}
        .some{ 
        	  background-color: F1F1F1;
        	  width:1000px;'
			  color: white;
			  border: 2px solid black;
			    margin: 70px;
			  margin-left:470px;
			  padding: 20px;
			  
			  }
		.titleName{
				width: 300px;
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
		}
		.make-btn {
	    color: #fff;
	    background-color: tomato;
	    border-color: #28a745;
		}    
  		.bt_col {
	     background-color: #A4B2FF;
         color: white;
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
   request.setCharacterEncoding("UTF-8");
   Survey_answer_DAO surveyO = new Survey_answer_DAO();
  
   //세션정보 가져오기
   String userID = "";
   if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
		System.out.println(userID);
	}else{
		userID = "Guest";
		System.out.println(userID);
	}
   
   //엔서 리스트에 서베이 sequence 가져오고 그 sequence로 servey list에 제목 가져오기
  

   //답변  geodo2->userID로 바꿔야 함 . survey_answer에 reg data 사용 
   Survey_answer_list_VO[] survey_answer= surveyO.answer_list_userid("geodo2");
   System.out.println(survey_answer[0].getSurvey_seq()+"flag wo check");  
   
   int answer_list_length=survey_answer.length;
  
   
   
         
%>
<section class="container">
		
			 
			<div class="d-flex justify-content-center">
			<form method="post" action="./index.jsp">
			<button type="submit" class="btn bt_col mx-1 mt-2">내가 만든 설문</button>
			
			
			</form>
			<a class="btn btn-outline-primary" data-toggle="modal" href="#registerModal">응답한 설문</a>		
			</div>			
			<div>			
			</div>
<%
	for (int i=0; i<answer_list_length;i++){
		
		Survey_VO[] survey_list = surveyO.question_list_data(survey_answer[i].getSurvey_seq());
		
		
	


%>			
</section>	
			<div class="some">
				<div class="row">
				<img src="./image/tugas.jpg" alt="이미지" style="width:20;" />
						<div class="titleName">
						<%=survey_list[0].getSurvey_title() %>
						</div>
						<div class="when">
					답변 날짜: <%=survey_answer[i].getReg_data() %>
						</div>
						
				</div>
				<div class="lookanswer">
				<form method="post" action="./index.jsp">
				<button type="submit"  class="btn btn-secondary float-right">응답보기</button>
				</form>
				</div>			
			</div>
			
			
<%
}
%>			
			
	<div class="modal-footer">
	<form method="post" action="./makesurvey.jsp">
	<button type="submit" class="btn make-btn col-10-6 mt-4">설문 만들기</button>
	</form>
	
	</div>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/pooper.js"></script>
	<!-- 부트스츠랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>