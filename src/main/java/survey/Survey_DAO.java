package survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import util.DatabaseUtil;

public class Survey_DAO {

	
	public void insert_survey(Survey_VO survey, List<Survey_question_VO> question) {
		String sql = "insert into survey_list(survey_title,reg_date,num_of_item,userID) values(?,now(),?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int seq=1;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, survey.getSurvey_title());
			pstmt.setInt(2, survey.getItem_num());
			pstmt.setString(3, survey.getUserID());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		sql="select survey_seq from survey_list order by survey_seq desc";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				seq=rs.getInt("survey_seq");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		sql="insert into survey_question(survey_seq,survey_content,survey_type,qs_1,qs_2,qs_3,qs_4,qs_5,qs_6,qs_7,qs_8,qs_9,qs_10) ";
		sql+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			
			Iterator<Survey_question_VO> it = question.iterator();
			while(it.hasNext()) {
				Survey_question_VO temp = it.next();
				pstmt.setInt(1, seq);
				pstmt.setString(2, temp.getSurvey_content());
				pstmt.setString(3, temp.getSurvey_type());
				pstmt.setString(4, temp.getQs_1());
				pstmt.setString(5, temp.getQs_2());
				pstmt.setString(6, temp.getQs_3());
				pstmt.setString(7, temp.getQs_4());
				pstmt.setString(8, temp.getQs_5());
				pstmt.setString(9, temp.getQs_6());
				pstmt.setString(10, temp.getQs_7());
				pstmt.setString(11, temp.getQs_8());
				pstmt.setString(12, temp.getQs_9());
				pstmt.setString(13, temp.getQs_10());
				pstmt.executeUpdate();
			}
			pstmt.close();
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
}
