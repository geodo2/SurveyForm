package survey;

public class Survey_result_content_VO {
	
	   private int sid;
	   private String content;
	
	   
	   public Survey_result_content_VO() {
	      
	   }
	
	   public Survey_result_content_VO(int sid, String content) {
	      this.sid=sid;
	      this.content=content;
	   }
	  
	   public int getSeq() {
	      return sid;
	   }
	   public void setSeq(int sid) {
	      this.sid = sid;
	   }
	   public String getSurvey_seq() {
	      return content;
	   }
	   public void setSurvey_seq(String content) {
	      this.content = content;
	   }
	   

}
