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
	   public String get_content() {
	      return content;
	   }
	   public void set_content(String content) {
	      this.content = content;
	   }
	   

}
