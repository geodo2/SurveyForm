![header](https://capsule-render.vercel.app/api?type=Waving&color=auto&height=300&section=header&text=Programming&fontSize=90)

JSP를 활용한 설문조사 폼 제작 프로젝트의 목적 중 하나는    
프로그래밍적 요소를 사용자에게 제공하는 것입니다. 
<br>
JSP의 특징과 장점을 이용해서 설문조사 프로젝트에 프로그래밍 적 요소를 담는 과정을 살펴보겠습니다.<br>
<br>

## :one:기획
응답 화면에 따른 결과 화면을 설문제작자가 구상할 수 있도록 구성 해보려고 기획을 시작했습니다. 
초기 기획디자인 Figma :  
https://www.figma.com/file/9MwQ0w4LL7Csdo6zWw0YZQ/%EC%84%A4%EB%AC%B8%EC%A1%B0%EC%82%AC-%EC%84%9C%EB%B9%84%EC%8A%A4?node-id=0%3A1&t=pEPp625irqBjcc3K-0




## 2️⃣:코드
### html
```
<div class="name"><%=content%></div>   
```
### Java
```
   Survey_result_var_VO[] result_var=surveyO.get_result_var(survey_sid);
   Survey_answer_VO[] answer_value=surveyO.survey_answer(survey_sid, get_user_id);
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
```
✔️:Point
* Jsp 특징 중 하나인 자바 value를 그대로 Html에 삽입할 수 있다는 특징을 이용해서 기본적인 h1,p,br,form같은 설문작성자가 작성한    
  태그를 이용할 수 있도록 하였습니다.
* Java 측에서 질문에 따른 변수들을 DAO를 통해 받아와 content의 특정 value(ex.질문1,질문2)들을 각 조건에 맞게   replace 메서드를 통해 변수를 변경했습니다.

## :three:구현 결과
<div>
<img src="https://user-images.githubusercontent.com/94734394/209276905-6c811e93-add3-4cc1-bd22-cbdbbb8b8a18.png"  width="400" height="200"/>
<img src="https://user-images.githubusercontent.com/94734394/210292006-bc2e88fc-e196-4277-bb10-5a0a35942f73.png"  width="400" height="200"/>
</div><br>
✔️Check Point   <br>
* 단답형 변수 설정: 응답자의 답변 혹은 제작자가 직접 변수 설정   <br>
* 라디오형식 변수 설정: 응답자가 고르는 옵션에 따라 답변이 다르게 나오도록 설정   <br>
* 체크박스형식 변수 설정: 응답자가 고르는 옵션 갯수에 따라 답변이 다르게 나오도록 설정  <br>
  <br>
  <div>
  <img src="https://user-images.githubusercontent.com/94734394/210736198-0d101505-44a1-45f9-afb7-d8108ea11fe7.png"  width="300" height="200"/>
  <img src="https://user-images.githubusercontent.com/94734394/210736253-44e648e8-5839-4d65-9472-464166988b55.png"  width="300" height="200"/>
  <img src="https://user-images.githubusercontent.com/94734394/210736271-e4db6b89-21f7-4169-8051-5e3fbe3ae0cd.png"  width="300" height="200"/>
  </div>
  
  <br>
  ✔️Check Point   <br>
  * 개인의 응답에 따라 다른 설문 완료 결과화면 완성
  <img src="https://user-images.githubusercontent.com/94734394/210737536-23434128-9cb0-498c-82c2-0f4c7ad6db70.png"  width="400" height="200"/>

