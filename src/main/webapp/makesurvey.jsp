<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, java.util.ArrayList, java.net.URLEncoder" %>
<%@ page import='user.UserDAO' %>
<!DOCTYPE html>
<html>
<head>
<style>
      .titleName{
            margin-top:30px;
             margin-left: 500px;
            width:900px;
            float :center;
            border:none;
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

</style>
  <head>
   <meta charset="UTF-8">
   <title>설문조사 제작</title>
   <link href="css/common.css" rel="stylesheet">
   <script>
     
   </script>
   <style>
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
         background-color: #212529;
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
</head>
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
   UserDAO userDAO = new UserDAO();
   String userID = null;
   if(session.getAttribute("userID") != null){
      userID = (String) session.getAttribute("userID");
      
   }else{
      userID = "Guest";
   
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
<%
   if(userID == null || userID.equals("Guest")){
      
%>
                  <a class="dropdown-item" href="userLogin.jsp">로그인</a>
                  <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
<% 
   }
   else{
      
%>
                  <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
<%
   }
%>         

         </div>
      </li>
   </ul>
        
</div>

</nav>
                <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script>
   let cnt=0;//문항수 
   const qsnum=[];
      $(document).ready(function(){
         
         $('.createBtn').click(function(){
            cnt++;
            $('#surveyfm').append(
               '<div class="questionDiv">\
                  <div class="firstSet">\
                     <input type="text" class="questionContent" placeholder="질문 내용" name="survey_content'+cnt+'">\
                     <div onclick="question_del(this)" class="questionDelete">\
                        질문 삭제\
                     </div>\
                     <select onchange="selectionFunction(value,'+cnt+');" class="questionOpt" name="questionKind'+cnt+'" id="questionKind'+cnt+'">\
                        <option >질문 유형</option>\
                        <option value="Text">단답형</option>\
                        <option value="Radio">라디오</option>\
                              <option value="Selection">체크박스</option>\
                     </select>\
                  </div>\
                  \
               </div>\
               '
            );
            qsnum.push(0);
            $("#total").val(cnt);
              
           /* $('.questionDelete').on('click', function(){
               $(this).prev().remove(); // input
               $(this).next().remove(); // select
               $(this).parent().next().remove(); // img
               $(this).parent().parent().remove(); // questionDiv class
               $(this).remove(); // button
               cnt--;
               alert(cnt);
               $("#total").val(cnt);
            })*/
         })
         
         $(".questionOpt").on("change",function(){
            
         });
         
      })
      function question_del(obj){
         $(obj).prev().remove(); // input
          $(obj).next().remove(); // select
          $(obj).parent().next().remove(); // img
          $(obj).parent().parent().remove(); // questionDiv class
          $(obj).remove(); // button
   
      }
      
      
      function selectionFunction(val,n){

         if(val == 'Text'){
            // alert('bb');
            $("#questionKind"+n).parent().append(
               '<div>\
                  <input type="text" class="questionText" name="qs_'+qsnum[n-1]+'" placeholder="답변을 입력하세요">\
               </div>\
               '
            );
                  
         } else if(val == 'Radio'){
            // alert('bb');
            $("#questionKind"+n).parent().append(
               '<div class="questionRadio'+n+'">\
                  <div id="survey_option'+n+'_'+ (++qsnum[n-1]) +'"><input type="radio" class="radioCircle" name="radioGroup'+n+'" id="radio'+n+'_'+ (qsnum[n-1]) +'" >\
                  <label for="radio'+n+'_'+ (qsnum[n-1]) +'"><input class="optionBox" type="text" placeholder="선택지'+ (qsnum[n-1]) +'" name="qs_'+n+'_'+ (qsnum[n-1]) +'"></label><div onclick="option_del('+n+','+qsnum[n-1]+')" class="optionDelete">-</div></div>\
                  <div id="survey_option'+n+'_'+ (++qsnum[n-1]) +'"><input type="radio" class="radioCircle" name="radioGroup'+n+'" id="radio'+n+'_'+ (qsnum[n-1]) +'">\
                  <label for="radio'+n+'_'+ (qsnum[n-1]) +'"><input class="optionBox" type="text" placeholder="선택지'+ (qsnum[n-1]) +'" name="qs_'+n+'_'+(qsnum[n-1])+'"></label><div onclick="option_del('+n+','+qsnum[n-1]+')" class="optionDelete">-</div>\
                  </div>\
                  <div id="survey_option'+n+'_'+ (++qsnum[n-1]) +'"><input type="radio" class="radioCircle" name="radioGroup'+n+'" id="radio'+n+'_'+ (qsnum[n-1]) +'">\
                  <label for="radio'+n+'_'+ (qsnum[n-1]) +'"><input class="optionBox" type="text" placeholder="선택지'+ (qsnum[n-1]) +'" name="qs_'+n+'_'+(qsnum[n-1])+'"></label><div onclick="option_del('+n+','+qsnum[n-1]+')" class="optionDelete">-</div>\
                  </div>\
                  <div class="addOption"><div onclick="option_add('+n+')"class="optionDelete">+</div> 선택지 추가</div>\
               </div>\
               '
            );
           
                  
         } if(val == 'Selection'){
            // alert('bb');
            $("#questionKind"+n).parent().append(
                  '<div class="questioncheckbox'+n+'">\
                    <div id="survey_option'+n+'_'+ (++qsnum[n-1]) +'"><input type="checkbox" class="checkboxCircle" name="checkboxGroup'+n+'" id="checkbox'+n+'_'+ (qsnum[n-1]) +'" >\
                    <label for="checkbox'+n+'_'+ (qsnum[n-1]) +'"><input class="optionBox" type="text" placeholder="선택지'+ (qsnum[n-1]) +'" name="qs_'+n+'_'+ (qsnum[n-1]) +'"></label><div onclick="option_del('+n+','+qsnum[n-1]+')" class="optionDelete">-</div></div>\
                    <div id="survey_option'+n+'_'+ (++qsnum[n-1]) +'"><input type="checkbox" class="checkboxCircle" name="checkboxGroup'+n+'" id="checkbox'+n+'_'+ (qsnum[n-1]) +'">\
                    <label for="checkbox'+n+'_'+ (qsnum[n-1]) +'"><input class="optionBox" type="text" placeholder="선택지'+ (qsnum[n-1]) +'" name="qs_'+n+'_'+(qsnum[n-1])+'"></label><div onclick="option_del('+n+','+qsnum[n-1]+')" class="optionDelete">-</div>\
                    </div>\
                    <div id="survey_option'+n+'_'+ (++qsnum[n-1]) +'"><input type="checkbox" class="checkboxCircle" name="checkboxGroup'+n+'" id="checkbox'+n+'_'+ (qsnum[n-1]) +'">\
                    <label for="checkbox'+n+'_'+ (qsnum[n-1]) +'"><input class="optionBox" type="text" placeholder="선택지'+ (qsnum[n-1]) +'" name="qs_'+n+'_'+(qsnum[n-1])+'"></label><div onclick="option_del('+n+','+qsnum[n-1]+')" class="optionDelete">-</div>\
                    </div>\
                    <div class="addOption"><div onclick="option_addchk('+n+')"class="optionDelete">+</div>선택지 추가</div>\
                 </div>\
                 '
            );
                  
         }
      }
      function option_del(n,qs){
         
         $('#survey_option'+n+'_'+qs).remove();
      }
      function option_add(n){
         if(qsnum[n-1]==10){alert("10개를 넘기면 안됨"); return;}
         $('.questionRadio'+n+'>.addOption').before(
              ' <div id="survey_option'+n+'_'+ (++qsnum[n-1]) +'"><input type="radio" class="radioCircle" name="radioGroup'+n+'" id="radio'+n+'_'+ (qsnum[n-1]) +'"> <label for="radio'+n+'_'+ (qsnum[n-1]) +'"><input class="optionBox" type="text" placeholder="선택지'+ (qsnum[n-1]) +'" name="qs_'+n+'_'+(qsnum[n-1])+'"></label><div onclick="option_del('+n+','+qsnum[n-1]+' )" class="optionDelete">-</div></div>'
         );
      }
       function option_addchk(n){
          if(qsnum[n-1]==10){alert("10개를 넘기면 안됨"); return;}
         $('.questioncheckbox'+n+'>.addOption').before(
              ' <div id="survey_option'+n+'_'+ (++qsnum[n-1]) +'"><input type="checkbox" class="checkboxCircle" name="checkboxGroup'+n+'" id="checkbox'+n+'_'+ (qsnum[n-1]) +'"> <label for="checkbox'+n+'_'+ (qsnum[n-1]) +'"><input class="optionBox" type="text" placeholder="선택지'+ (qsnum[n-1]) +'" name="qs_'+n+'_'+(qsnum[n-1])+'"></label><div onclick="option_del('+n+','+qsnum[n-1]+' )" class="optionDelete">-</div></div>'
         );
      }
   </script>
   
   
   <div class="middle">
     
      
      <form id="surveyfm" nmae="surveyfm" method="POST" action="./createSurveyAction.jsp">
      <input type="hidden" name="total" id="total">
         <div class="formNameSection">
            <input type="text" class="formName" placeholder="설문 제목" name="survey_title"> 설문조사지 제목 입력
         </div>
         
         <!-- <div class="questionDiv">
            <div class="firstSet">
               <input type="text" class="questionContent" placeholder="질문 내용" name="questionName">
               <div class="questionDelete">
                  -
               </div>
               <select onchange="selectionFunctoin(value)" class="questionOpt" name="questionKind" id="questionKind">
                  <option value="Text">단답형</option>
                  <option value="Radio">라디오</option>
                        <option value="Selection">체크박스</option>
                        
               </select>
               
            </div>
            <img class="arrow" src="images/pencil.png" width="27px">
         </div> -->
         
         <div class="footer">
            <button type="submit" class="submitBtn">결과 
            
            
            페이지 생성</button>
         </div>
          
      </form>
      <button class="createBtn" onclick="createQuestion()">
         + 질문 추가
      </button>
      
      
   </div>     
               
                  
   <!-- 제이쿼리 자바스크립트 추가하기 -->
   <script src="./js/jquery.min.js"></script>
   <!-- 파퍼 자바스크립트 추가하기 -->
   <script src="./js/pooper.js"></script>
   <!-- 부트스츠랩 자바스크립트 추가하기 -->
   <script src="./js/bootstrap.min.js"></script>
   
</body>
</html>