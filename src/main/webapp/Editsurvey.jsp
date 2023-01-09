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
      .titleName{
            margin-top:30px;
             margin-left: 700px;
            width:900px;
            float :center;
            border:none;
            font-size:70px;
            font-weight:bold;
            text-align:center;
      }
      .description{
            display: block;
             width: 100%;
             padding: .375rem .75rem;
             font-size: 1rem;
             line-height: 1.5;
             color: #e9ecef;
             background-color: #dee2e6;
             background-clip: padding-box;
             border: 1px solid #ced4da;
             border-radius: .25rem;
             transition: 
      
      }
      .btn-colr{
              margin-top: 60px;
            background-color: #1ABC9C;
      }
      .delbtn{
            margin-top: 60px;
      }
      .subbtn{
            background-color: #212529;
            float:right;
            margin-top: 60px;
      }
      .tester{
            height:10px;
            float:right;
      }
    .profileImg{
         width: 100px;
         float: right;
         margin-left: -30px;
      }
      .createBtn{
          bottom: 60px;
          left:100px;
         width: 200px;
         position: fixed;
         right:30px;
         background-color: #A4B2FF;
         color: white;
         border: none;
       
         font-weight: bold;
         font-size: 25px;
         
         padding: 17px 30px 15px 30px;
         box-shadow: 3px 3px 5px grey;
      }
      .formNameSection{
         width:800px;
         margin:0 auto;
         font-size:30px;
      }
      .formName{
         font-size: 30px;
         padding-left: 10px;
         background-color: #EEEEEE;
         width: 480px;
         height: 55px;
         border: none;
      }
      ::placeholder {
          color: #A0A0A0;
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
      .questionDelete{
         display: inline;
         background-color: #6c757d;
         padding: 15px 18px 15px 18px;
         color: white;
         margin-left: 10px;
         font-weight: bold;
      }
      .questionContent{
  
         background-color: #E3E5F3;
         width: 400px;
         font-size: 24px;
         border: none;
         border-radius: 10px;
         padding: 10px;

      }
      .questionOpt{
         float: right;
         background-color: #dee2e6;
         height: 50px;
         width: 150px;
         
         padding: 10px;
         text-align: center;
      
         font-size: 20px;
         appearance: none;
      }
      .arrow{
         float: right;
         margin-top: -38px;
      }
      .questionText{
         font-size: 24px;
         width: 98%;
         height: 40px;
        
         margin-top: 20px;
         border: none;
         border-bottom: 2px solid lightgrey;
      }
      
      .questionRadio{
         margin-top: 20px;
         text-align: left;
      }
      .optionBox{
         border: none;
         font-size: 23px;
         width: 300px;
      }
      .radioCircle{
         width: 17px;
         height: 17px;
      }
      .optionDelete{
         display: inline;
         background-color: #6c757d;
         padding: 3px 8px 3px 8px;         
         color: white;
         margin-left: 2px;
         font-weight: bold;
      }
      .addOption{
         color: #6c757d;
         font-size: 20px;
         margin-left: -2px;
      }
      
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
      .footer{
         width: 100%;
         position: fixed;
         bottom: 30px;
      }
</style>
   <meta http-equiv="Content-Tyep" content="text/html" charset="UTF-8">
   <!-- meta data add  -->
   <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> 
   
   <title>Survey Service</title>
   <!-- Bootstrap insert -->
   <link rel="stylesheet" href="../css/bootstrap.min.css">
   <!-- custom CSS insert -->
   <link rel="stylesheet" href="../css/custom.css?ver=1">
   <style type="text/css">
      a, a:hover{
         color: #000000;
         text-decoration: none;
      }
   </style>
</head>
<body>
<% 
   request.setCharacterEncoding("UTF-8");
   Survey_answer_DAO surveyO = new Survey_answer_DAO();
   int survey_sid = Integer.parseInt(request.getParameter("survey_num"));
   String sid_num =request.getParameter("survey_num");
   Survey_VO[] survey_list = surveyO.question_list_data(survey_sid);
   Survey_question_VO[] question_list = surveyO.question_data(survey_sid);
   int cnt = 0;
   int question_num = question_list.length;
   List<Integer> a_question = new ArrayList<>();
      
%>
       
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.jsp">설문조사 서비스</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
         <span class="navbar-toggler-icon"></span>
      </button> 
      <div id="navbar" class="collapse navbar-collapse">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
               <a class="nav-link" href="index.jsp">메인</a>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<div class="middle">
     
      
      <form id="surveyfm" nmae="surveyfm" method="POST" action="./userSubmitAction.jsp">

         <div class="name">
          <div class ="titleName">
          <input type="text" class="formName" value="<%=survey_list[0].getSurvey_title()%>" name="survey_title">
         </div>
         </div>
         <div>
         </div>
          <%
     for(int i=0; i<question_num;i++){
    

      if(question_list[i].getSurvey_type().equals("Text")){
    	  a_question.add(1);
    cnt +=1;      
       int k= i+1;
       %>

<div class='questionDiv'>
   <div class='firstSet'>
    <div></div>
   <div>
    <h2>질문<%=k%><input type="text" class="questionContent" value="<%=question_list[i].getSurvey_content()%>" name="survey_content'+cnt+'"></h2>
    <%=question_list[i].getSurvey_content()%>
    </div>
    <input type='text' class='questionText' name='survey_text<%=cnt%>' placeholder='답변을 입력하세요'>
  
   <div>
   
    </div>
   </div>
   </div> 
   </div>
   
<%
      }
      else if(question_list[i].getSurvey_type().equals("Radio")){
    	  a_question.add(2);  
   cnt +=1;
   int k= i+1;
%>
    <input type= "hidden" name="cnt<%=cnt%>" value="<%=cnt%>">
     <div class='questionDiv'>
     <div class='firstSet'>
    <div></div>
     <div>
      <h2>질문<%=k%><input type="text" class="questionContent" value="<%=question_list[i].getSurvey_content()%>" name="survey_content'+cnt+'"></h2>
        <h2>질문<%=k%>.<%=question_list[i].getSurvey_content()%></h2>
  
     </div>
     <div class='questionRadio1'>               
    <div id='survey_option1_1'>
   <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_1' value ='1'>
    <label for='radio1_2'>
    <%=question_list[i].getQs_1()%>
    </label>

    </div>                
    <div id='survey_option1_2'>
    <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_2' value ='2'>                
   <label for='radio1_2'>
    <%=question_list[i].getQs_2()%>
      </label>
   </div>    

<%
     if(question_list[i].getQs_3()!=null){
   
%>    
    </div>                 
    <div id='survey_option1_2'>
    <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_2' value ='3'>                
    <label for='radio1_2'>
    <%=question_list[i].getQs_3()%>
    </label> 
  
<%    
      } 
%>
<%
   if(question_list[i].getQs_4()!=null){
%>    
   
   </div>                 
   <div id='survey_option1_2'>
   <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_2' value ='4'>                
   <label for='radio1_2'>
       <%=question_list[i].getQs_4()%>
   </label> 
   </div>   
<%    
    } 
%>   
<%
   if(question_list[i].getQs_5()!=null){
%>    
   </div>                 
   <div id='survey_option1_2'>
   <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_2' value ='5'>                
   <label for='radio1_2'>
   <%=question_list[i].getQs_5()%>
   </label> 
	</div>
<%    
    } 
%>   
<%
   if(question_list[i].getQs_6()!=null){
%>    
               
   <div id='survey_option1_2'>
   <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_2' value ='6'>                
   <label for='radio1_2'>
   <%=question_list[i].getQs_6()%>
   </label>
   </div>  
<%    
    } 
%>   
<%
   if(question_list[i].getQs_7()!=null){
%>    
                
   <div id='survey_option1_2'>
   <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_2' value ='7'>                
   <label for='radio1_2'>
   <%=question_list[i].getQs_7()%>
   </label> 

<%    
    } 
%>   
<%
if(question_list[i].getQs_8()!=null){
%>    
                 
   <div id='survey_option1_2'>
   <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_2' value ='8'>                
   <label for='radio1_2'>
   <%=question_list[i].getQs_8()%>
   </label> 
   </div>   
<%    
    } 
%>
<%
   if(question_list[i].getQs_9()!=null){
%>    
            
   <div id='survey_option1_2'>
   <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_2'value ='9'>                
   <label for='radio1_2'>
   <%=question_list[i].getQs_9()%>
   </label> 
   </div>   
<%    
    } 
%>   
<%
if(question_list[i].getQs_10()!=null){
%>    
   </div>                 
   <div id='survey_option1_2'>
   <input type='radio' class='radioCircle' name='radioGroup<%=cnt%>' id='radio1_2'value ='10'>                
   <label for='radio1_2'>
   <%=question_list[i].getQs_10()%>
   </label> 
   </div>   
<%    
    } 
%>   
   </div>
   </div>
  	</div>
   
<%   
      }
      else if(question_list[i].getSurvey_type().equals("Selection")){
      cnt +=1; 
      int k= i+1;
      a_question.add(3);
%>
      
         
       
    <div class='questionDiv'>
     <div class='firstSet'>
     <div></div>
    <div>
     <h2>질문<%=k%><input type="text" class="questionContent" value="<%=question_list[i].getSurvey_content()%>" name="survey_content'+cnt+'"></h2>
         <h2>질문<%=k%>.<%=question_list[i].getSurvey_content()%></h2>
     </div>
  
     <div class='questioncheckbox'>
       <div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value='1' > 
   <label for='checkbox'><%=question_list[i].getQs_1()%></label>
   <div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value= '2'>
   <label for='checkbox'><%=question_list[i].getQs_2()%></label>
<%if(question_list[i].getQs_3()!=null){ %>
   <div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value= '3'>
   <label for='checkbox'><%=question_list[i].getQs_3()%></label>
   </div>
<%
}
if(question_list[i].getQs_4()!=null){	
%> 
   <div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value= '4'>
   <label for='checkbox'><%=question_list[i].getQs_4()%></label>
   </div>
<%
}
if(question_list[i].getQs_5()!=null){
%>   
   <div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value= '5'>
   <label for='checkbox'><%=question_list[i].getQs_5()%></label>
   </div>
<%
}
if(question_list[i].getQs_6()!=null){	
%> 
   <div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value= '6'>
   <label for='checkbox'><%=question_list[i].getQs_6()%></label>
   </div>
<%
}
if(question_list[i].getQs_7()!=null){
%>
<div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value= '7'>
   <label for='checkbox'><%=question_list[i].getQs_7()%></label>
   </div>
<%
}
if(question_list[i].getQs_8()!=null){
%>
<div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value= '8'>
   <label for='checkbox'><%=question_list[i].getQs_8()%></label>
   </div>
<%
}
if(question_list[i].getQs_9()!=null){
%>
<div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value= '9'>
   <label for='checkbox'><%=question_list[i].getQs_9()%></label>
   </div>
<%
}
if(question_list[i].getQs_10()!=null){
%>
<div id='survey_option'><input type='checkbox' class='checkboxCircle' name='checkboxGroup<%=cnt%>' id='checkbox' value= '10'>
   <label for='checkbox'><%=question_list[i].getQs_10()%></label>
   </div>   
<%
}
%>   
    </div>
    
   </div>                  
   </div>               
     </div>
     </div>
    
  
     
   
         
         <%
    }
      }
      %> 
      	 <input type="hidden" name="sid" value= "<%=sid_num%>">
      	 <input type="hidden" name="type_array" id="total" value= "<%=a_question%>">	
  		 <input type="hidden" name="total" id="total" value= "<%=cnt%>">
         <div class="footer">
               
            <button type="submit" class="submitBtn">수정 완료</button>
         </div>
           </form>
 
  
        
     
     
    

   
   
</body>
</html>
