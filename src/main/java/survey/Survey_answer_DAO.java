package survey;

import java.sql.Connection;
import jakarta.servlet.ServletContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import util.DatabaseUtil;

public class Survey_answer_DAO extends DatabaseUtil {
	
	
	public Survey_question_VO[] question_data(int survey_seq) {
		System.out.println("here");
		Survey_question_VO[] newsurvey = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String query = "SELECT * FROM survey_question WHERE survey_seq = ?;";
		String countQuery = "SELECT count(*) FROM survey_question WHERE survey_seq = ?;";
		int count = 0;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(countQuery);
			pstmt.setInt(1,survey_seq);

			rs = pstmt.executeQuery();
			if(rs.next())
			{
				count = rs.getInt(1);
			}
			
			newsurvey = new Survey_question_VO[count];
			System.out.println(count);
			System.out.println("here");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,survey_seq);

			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next() ){ // get survey content
				newsurvey[i] =new Survey_question_VO(
						rs.getInt(1),
						rs.getInt(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13),
						rs.getString(14)
						);
				i++;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return newsurvey;
	}
	
	
	
	
	
	
}
