<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, java.util.ArrayList, java.net.URLEncoder" %>

<%@ page import="user.*, survey.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
	.submitBtn{
         width:200px;
        
         right:47px;
         position: fixed;
         bottom: 60px;
         color: white;
         
         
         margin-right: 25px;
         margin-top: 120px;
         background-color: #FF7B54;
         color: white;
         border: none;

         font-weight: bold;
         font-size: 25px;
         
         padding: 17px 30px 15px 30px;
         box-shadow: 3px 3px 5px grey;
      } 
		.lookanswer{
		float: right;
		margin-bottom:50px;
		position: relative;
	    left: px;
	    top:-43px;
	    margin-right:30px;
		}
		.questionDiv{
         background-color: white;
         width: 80%;
         margin: auto;
         margin-top: 90px;
         padding: 20px;
         border-radius: 15px;
         border: 2px solid #E3E3E3;
      }
      .firstSet{
       
         width: 100%;
         text-align: left;
      }
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
	    margin-left: 1800px;
		}
		.bt_col {
	     background-color: #A4B2FF;
         color: white;
		}       
  </style>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name= "viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>???????????? ?????????</title>
<!-- ??????????????? ???????????? -->
<link rel= "stylesheet" href = "./css/bootstrap.min.css">
<!-- ????????? ???????????? -->
<link rel= "stylesheet" href = "./css/custom.css">
</head>

<body>
<%



	UserDAO userDAO = new UserDAO();
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
		System.out.println(userID);
	}else{
		userID = "Guest";
		System.out.println(userID);
	}
	Survey_answer_DAO surveyO = new Survey_answer_DAO();
	Survey_VO[] survey_data = surveyO.get_usersurvey(userID);	
	

	
	int survey_count = survey_data.length;
	int temp=2;

%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">???????????? ?????????</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button> 
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" >??????</a>
				</li>
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						????????????
					</a>
			<div class="dropdown-menu"  aria-labelledby="dropdown">
				<a class="dropdown-item" href="userLogin.jsp">?????????</a>
				<a class="dropdown-item" href="userJoin.jsp">????????????</a>
				<a class="dropdown-item" href="userLogout.jsp">????????????</a>
			</div>
		</li>
	</ul>
	
	
</div>
</nav>
<div class="lnbArea">
    <div class="lnbInside">
        
       
        
</div>
 <div id="surveylist" name="surveylist" >
	      <input type="hidden" name="total" id="total">
	         <div class="name">
	        </div>
	        <section class="container">
				<div class="d-flex justify-content-center">
					<a class="btn btn-outline-primary" data-toggle="modal" href="#registerModal">?????? ?????? ??????</a>
					<form method="post" action="./indexed.jsp">
						<button type="submit" class="btn bt_col mx-1 mt-2">????????? ??????</button>
					</form>
				</div>
			</section>
<%
 	 for(int i=0; i<survey_count; i++)
 	 {

%>			
	<div class='questionDiv'>
	<div class='firstSet'>
				<div class="row">
					<img src="./image/tugas.jpg" alt="?????????" style="width:20;" />
						<div class="titleName">
							<h3><%=survey_data[i].getSurvey_title()%></h3>
							</div>
								<div class="when">
									<%=survey_data[i].getReg_date() %>
								</div>
							</div>
						
		                
						<div class="lookanswer">
							<form method="post" action="./Survey_result.jsp?survey_num=<%=survey_data[i].getSeq()%>">
								<button type="submit"  class="btn btn-secondary float-right">?????? ??????</button>
							</form>
						</div>
						<div class="lookanswer">
							<form method="post" action="./checkmakedsurvey.jsp?survey_num=<%=survey_data[i].getSeq()%>">
								<button type="submit"  class="btn btn-secondary float-right">?????? ??????</button>
							</form>
						</div>
						<div class="lookanswer">
						<a href="#" id="sns_urlCoby" class="btn_share_sns" title="??????" onclick="clip(<%=survey_data[i].getSeq()%>); return false;">
		               		<button type="submit"  class="btn btn-secondary float-right">????????????</button>
		                </a>
		                </div>		
		             </div>   
				 </div>

 
<%
	 }
%>   	
			
			
<script src="http://code.jquery.com/jquery-latest.min.js"></script>	
		
	 
   
   

			       
	      
      </div>
      <script>
      function clip(j){

          var url = '';    // <a>???????????? ????????? ????????? clip ??????
          var textarea = document.createElement("textarea");  
          //url ?????? ?????? ???, textarea?????? ????????? textarea??? ????????? ??????
          var i=1;
          document.body.appendChild(textarea); //</body> ?????? ?????? textarea??? ??????(?????? ???????????? ????????? ?????? ??????)
          url = "localhost:8090/usersurvey.jsp?survey_num="+j;  //url?????? ?????? ???????????? ?????????
          textarea.value = url;  // textarea ?????? url??? ?????????
          textarea.select();  //textarea??? ??????
          document.execCommand("copy");   // ??????
          document.body.removeChild(textarea); //extarea ????????? ?????????
          
           // ?????????
      }
   
      
      </script>
     							
	
	<form method="post" action="./makesurvey.jsp">
	<button type="submit" class="submitBtn">?????? ?????????</button>
	</form>
	<!-- ???????????? ?????????????????? ???????????? -->
	<script src="./js/jquery.min.js"></script>
	<!-- ?????? ?????????????????? ???????????? -->
	<script src="./js/pooper.js"></script>
	<!-- ??????????????? ?????????????????? ???????????? -->
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>