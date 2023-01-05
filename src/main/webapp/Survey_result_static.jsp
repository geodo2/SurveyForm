<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, java.util.ArrayList, java.net.URLEncoder" %>

<%@ page import="user.*, survey.*" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
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
      .surveyKind{
         text-align: left;
         font-size: 35px;
         margin-left: 250px;
         margin-top: 50px
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
      .submitBtn{
         width:200px;
        
         right:47px;
         position: fixed;
         bottom: 60px;
         color: white;
         
         
         margin-right: 25px;
         margin-top: 120px;
         background-color: #A4B2FF;
         color: white;
         border: none;

         font-weight: bold;
         font-size: 25px;
         
         padding: 17px 30px 15px 30px;
         box-shadow: 3px 3px 5px grey;
      } 
      .createBtn{
          bottom: 60px;
          left:100px;
         width: 200px;
         position: fixed;
         right:30px;
         background-color: #212529;
         color: white;
         border: none;
         font-weight: bold;
         font-size: 25px;     
         padding: 17px 30px 15px 30px;
         box-shadow: 3px 3px 5px grey;
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
   Survey_answer_VO[] answer_list = surveyO.survey_static(sid_number);   
   int answer_count = answer_list.length; 
   Survey_question_VO[] question_list = surveyO.question_data(sid_number);
   int question_length=question_list.length;
   int radio_count=0;
   
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
for(int i=0; i<question_length;i++){ 
   if(question_list[i].getSurvey_type().equals("Text")){
      
   int k=i+1;
%>

<div class='questionDiv'>
   <div class='firstSet'>
    <div></div>
   <div>
    <h2>질문<%=k%>.<%=question_list[i].getSurvey_content()%></h2>
   <p>질문 타입 : 단답형</p>
    </div>
   단답형은 개별 답변에서 확인해주세요!  
   <div>
   
    </div>
   </div>
  </div> 
   
<%}
   if(question_list[i].getSurvey_type().equals("Radio")){
      radio_count=radio_count+1;
      int k=i+1;
      ArrayList<String> qs_radio = new ArrayList<>();
      ArrayList<Integer> radio_checked_count = new ArrayList<>();
      int[] count={0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
      int option_count=0;
      if(question_list[i].getQs_1()!=null){qs_radio.add('"' + question_list[i].getQs_1() + '"'); option_count=option_count+1;}
      if(question_list[i].getQs_2()!=null){qs_radio.add('"' + question_list[i].getQs_2() + '"'); option_count=option_count+1;}
      if(question_list[i].getQs_3()!=null){qs_radio.add('"' + question_list[i].getQs_3() + '"'); option_count=option_count+1;}
      if(question_list[i].getQs_4()!=null){qs_radio.add('"' + question_list[i].getQs_4() + '"'); option_count=option_count+1;}
      if(question_list[i].getQs_5()!=null){qs_radio.add('"' + question_list[i].getQs_5() + '"'); option_count=option_count+1;}
      if(question_list[i].getQs_6()!=null){qs_radio.add('"' + question_list[i].getQs_6() + '"'); option_count=option_count+1;}
      if(question_list[i].getQs_7()!=null){qs_radio.add('"' + question_list[i].getQs_7() + '"'); option_count=option_count+1;}
      if(question_list[i].getQs_8()!=null){qs_radio.add('"' + question_list[i].getQs_8() + '"'); option_count=option_count+1;}
      if(question_list[i].getQs_9()!=null){qs_radio.add('"' + question_list[i].getQs_9() + '"'); option_count=option_count+1;}
      if(question_list[i].getQs_10()!=null){qs_radio.add('"' + question_list[i].getQs_10() + '"'); option_count=option_count+1;}
     
      for(int temper=0; temper<answer_count; temper++ ){
    	  if( answer_list[temper].getQs_1() != null&&answer_list[temper].getQs_1().equals("radio") ){
    		 
    		  int radio_answer_num=Integer.parseInt(answer_list[temper].getAnswer_content());
    		  for (int tem=0; tem<option_count; tem++){
    	      int a_temp= tem+1;
    		  if(radio_answer_num==a_temp){count[tem]++;}
    		  }
    	  }
    	}
      for(int b_temp=0; b_temp<option_count; b_temp++){ radio_checked_count.add(count[b_temp]); }

%>
	
<div class='questionDiv'>
   <div class='firstSet'>
    <div></div>
   <div>
   <h2>질문<%=k%>.<%=question_list[i].getSurvey_content()%></h2>
   <p>질문 타입 : 라디오</p>
    <center><canvas id="myChart<%=i%>" width="500vw" height="500vh"></canvas></center>    
    </div>

   </div>
  </div>    	
   	
   	<script>
	let myChart<%=i%> = document.getElementById('myChart'+<%=i%>).getContext('2d');
	var data_count=<%=radio_checked_count%>
	var colorList = ['#FF7B54', '#FFB26B', '#FFD56F', '#939B62', '#CFFDE1', '#68B984', '#3D5656', '#FFDDA6', '#61AE76', '#969191'];
	var option_count = <%=qs_radio%>
	let barchart<%=i%> =new Chart(myChart<%=i%>,{
	   type: 'doughnut',
	   
	   data : {
	      labels : option_count,
	      datasets:[{ 
	    	  
    	  backgroundColor: colorList,
          borderWidth: 0.5 ,
          borderColor: '#ddd',
	      label:'바울랩 매출액',
	      data:data_count
	         
	      }]
	   },
		  options: {
			  	responsive: false,
		        title: {
		            display: true,
		            text: '사용자 응답',
		            position: 'top',
		            fontFamily: "DoHyeon",
		            fontSize: 25,
		            fontColor: '#111',
		            padding: 20
		        },
		        legend: {
		            display: true,
		            position: 'bottom',
		            labels: {
		            	fontSize: 20,
		            
		            	fontWeight: 800,
		                boxWidth: 20,
		                fontColor: '#111',
		                padding: 15
		            }
		        },
		    },
		    centerText: {
		        display: false,
		        text: ""
		    }
	})

</script>
<%
   }
 if(question_list[i].getSurvey_type().equals("Selection")){
	int k= i+1;
	ArrayList<String> qs_checkbox = new ArrayList<>();
	 ArrayList<Integer> checkbox_checked_count = new ArrayList<>();
     int[] count={0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
     int option_count=0;
     if(question_list[i].getQs_1()!=null){qs_checkbox.add('"' + question_list[i].getQs_1() + '"'); option_count=option_count+1;}
     if(question_list[i].getQs_2()!=null){qs_checkbox.add('"' + question_list[i].getQs_2() + '"'); option_count=option_count+1;}
     if(question_list[i].getQs_3()!=null){qs_checkbox.add('"' + question_list[i].getQs_3() + '"'); option_count=option_count+1;}
     if(question_list[i].getQs_4()!=null){qs_checkbox.add('"' + question_list[i].getQs_4() + '"'); option_count=option_count+1;}
     if(question_list[i].getQs_5()!=null){qs_checkbox.add('"' + question_list[i].getQs_5() + '"'); option_count=option_count+1;}
     if(question_list[i].getQs_6()!=null){qs_checkbox.add('"' + question_list[i].getQs_6() + '"'); option_count=option_count+1;}
     if(question_list[i].getQs_7()!=null){qs_checkbox.add('"' + question_list[i].getQs_7() + '"'); option_count=option_count+1;}
     if(question_list[i].getQs_8()!=null){qs_checkbox.add('"' + question_list[i].getQs_8() + '"'); option_count=option_count+1;}
     if(question_list[i].getQs_9()!=null){qs_checkbox.add('"' + question_list[i].getQs_9() + '"'); option_count=option_count+1;}
     if(question_list[i].getQs_10()!=null){qs_checkbox.add('"' + question_list[i].getQs_10() + '"'); option_count=option_count+1;}
	System.out.println(qs_checkbox);
	 for(int temper=0; temper<answer_count; temper++ ){
   	  if( answer_list[temper].getAnswer_content().equals("checkbox") && answer_list[temper].getQs_1()!="radio" ){
          
   		if(answer_list[temper].getQs_1().equals("1")){count[0]=count[0]+1;}
   		if(answer_list[temper].getQs_2().equals("2")){count[1]=count[1]+1;}
   		if(answer_list[temper].getQs_3().equals("3")){count[2]=count[2]+1;}
   		if(answer_list[temper].getQs_3().equals("4")){count[3]=count[3]+1;}
   		if(answer_list[temper].getQs_3().equals("5")){count[4]=count[4]+1;}
   		if(answer_list[temper].getQs_3().equals("6")){count[5]=count[5]+1;}
   		if(answer_list[temper].getQs_3().equals("7")){count[6]=count[6]+1;}
   		if(answer_list[temper].getQs_3().equals("8")){count[7]=count[7]+1;}
   		if(answer_list[temper].getQs_3().equals("9")){count[8]=count[8]+1;}
   		if(answer_list[temper].getQs_3().equals("10")){count[9]=count[9]+1;}
   	
   		  
   	  }
   	}
	 
     for(int b_temp=0; b_temp<option_count; b_temp++){ checkbox_checked_count.add(count[b_temp]);System.out.println(count[b_temp]);  }
     System.out.println(checkbox_checked_count);
%>
<div class='questionDiv'>
   <div class='firstSet'>
    <div></div>
   <div>
   <h2>질문<%=k%>.<%=question_list[i].getSurvey_content()%></h2>
    <p>질문 타입 : 체크박스</p>
   <center><canvas id="myChart<%=i%>" width="500vw" height="500vh"></canvas></center>
    
    </div>

   </div>
  </div>    	
   	<script>
	let myChart<%=i%> = document.getElementById('myChart'+<%=i%>).getContext('2d');
	var data_count=<%=checkbox_checked_count%>
	var colorList = ['#FF7B54', '#FFB26B', '#FFD56F', '#939B62', '#CFFDE1', '#68B984', '#3D5656', '#FFDDA6', '#61AE76', '#969191'];
	var option_count = <%=qs_checkbox%>
	let barchart<%=i%> =new Chart(myChart<%=i%>,{
	   type: 'pie',
	   
	   data : {
	      labels : option_count,
	      datasets:[{ 
	    	  
    	  backgroundColor: colorList,
          borderWidth: 0.5 ,
          borderColor: '#ddd',
	      label:'바울랩 매출액',
	      data:data_count
	         
	      }]
	   },
		  options: {
			  responsive: false,
		        title: {
		            display: true,
		            text: '사용자 응답',
		            position: 'top',
		         
		            fontSize: 25,
		            fontColor: '#111',
		            padding: 20
		        },
		        legend: {
		            display: true,
		            position: 'bottom',
		            labels: {
		            	fontSize: 20,
		            	fontFamily: "DoHyeon",
		            	fontWeight: 800,
		                boxWidth: 20,
		                fontColor: '#111',
		                padding: 15
		            }
		        },
		    },
		    centerText: {
		        display: false,
		        text: ""
		    }
	})

</script>

<% 	  
	}
}
%>



<form method="post" action="./Survey_result.jsp?survey_num=<%=sid_num%>">
<button class="createBtn" > 뒤로가기</button>
</form>
</body>


</html>