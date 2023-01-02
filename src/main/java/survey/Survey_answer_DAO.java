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
	public Survey_VO[] question_list_data(int survey_seq) {
		
		Survey_VO[] newsurvey = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String query = "SELECT * FROM survey_list WHERE survey_seq = ?;";
		String countQuery = "SELECT count(*) FROM survey_list WHERE survey_seq = ?;";
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
			
			newsurvey = new Survey_VO[count];
		
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,survey_seq);

			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next() ){ // get survey content
				newsurvey[i] =new Survey_VO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5)
						);
				i++;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return newsurvey;
	}
	
	public Survey_VO[] get_usersurvey(String userid) {
		
		Survey_VO[] getsurvey = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String query = "SELECT * FROM survey_list WHERE userID = ?;";
		String countQuery = "SELECT count(*) FROM survey_list WHERE userID = ?;";
		int count = 0;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(countQuery);
			pstmt.setString(1,userid);

			rs = pstmt.executeQuery();
			if(rs.next())
			{
				count = rs.getInt(1);
			}
			
			getsurvey = new Survey_VO[count];
	
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,userid);

			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next() ){
				// get survey content
				getsurvey[i] =new Survey_VO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5)
						);
				i++;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return getsurvey;
	}
	
	
	public void insert_answer( int survey_seq, int question_seq, String content, String user,
			String qs_1,String qs_2,String qs_3,String qs_4,String qs_5,String qs_6,String qs_7,String qs_8,String qs_9,String qs_10) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int seq=1;
		String sql="select answer_seq from survey_answer order by answer_seq desc";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				seq=rs.getInt("answer_seq");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		seq=seq+1;
		
		
		sql="insert into survey_answer(answer_seq,survey_seq,question_seq,answer_content,reg_data,user_id,qs_1,qs_2,qs_3,qs_4,qs_5,qs_6,qs_7,qs_8,qs_9,qs_10)";
		sql+=" values(?,?,?,?,now(),?,?,?,?,?,?,?,?,?,?,?)";
		try {
	
	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.setInt(2, survey_seq);
			pstmt.setInt(3, question_seq);
			pstmt.setString(4, content);
			pstmt.setString(5, user);
			pstmt.setString(6, qs_1);
			pstmt.setString(7, qs_2);
			pstmt.setString(8, qs_3);
			pstmt.setString(9, qs_4);
			pstmt.setString(10, qs_5);
			pstmt.setString(11, qs_6);
			pstmt.setString(12, qs_7);
			pstmt.setString(13, qs_8);
			pstmt.setString(14, qs_9);
			pstmt.setString(15, qs_10);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void insert_answer_list( int survey_seq, String user) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int seq=1;
		String sql="select survey_answer_seq from survey_answer_list order by survey_answer_seq desc";
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				seq=rs.getInt("survey_answer_seq");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		seq=seq+1;

		
		sql="insert into survey_answer_list(survey_answer_seq,survey_seq,reg_date,user_id)";
		sql+=" values(?,?,now(),?)";
		try {
	
	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.setInt(2, survey_seq);
			pstmt.setString(3,user);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public Survey_answer_list_VO[] answer_list(int survey_seq) {
		
		Survey_answer_list_VO[] survey_answer = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String query = "SELECT * FROM Survey_answer_list WHERE survey_seq = ?;";
		String countQuery = "SELECT count(*) FROM Survey_answer_list WHERE survey_seq = ?;";
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
			
			survey_answer = new Survey_answer_list_VO[count];
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,survey_seq);

			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next() ){ // get survey content
				survey_answer[i] =new Survey_answer_list_VO(
						rs.getInt(1),
						rs.getInt(2),
						rs.getString(3),
						rs.getString(4)
						);
				i++;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return survey_answer;
	}
	public Survey_answer_VO[] survey_answer(int survey_seq,String user_id) {
			
			Survey_answer_VO[] show_answer = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs=null;
			
			String query = "SELECT * FROM survey_answer WHERE survey_seq = ? and user_id = ?;";
			String countQuery = "SELECT count(*) FROM survey_answer WHERE survey_seq = ? and user_id = ?;";
			int count = 0;
			try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(countQuery);
				pstmt.setInt(1,survey_seq);
				pstmt.setString(2,user_id);
				rs = pstmt.executeQuery();
				if(rs.next())
				{
					count = rs.getInt(1);
				}
				
				show_answer = new Survey_answer_VO[count];
				
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1,survey_seq);
				pstmt.setString(2,user_id);
				rs = pstmt.executeQuery();
				int i = 0;
				while(rs.next() ){ // get survey content
					show_answer[i] =new Survey_answer_VO(
							rs.getInt(1),
							rs.getInt(2),
							rs.getInt(3),
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
							rs.getString(14),
							rs.getString(15),
							rs.getString(16)
							
							);
					i++;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return show_answer;
		}
	
	
}
