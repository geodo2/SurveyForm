<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter, java.util.*"%>
<%@ page import="survey.*, util.*"%>


<%
String userID = null;
request.setCharacterEncoding("UTF-8");
PrintWriter script = response.getWriter();
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}else{
	userID = "Guest";
}


Survey_VO survey = new Survey_VO(request.getParameter("survey_title"));
//설문지 질문 수량 (대략)
int count = Integer.parseInt(request.getParameter("total"));
List<String> cnt = new ArrayList<>();
for(int i=1; i<=count; i++){
	if(request.getParameter("survey_content"+i) != null )
		cnt.add(i+"");
}
survey.setItem_num(cnt.size());
survey.setUserID(userID);
List<Survey_question_VO> question = new ArrayList<>();// 질문지 내용



for(int i=0; i< cnt.size(); i++){
	question.add(new Survey_question_VO(request.getParameter("survey_content"+cnt.get(i)), request.getParameter("questionKind"+cnt.get(i)) ) );
		
	if( question.get(i).getSurvey_type().equals("Text") )
		continue;
	String temp="";
	for(int k=1; k<=10; k++){
		if( request.getParameter("qs_"+cnt.get(i)+"_"+k) !=null ){
			temp += request.getParameter("qs_"+cnt.get(i)+"_"+k)+"--";
		}
	}
	String[] tmp= temp.split("--");
	script.println(Arrays.toString(tmp));
	switch(tmp.length-1){
	case 10: 
		question.get(i).setQs_10(tmp[9]);
	case 9:
		question.get(i).setQs_9(tmp[8]);
	case 8:
		question.get(i).setQs_8(tmp[7]);
	case 7:
		question.get(i).setQs_7(tmp[6]);
	case 6:
		question.get(i).setQs_6(tmp[5]);
	case 5:
		question.get(i).setQs_5(tmp[4]);
	case 4:
		question.get(i).setQs_4(tmp[3]);
	case 3:
		question.get(i).setQs_3(tmp[2]);
	case 2:
		question.get(i).setQs_2(tmp[1]);
	case 1:
		question.get(i).setQs_1(tmp[0]);
	}
	script.println(question.get(i).getQs_4());
	
}

Survey_DAO sDAO = new Survey_DAO();
int sid=0;
sid =sDAO.insert_survey(survey,question);


%>

<script>

location.href='resultPrograming.jsp?survey_num='+<%=sid%>;
</script>















