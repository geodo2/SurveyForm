<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter, java.util.*"%>
<%@ page import="survey.*, util.*"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
PrintWriter script = response.getWriter();
String[]test_value = request.getParameterValues("type_array");
//text _area
String text_content = request.getParameter("text_content");

//질문갯수
String question_count = request.getParameter("total");
int question_int =0;
question_int= Integer.parseInt(question_count);

//설문지 번호
int survey_sid=0;
String sid = request.getParameter("sid");
survey_sid= Integer.parseInt(sid);

String[] question_type=request.getParameterValues("type_array");
Survey_answer_DAO surveyO = new Survey_answer_DAO();


String userID = null;
String caseid = "caseid";
if(session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
for( String val:question_type){
	
	   int j=1;
	   for(int i=1; i<=question_int; i++){
	    String qs_1="";
		String qs_2="";
		String qs_3="";
		String qs_4="";
		String qs_5="";
		String qs_6="";
		String qs_7="";
		String qs_8="";
		String qs_9="";
		String qs_10="";
	   if (val.charAt(j) == '1'){
		   String text_answer = request.getParameter("survey_text"+i);
		   surveyO.insert_result_var(survey_sid, i, "text", text_answer, null, null, null, null, null, null, null, null, null);
	   }
	   else if (val.charAt(j) == '2'){
		   for(int k=1; k<=10;k++){
		if(k==1){	   
		   qs_1 = request.getParameter("abc"+i+"_"+k);
			}
		else if(k==2){	   
		   qs_2 = request.getParameter("abc"+i+"_"+k);
			}
		else if(k==3){	   
			   qs_3 = request.getParameter("abc"+i+"_"+k);
			}
		else if(k==4){	   
			   qs_4 = request.getParameter("abc"+i+"_"+k);
			} 
		else if(k==5){	   
			   qs_5 = request.getParameter("abc"+i+"_"+k);
			} 
		else if(k==6){	   
			   qs_6 = request.getParameter("abc"+i+"_"+k);
			} 
		else if(k==7){	   
			   qs_7 = request.getParameter("abc"+i+"_"+k);
			} 
		else if(k==8){	   
			   qs_8 = request.getParameter("abc"+i+"_"+k);
			} 
		else if(k==9){	   
			   qs_9 = request.getParameter("abc"+i+"_"+k);
			} 
		else if(k==10){	   
			   qs_10 = request.getParameter("abc"+i+"_"+k);
			} 
		   
		   }
		   System.out.println(i+"값 확인");
		   
		   System.out.println(val+"셀렉션항목");
		   surveyO.insert_result_var(survey_sid, i, "radio", qs_1, qs_2, qs_3, qs_4, qs_5, qs_6, qs_7, qs_8, qs_9, qs_10);
	   
	   }
	   else if (val.charAt(j) == '3'){
	
		   for(int k=1; k<=10;k++){
			
				if(k==1){	   
				   qs_1 = request.getParameter("def"+i+"_"+k);
					}
				else if(k==2){	   
				   qs_2 = request.getParameter("def"+i+"_"+k);
					}
				else if(k==3){	   
					   qs_3 = request.getParameter("def"+i+"_"+k);
					}
				else if(k==4){	   
					   qs_4 = request.getParameter("def"+i+"_"+k);
					} 
				else if(k==5){	   
					   qs_5 = request.getParameter("def"+i+"_"+k);
					} 
				else if(k==6){	   
					   qs_6 = request.getParameter("def"+i+"_"+k);
					} 
				else if(k==7){	   
					   qs_7 = request.getParameter("def"+i+"_"+k);
					} 
				else if(k==8){	   
					   qs_8 = request.getParameter("def"+i+"_"+k);
					} 
				else if(k==9){	   
					   qs_9 = request.getParameter("def"+i+"_"+k);
					} 
				else if(k==10){	   
					   qs_10 = request.getParameter("def"+i+"_"+k);
					} 
				   
				   }
				   surveyO.insert_result_var(survey_sid, i, "selection", qs_1, qs_2, qs_3, qs_4, qs_5, qs_6, qs_7, qs_8, qs_9, qs_10);
	   }
	      System.out.println(val.charAt(j)+"val 값 확인용도");
	   j=j+3;   
	   }
	   
	  
	}


surveyO.result_conntent_insert(survey_sid, text_content);


script.println("<script>");
script.println("location.href='index.jsp'");
script.println("</script>");
%>

