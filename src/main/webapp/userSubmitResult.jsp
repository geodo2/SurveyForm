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
          color: #black;
      }
      
      .questionDiv{
         background-color: white;
         width: 80%;
         margin: auto;
         margin-top: 10px;
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
         background-color: #ff4658;
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
      .text_area{
         width: 93%;
         background-color: #F4F5FF;
         margin-top: 20px;
         border: none;
         resize: none;
         height: 250px;
         border-radius: 15px;
         padding: 20px;
         font-size: 23px;
         margin-left: 120px;
         
      }
      .surveyKind{
			text-align: left;
			font-size: 35px;
			margin-left: 250px;
			margin-top: 50px
		}
		.card{
		
		}
      .wrapper,
.wrapper .img-area,
.social-icons a,
.buttons button{
  background: #ecf0f3;
  box-shadow: -3px -3px 7px #ffffff,
               3px 3px 5px #ceced1;
}
.wrapper {
    position: relative;
    width: 1400px;
    padding: 30px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    margin-left: 200px;
    margin-top:200px;
}
.wrapper .icon{
  font-size: 17px;
  color: #31344b;
  position: absolute;
  cursor: pointer;
  opacity: 0.7;
  top: 15px;
  height: 35px;
  width: 35px;
  text-align: center;
  line-height: 35px;
  border-radius: 50%;
  font-size: 16px;
}
.wrapper .icon i{
  position: relative;
  z-index: 9;
}
.wrapper .icon.arrow{
  left: 15px;
}
.wrapper .icon.dots{
  right: 15px;
}
.wrapper .img-area{
  height: 150px;
  width: 150px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.img-area .inner-area{
  height: calc(100% - 25px);
  width: calc(100% - 25px);
  border-radius: 50%;
}
.inner-area img{
  height: 100%;
  width: 100%;
  border-radius: 50%;
  object-fit: cover;
}
.wrapper .name{
  font-size: 23px;
  font-weight: 500;
  color: #31344b;
  margin: 10px 0 5px 0;
}
.wrapper .about{
  color: #44476a;
  font-weight: 400;
  font-size: 16px;
}
.wrapper .social-icons{
  margin: 15px 0 25px 0;
}
.social-icons a{
  position: relative;
  height: 40px;
  width: 40px;
  margin: 0 5px;
  display: inline-flex;
  text-decoration: none;
  border-radius: 50%;
}
.social-icons a:hover::before,
.wrapper .icon:hover::before,
.buttons button:hover:before{
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  border-radius: 50%;
  background: #ecf0f3;
  box-shadow: inset -3px -3px 7px #ffffff,
              inset 3px 3px 5px #ceced1;
}
.buttons button:hover:before{
  z-index: -1;
  border-radius: 5px;
}
.social-icons a i{
  position: relative;
  z-index: 3;
  text-align: center;
  width: 100%;
  height: 100%;
  line-height: 40px;
}
.social-icons a.fb i{
  color: #4267B2;
}
.social-icons a.twitter i{
  color: #1DA1F2;
}
.social-icons a.insta i{
  color: #E1306C;
}
.social-icons a.yt i{
  color: #ff0000;
}
.wrapper .buttons{
  display: flex;
  width: 100%;
  justify-content: space-between;
}
.buttons button{
  position: relative;
  width: 100%;
  border: none;
  outline: none;
  padding: 12px 0;
  color: #31344b;
  font-size: 17px;
  font-weight: 400;
  border-radius: 5px;
  cursor: pointer;
  z-index: 4;
}
.buttons button:first-child{
  margin-right: 10px;
}
.buttons button:last-child{
  margin-left: 10px;
}
.wrapper .social-share{
  display: flex;
  width: 100%;
  margin-top: 30px;
  padding: 0 5px;
  justify-content: space-between;
}
.social-share .row{
  color: #31344b;
  font-size: 17px;
  cursor: pointer;
  position: relative;
}
.social-share .row::before{
  position: absolute;
  content: "";
  height: 100%;
  width: 2px;
  background: #e0e6eb;
  margin-left: -25px;
}
.row:first-child::before{
  background: none;
}
.social-share .row i.icon-2{
  position: absolute;
  left: 0;
  top: 50%;
  color: #31344b;
  transform: translateY(-50%);
  opacity: 0;
  pointer-events: none;
  transition: all 0.3s ease;
}
.row:nth-child(1):hover i.fa-heart,
.row:nth-child(2):hover i.fa-comment{
  opacity: 1;
  pointer-events: auto;
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
   //result content
   Survey_result_content_VO[] survey_content=surveyO.get_result_content(survey_sid);
   //get userid
   String get_user_id =request.getParameter("userid");
   String content=survey_content[0].get_content();
   String io="1";
  
   System.out.println(content);
   //survey
   Survey_result_var_VO[] result_var=surveyO.get_result_var(survey_sid);
   Survey_answer_VO[] answer_value=surveyO.survey_answer(survey_sid, get_user_id);
   //질문 갯수
   int q_count=result_var.length;
  
   
   for(int i=0; i<q_count; i++){
	   if(result_var[i].get_type().equals("text")){
		   String temp=answer_value[i].getAnswer_content();		  
		   int j=i+1;
		   content=content.replace("질문"+j,temp);
	   }
	   if(result_var[i].get_type().equals("radio")){
   	   	  int j=i+1;
   	   	  int radio_answer=Integer.parseInt(answer_value[i].getAnswer_content());
   	   		 System.out.println(radio_answer);
   	   	  if(radio_answer==1){content=content.replace("질문"+j,result_var[i].getQs_1());}
   	   	  else if(radio_answer==2){content=content.replace("질문"+j,result_var[i].getQs_2());}
   	   	  else if(radio_answer==3){content=content.replace("질문"+j,result_var[i].getQs_3());}	  
	   	  else if(radio_answer==4){content=content.replace("질문"+j,result_var[i].getQs_4());}
	   	  else if(radio_answer==5){content=content.replace("질문"+j,result_var[i].getQs_5());}
	   	  else if(radio_answer==6){content=content.replace("질문"+j,result_var[i].getQs_6());}
	   	  else if(radio_answer==7){content=content.replace("질문"+j,result_var[i].getQs_7());}
	   	  else if(radio_answer==8){content=content.replace("질문"+j,result_var[i].getQs_8());}
	   	  else if(radio_answer==9){content=content.replace("질문"+j,result_var[i].getQs_9());}
	      else if(radio_answer==10){content=content.replace("질문"+j,result_var[i].getQs_10());}
	   }
	   if(result_var[i].get_type().equals("selection")){
		   int check_count=0;
		   int j=i+1;
		   if(answer_value[i].getQs_1().equals("1")){check_count=check_count+1;}
		   if(answer_value[i].getQs_2().equals("2")){check_count=check_count+1;}
		   if(answer_value[i].getQs_3().equals("3")){check_count=check_count+1;}
		   if(answer_value[i].getQs_4().equals("4")){check_count=check_count+1;}
		   if(answer_value[i].getQs_5().equals("6")){check_count=check_count+1;}
		   if(answer_value[i].getQs_5().equals("7")){check_count=check_count+1;}
		   if(answer_value[i].getQs_5().equals("8")){check_count=check_count+1;}
		   if(answer_value[i].getQs_5().equals("9")){check_count=check_count+1;}
		   if(answer_value[i].getQs_5().equals("10")){check_count=check_count+1;}
		   
		   System.out.println(check_count+"몇개");
		   if(check_count==1){content=content.replace("질문"+j,result_var[i].getQs_1());}
		   else if(check_count==2){content=content.replace("질문"+j,result_var[i].getQs_2());}
		   else if(check_count==3){content=content.replace("질문"+j,result_var[i].getQs_3());}
		   else if(check_count==4){content=content.replace("질문"+j,result_var[i].getQs_4());}
		   else if(check_count==5){content=content.replace("질문"+j,result_var[i].getQs_5());}
		   else if(check_count==6){content=content.replace("질문"+j,result_var[i].getQs_6());}
		   else if(check_count==7){content=content.replace("질문"+j,result_var[i].getQs_7());}
		   else if(check_count==8){content=content.replace("질문"+j,result_var[i].getQs_8());}
		   else if(check_count==9){content=content.replace("질문"+j,result_var[i].getQs_9());}
		   else if(check_count==10){content=content.replace("질문"+j,result_var[i].getQs_10());}
		   
	   }
   }
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


<body>
  <div class="wrapper">
   
    <div class="icon arrow"><i class="fas fa-arrow-left"></i></div>
    <div class="icon dots"><i class="fas fa-ellipsis-v"></i></div>
    <div class="name"><%=content%></div>
   
   
    
  </div>
</body>

 <form id="surveyfm" name="surveyfm" method="POST" action="./index.jsp">
<button type="submit" class="submitBtn">메인 화면</button>
</form>

</html>