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
			System.out.println("1 체크");
			String text_answer = request.getParameter("survey_text"+i);
			int question_num=1+i;
			surveyO.insert_answer(1,11,"asd","asd","asd","asd");
		}
		else if(val.charAt(j) == '2'){
			System.out.println("2 체크");
		}
		else if(val.charAt(j) =='3'){
			System.out.println("3 체크");		
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