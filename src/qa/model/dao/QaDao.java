package qa.model.dao;

import java.sql.*;
import java.util.*;

import board.model.dao.Exception;
import board.model.dao.PreparedStatement;
import board.model.dao.String;

import static common.JDBCTemplate.*;
import qa.model.vo.Qa;

public class QaDao {

	public ArrayList<Qa> selectQaList(Connection con, int currentPage, int limit) {
		ArrayList<Qa> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "select * from " 
				+ "(select rownum rnum, QA_CODE, " 
				+ "MEMBER_ID, QA_TITLE, "
				+ "QA_CONTENTS, QA_DATE, " 
				+ "QA_IMG, QA_ANSWER "
				+ "from QA) " 
				+ "where rnum >= ? and rnum <= ?";
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<Qa>();
					while (rset.next()) {				
							list.add(new Qa(
							rset.getString("QA_CODE"),
							rset.getString("MEMBER_ID"),
							rset.getString("QA_TITLE"),
							rset.getString("QA_CONTENTS"),
							rset.getDate("QA_DATE"),
							rset.getString("QA_IMG"),
							rset.getString("QA_ANSWER")
							));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public Qa selectQa(Connection con, String no) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Qa qa=null;
		String sql = "SELECT * FROM QA WHERE QA_CODE = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rset = pstmt.executeQuery();
			if(rset.next()){
				qa = new Qa(
						no,
						rset.getString("MEMBER_ID"),
						rset.getString("QA_TITLE"),
						rset.getString("QA_CONTENTS"),
						rset.getDate("QA_DATE"),
						rset.getString("QA_IMG"),
						rset.getString("QA_ANSWER")
						);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return qa;
	}

	public int insertQa(Connection con, Qa qa) {
		
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO QA VALUES('QA'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_DE.NEXTVAL,2,'0'),?,?,?,SYSDATE,?,null)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qa.getMemberId());
			pstmt.setString(2, qa.getQaTitle());
			pstmt.setString(3, qa.getQaContents());
			pstmt.setString(4, qa.getQaImg());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from QA";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}




	public int updateQaAnswer(Connection con, String qaNum, String answer) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update qa "
				+ "set qa_answer = ? "
				+ "where QA_CODE = ? ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, answer);
			pstmt.setString(2, qaNum);
		
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	

}
