package survey;

public class Survey_answer_VO {
	private int answer_seq;
	private int survey_seq;
	private int question_seq;
	private String answer_content;
	private String reg_date;
	private String user_id;
	
	public Survey_answer_VO() {}
	public Survey_answer_VO(int seq, int survey_seq, int question_seq, String content, String date, String user) {
		this.answer_seq=seq;
		this.survey_seq=survey_seq;
		this.question_seq=question_seq;
		this.answer_content=content;
		this.reg_date=date;
		this.user_id=user;
	}
	public int getAnswer_seq() {
		return answer_seq;
	}
	public void setAnswer_seq(int answer_seq) {
		this.answer_seq = answer_seq;
	}
	public int getSurvey_seq() {
		return survey_seq;
	}
	public void setSurvey_seq(int survey_seq) {
		this.survey_seq = survey_seq;
	}
	public int getQuestion_seq() {
		return question_seq;
	}
	public void setQuestion_seq(int question_seq) {
		this.question_seq = question_seq;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
