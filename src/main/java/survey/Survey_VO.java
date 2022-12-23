package survey;

public class Survey_VO {
	private int seq;
	private String survey_title;
	private String reg_date;
	private int item_num;
	
	public Survey_VO() {}
	public Survey_VO(String title) {
		this.survey_title=title;
	}
	public Survey_VO(int seq, String title, String date, int item) {
		this.seq=seq;
		this.survey_title=title;
		this.reg_date=date;
		this.item_num=item;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSurvey_title() {
		return survey_title;
	}
	public void setSurvey_title(String survey_title) {
		this.survey_title = survey_title;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	
	
}
