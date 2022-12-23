package survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import util.DatabaseUtil;

public class Survey_answer_DAO extends DatabaseUtil {
	
	
	public Survey_question_VO[] getSeletComponent(int sid, int option_num) {
		Survey_question_VO[] newsurvey = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int survey_len = 0;
		String count_survey = "SELECT COUNT(*) FROM survey_question WHERE survey_seq=?;";
		try {
			pstmt = conn.prepareStatement(count_survey);
			pstmt.setInt(1, sid);
			pstmt.setInt(2, option_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				survey_len = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		String query = "SELECT * FROM survey_question WHERE survey_seq = ?;";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sid);

			rs = pstmt.executeQuery();
			
			newsurvey = new Survey_question_VO[survey_len];
			int i = 0;
			while(rs.next() && i <survey_len){ // get survey content
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
	
	public ArrayList<Survey_question_VO> getList (String lectureDivide, String searchType, String search, int pageNumber) {
		if(lectureDivide.equals("전체") ) 
			lectureDivide = "";
		ArrayList<Survey_question_VO> questionlist = null;
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchType.equals("최신순")) {
				sql = "SELECT * FROM evaluation WHERE lectureDivide LIKE ? AND CONCAT(lectureName, professorName, evaluationTitle, evaluationContent) LIKE "
						+ "? ORDER BY evaluationID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			} else if (searchType.equals("추천순")) {
				sql = "SELECT * FROM evaluation WHERE lectureDivide LIKE ? AND CONCAT(lectureName, professorName, evaluationTitle, evaluationContent) LIKE "
						+ "? ORDER BY likeCount DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + lectureDivide + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			questionlist = new ArrayList<Survey_question_VO>();
			while(rs.next()) {
				Survey_question_VO question = new Survey_question_VO(
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
				questionlist.add(question);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); }
			catch (Exception e) { e.printStackTrace(); }
		}
		return questionlist; //데이터 베이스 오류
	}
	
	
	
	
	
}
