package survey;

public class Survey_answer_list_VO {
	private int survey_answer_seq;
	private int survey_seq;
	private String reg_data;
	private String user_id;

   	
	public Survey_answer_list_VO() {}
	public Survey_answer_list_VO(int seq, int survey_seq, String data, String user) {
		this.survey_answer_seq=seq;
		this.survey_seq=survey_seq;
		this.reg_data=data;
		this.user_id=user;

	      		
	}
	public void setAnswer_seq(int answer_seq) {
		this.survey_answer_seq = answer_seq;
	}
	public int getSurvey_answer_seq() {
		return survey_answer_seq;
	}
	public void setSurvey_seq(int survey_seq) {
		this.survey_seq = survey_seq;
	}
	public int getSurvey_seq() {
		return survey_seq;
	}
	public String getReg_data() {
		return reg_data;
	}
	public void setReg_data(String reg_data) {
		this.reg_data = reg_data;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
