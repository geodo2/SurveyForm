package survey;

public class Survey_question_VO {
   private int seq;
   private int survey_seq;
   private String survey_content;
   private String survey_type;
   private String qs_1;
   private String qs_2;
   private String qs_3;
   private String qs_4;
   private String qs_5;
   private String qs_6;
   private String qs_7;
   private String qs_8;
   private String qs_9;
   private String qs_10;
   
   public Survey_question_VO() {
      
   }
   public Survey_question_VO(String survey_content, String survey_type) {
      this.survey_content=survey_content;
      this.survey_type=survey_type;
   }
   public Survey_question_VO(int seq, int survey_seq, String survey_content, String survey_type) {
      this.seq=seq;
      this.survey_seq=survey_seq;
      this.survey_content=survey_content;
      this.survey_type=survey_type;
   }
   public Survey_question_VO(int seq, int survey_seq, String survey_content, String survey_type,
		   String qs_1, String qs_2, String qs_3, String qs_4, String qs_5, String qs_6,
		   String qs_7, String qs_8, String qs_9, String qs_10) {
	   	  super();
	      this.seq=seq;
	      this.survey_seq=survey_seq;
	      this.survey_content=survey_content;
	      this.survey_type=survey_type;
	      this.qs_1=qs_1;
	      this.qs_2=qs_2;
	      this.qs_3=qs_3;
	      this.qs_4=qs_4;
	      this.qs_5=qs_5;
	      this.qs_6=qs_6;
	      this.qs_7=qs_7;
	      this.qs_8=qs_8;
	      this.qs_9=qs_9;
	      this.qs_10=qs_10;
	      
	   }
   public int getSeq() {
      return seq;
   }
   public void setSeq(int seq) {
      this.seq = seq;
   }
   public int getSurvey_seq() {
      return survey_seq;
   }
   public void setSurvey_seq(int survey_seq) {
      this.survey_seq = survey_seq;
   }
   public String getSurvey_content() {
      return survey_content;
   }
   public void setSurvey_content(String survey_content) {
      this.survey_content = survey_content;
   }
   public String getSurvey_type() {
      return survey_type;
   }
   public void setSurvey_type(String survey_type) {
      this.survey_type = survey_type;
   }
   public String getQs_1() {
      return qs_1;
   }
   public void setQs_1(String qs_1) {
      this.qs_1 = qs_1;
   }
   public String getQs_2() {
      return qs_2;
   }
   public void setQs_2(String qs_2) {
      this.qs_2 = qs_2;
   }
   public String getQs_3() {
      return qs_3;
   }
   public void setQs_3(String qs_3) {
      this.qs_3 = qs_3;
   }
   public String getQs_4() {
      return qs_4;
   }
   public void setQs_4(String qs_4) {
      this.qs_4 = qs_4;
   }
   public String getQs_5() {
      return qs_5;
   }
   public void setQs_5(String qs_5) {
      this.qs_5 = qs_5;
   }
   public String getQs_6() {
      return qs_6;
   }
   public void setQs_6(String qs_6) {
      this.qs_6 = qs_6;
   }
   public String getQs_7() {
      return qs_7;
   }
   public void setQs_7(String qs_7) {
      this.qs_7 = qs_7;
   }
   public String getQs_8() {
      return qs_8;
   }
   public void setQs_8(String qs_8) {
      this.qs_8 = qs_8;
   }
   public String getQs_9() {
      return qs_9;
   }
   public void setQs_9(String qs_9) {
      this.qs_9 = qs_9;
   }
   public String getQs_10() {
      return qs_10;
   }
   public void setQs_10(String qs_10) {
      this.qs_10 = qs_10;
   }
   
}