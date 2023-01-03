<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter, java.util.*"%>
<%@ page import="survey.*, util.*"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
PrintWriter script = response.getWriter();
String[]test_value = request.getParameterValues("checkboxGroup1");
String question_count = request.getParameter("total");

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

int question_int =0;
question_int= Integer.parseInt(question_count);
int q_cnt=0;

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
		if(val.charAt(j) == '1'){
			
			String text_answer = request.getParameter("survey_text"+i);
			int question_num=1+i;
			surveyO.insert_answer(survey_sid,i,text_answer,userID,null,null,null,null,null,null,null,null,null,null);
		}
		else if(val.charAt(j) == '2'){
			
			String radio_answer = request.getParameter("radioGroup"+i);
			surveyO.insert_answer(survey_sid,i,radio_answer,userID,"radio",null,null,null,null,null,null,null,null,null);
		}
		else if(val.charAt(j) =='3'){	
			
			String[] checkbox = request.getParameterValues("checkboxGroup"+i);
			for(String check:checkbox){
				
				if(check.equals("1")){
					 qs_1=check;	
				}
				else if(check.equals("2")){
					 qs_2=check;
				}
				else if(check.equals("3")){
					 qs_3=check;
				}
				else if(check.equals("4")){
					 qs_4=check;
				}
				else if(check.equals("5")){
					 qs_5=check;
				}
				else if(check.equals("6")){
					 qs_6=check;
				}
				else if(check.equals("7")){
					 qs_7=check;
				}
				else if(check.equals("8")){
					 qs_8=check;
				}
				else if(check.equals("9")){
					 qs_9=check;
				}
				else if(check.equals("10")){
					 qs_10=check;
				}								
			}
			surveyO.insert_answer(survey_sid,i,"checkbox",userID,qs_1,qs_2,qs_3,qs_4,qs_5,qs_6,qs_7,qs_8,qs_9,qs_10);			

		}
		j=j+3;
	}
	
	surveyO.insert_answer_list(survey_sid,userID);	
	
}



script.println("<script>");

script.println("</script>");
%>
<script>
location.href='userSubmitResult.jsp?survey_num='+<%=sid%>+'&&userid='+"<%=userID%>";
</script>

