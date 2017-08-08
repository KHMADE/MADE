package member.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import member.model.vo.*;
import member.model.service.*;

public class ReviewDAO {

	public ReviewDAO() {}

	public ArrayList<ItemReview> selectDesignReview(Connection con, String dId) {
		ArrayList<ItemReview> reviewlist = new ArrayList<ItemReview>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = "SELECT * FROM VW_ITEM_REVIEW WHERE DESIGN_CODE = ? ";
/*
 * CREATE OR REPLACE VIEW VW_ITEM_REVIEW AS
SELECT REVIEW_CODE,MEMBER_ID,MEMBER_PROFILE_IMG,PART_CODE,DESIGN_CODE,REVIEW_CONTENT,REVIEW_DATE  FROM MEMBER
JOIN ITEM_REVIEW USING(MEMBER_ID) ORDER BY REVIEW_DATE DESC;
*/
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dId);
			rset = pstmt.executeQuery();

			if (rset != null) {
				while(rset.next()){
					reviewlist.add(new ItemReview(rset.getString("REVIEW_CODE"),
							rset.getString("PART_CODE"),rset.getString("DESIGN_CODE"),
							rset.getString("MEMBER_ID"),rset.getString("MEMBER_PROFILE_IMG"),
							rset.getString("REVIEW_CONTENT"), rset.getDate("REVIEW_DATE")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reviewlist;
	}

	public int insertDesignReview(Connection con, String dId, String mid, String content) {
		PreparedStatement pstmt = null; 
		int result = 0;
		String sql = "INSERT INTO ITEM_REVIEW VALUES('RV'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_REVIEW.NEXTVAL,2,'0'), null, ?, ?, ?, SYSDATE)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,dId);
			pstmt.setString(2,mid);
			pstmt.setString(3,content);
			//System.out.println(dId+", "+mid+", "+content);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateDesignReview(Connection con, String reviewCode, String updtContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		//System.out.println("디자인 리뷰 업뎃 DAO :"+reviewCode+", "+updtContent);
		String query = "UPDATE ITEM_REVIEW " + "SET REVIEW_CONTENT = ? "
		+ "WHERE REVIEW_CODE = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, updtContent);
			pstmt.setString(2, reviewCode);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int deleteDesignReview(Connection con, String reviewCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE FROM ITEM_REVIEW WHERE REVIEW_CODE = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reviewCode);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public ArrayList<ItemReview> selectPartReview(Connection con, String pId) {
		ArrayList<ItemReview> reviewlist = new ArrayList<ItemReview>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = "SELECT * FROM VW_ITEM_REVIEW WHERE PART_CODE = ? ";
/*
 * CREATE OR REPLACE VIEW VW_ITEM_REVIEW AS
SELECT REVIEW_CODE,MEMBER_ID,MEMBER_PROFILE_IMG,PART_CODE,DESIGN_CODE,REVIEW_CONTENT,REVIEW_DATE  FROM MEMBER
JOIN ITEM_REVIEW USING(MEMBER_ID) ORDER BY REVIEW_DATE DESC;
*/
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pId);
			rset = pstmt.executeQuery();

			if (rset != null) {
				while(rset.next()){
					reviewlist.add(new ItemReview(rset.getString("REVIEW_CODE"),
							rset.getString("PART_CODE"),rset.getString("DESIGN_CODE"),
							rset.getString("MEMBER_ID"),rset.getString("MEMBER_PROFILE_IMG"),
							rset.getString("REVIEW_CONTENT"), rset.getDate("REVIEW_DATE")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reviewlist;
	}

	public int insertPartReview(Connection con, String pId, String mid, String content) {
		PreparedStatement pstmt = null; 
		int result = 0;
		String sql = "INSERT INTO ITEM_REVIEW VALUES('RV'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_REVIEW.NEXTVAL,2,'0'), ?, null, ?, ?, SYSDATE)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,pId);
			pstmt.setString(2,mid);
			pstmt.setString(3,content);
			//System.out.println(pId+", "+mid+", "+content);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updatePartReview(Connection con, String reviewCode, String updtContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		//System.out.println("부품 리뷰 업뎃 DAO :"+reviewCode+", "+updtContent);
		String query = "UPDATE ITEM_REVIEW " + "SET REVIEW_CONTENT = ? "
		+ "WHERE REVIEW_CODE = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, updtContent);
			pstmt.setString(2, reviewCode);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int deletePartReview(Connection con, String reviewCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE FROM ITEM_REVIEW WHERE REVIEW_CODE = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reviewCode);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}
