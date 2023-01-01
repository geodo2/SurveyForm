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


int survey_sid=0;
String sid = request.getParameter("sid");
System.out.println(sid+"sid번호");

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
		

		if(val.charAt(j) == '1'){
			
			String text_answer = request.getParameter("survey_text"+i);
			int question_num=1+i;
			surveyO.insert_answer(survey_sid,question_int,text_answer,"holiday1883",null,null,null,null,null,null,null,null,null,null);
		}
		else if(val.charAt(j) == '2'){
			
			String radio_answer = request.getParameter("radioGroup"+i);
			surveyO.insert_answer(survey_sid,question_int,radio_answer,"holiday1883","radio",null,null,null,null,null,null,null,null,null);
		}
		else if(val.charAt(j) =='3'){	
			
			String[] checkbox = request.getParameterValues("checkboxGroup"+i);
			for(String check:checkbox){
				System.out.println(check);
			}
//surveyO.insert_answer(survey_sid,question_int,"checkbox","holiday1883",qs_1,qs_2,qs_3,qs_4,qs_5,qs_6,qs_7,qs_8,qs_9,qs_10);			
		}
		j=j+3;
	}
		System.out.println(val.charAt(3));
	
}

System.out.println(question_type.length);
script.println("<script>");
script.println("alert('정상등록되었습니다.')");
script.println("history.back();");
script.println("</script>");

%>