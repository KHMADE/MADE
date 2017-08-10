package like.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import consumer.model.vo.ConsumerOrder;
import like.model.vo.Like;

public class LikeDao {
	
	public int getListCount(Connection con, String id) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT COUNT(*) FROM LIKELIST WHERE MEMBER_ID = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return listCount;
	}

	public ArrayList<Like> selectList(Connection conn, String id, int currentPage) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Like> list = new ArrayList<>();
		
		String query = "SELECT * "
				+ "FROM (SELECT ROWNUM RNUM, A.* "
				+ "      FROM (SELECT * "
				+ "            FROM LIKELIST "
				+ "            LEFT OUTER JOIN DESIGN USING(DESIGN_CODE) "
				+ "            LEFT OUTER JOIN PART USING(PART_CODE) "
				+ "            WHERE LIKELIST.MEMBER_ID = ? "
				+ "            ORDER BY DESIGN_CODE ASC, PART_CODE ASC) A ) "
				+ "WHERE RNUM >= ? AND RNUM <= ?";
		
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = startRow + 10 - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				Like like = new Like();
				like.setDesignCode(rset.getString("DESIGN_CODE"));
				like.setPartCode(rset.getString("PART_CODE"));
				like.setDesignTitle(rset.getString("DESIGN_TITLE"));
				like.setDesignprice(rset.getInt("DESIGN_PRICE"));
				like.setDesignImg(rset.getString("DESIGN_IMG"));
				like.setPartTitle(rset.getString("PART_TITLE"));
				like.setPartPrice(rset.getInt("PART_PRICE"));
				like.setPartImg(rset.getString("PART_IMG"));
				like.setPartCategory(rset.getString("PART_CATEGORY"));
				
				list.add(like);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

}
