package design.model.dao;

import static common.JDBCTemplate.close;

import java.sql.*;
import java.util.*;

import design.model.vo.*;

public class DesignDAO {

	public DesignDAO() {}

	public ArrayList<Design> designList(Connection con) {
		ArrayList<Design> designList = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM DESIGN ORDER BY DESIGN_DATE DESC";
		
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset != null){
				designList = new ArrayList<Design>();
				while(rset.next()){
					designList.add(new Design(rset.getString("DESIGN_CODE"),
							rset.getString("DESIGN_TITLE"),
							rset.getString("DESIGN_CATEGORY"),
							rset.getDate("DESIGN_DATE"),
							rset.getString("DESIGN_CONTENTS"),
							rset.getInt("DESIGN_PRICE"),
							rset.getString("DESIGN_IMG"),
							rset.getString("MEMBER_ID"),
							rset.getInt("DESIGN_COUNT")));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return designList;
	}
	
	public HashMap<String,Design> designMap(Connection con) {
		HashMap<String,Design> designMap = null;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM DESIGN ORDER BY DESIGN_DATE DESC";
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset != null){
				designMap = new HashMap<String,Design>();
				while(rset.next()){
					designMap.put(rset.getString("DESIGN_CODE"), 
						new Design(rset.getString("DESIGN_CODE"),
								rset.getString("DESIGN_TITLE"),
								rset.getString("DESIGN_CATEGORY"),
								rset.getDate("DESIGN_DATE"),
								rset.getString("DESIGN_CONTENTS"),
								rset.getInt("DESIGN_PRICE"),
								rset.getString("DESIGN_IMG"),
								rset.getString("MEMBER_ID"),
								rset.getInt("DESIGN_COUNT")));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return designMap;
	}
	
	public Design selectOne(Connection con, String id) {
		Design design = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM DESIGN WHERE DESIGN_CODE = ?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			if(rset.next()){
				design = new Design(
						id,
						rset.getString("DESIGN_TITLE"),
						rset.getString("DESIGN_CATEGORY"),
						rset.getDate("DESIGN_DATE"),
						rset.getString("DESIGN_CONTENTS"),
						rset.getInt("DESIGN_PRICE"),
						rset.getString("DESIGN_IMG"),
						rset.getString("MEMBER_ID"),
						rset.getInt("DESIGN_COUNT"));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return design;
	}
	
	public int designPartPrice(Connection con, String id){
		int price = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT SUM(QUANTITY*PART_PRICE) \"RESULT\" FROM DESIGN"
					 +" JOIN PART_SET USING(DESIGN_CODE)"
					 +" JOIN PART USING(PART_CODE) "
					 +" WHERE DESIGN_CODE = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				price = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}
	
	public ArrayList<Design> selectTitle(Connection con, String title){
		ArrayList<Design> designList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM DESIGN WHERE DESIGN_TITLE LIKE ? ORDER BY DESIGN_DATE DESC";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+title+"%");
			rset = pstmt.executeQuery();
			if(rset != null){
				designList = new ArrayList<Design>();
				while(rset.next()){
					designList.add(new Design(
							rset.getString("DESIGN_CODE"),
							rset.getString("DESIGN_TITLE"),
							rset.getString("DESIGN_CATEGORY"),
							rset.getDate("DESIGN_DATE"),
							rset.getString("DESIGN_CONTENTS"),
							rset.getInt("DESIGN_PRICE"),
							rset.getString("DESIGN_IMG"),
							rset.getString("MEMBER_ID"),
							rset.getInt("DESIGN_COUNT")));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return designList;
	}
	
	public int insertDesign(Connection con, Design d){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO DESIGN VALUES('DE'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_DE.NEXTVAL,2,'0'),?,?,SYSDATE,?,?,?,?,0)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d.getDesignName());
			pstmt.setString(2, d.getDesignCategory());
			pstmt.setString(3, d.getDesignDesc());
			pstmt.setInt(4,d.getDesignPrice());
			pstmt.setString(5, d.getDesignImg());
			pstmt.setString(6, d.getDesignerId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
	
	public int updateDesign(Connection con, Design d){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE DESIGN SET DESIGN_TITLE = ?, DESIGN_CONTENTS = ?, "
				+ "DESIGN_PRICE = ?, DESIGN_IMG = ? WHERE DESIGN_CODE = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d.getDesignName());
			pstmt.setString(2, d.getDesignDesc());
			pstmt.setInt(3, d.getDesignPrice());
			pstmt.setString(4,d.getDesignImg());
			pstmt.setString(5, d.getDesignerId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
	
	public int deleteDesign(Connection con, String id){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM DESIGN WHERE DESIGN_CODE = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Design> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Design> list = new ArrayList<Design>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT * FROM (SELECT ROWNUM AS ROW_NUMBER, COUNT(*) OVER()"
				+ " TOTAL_ROW_COUNT, A.* FROM"
				+ " ( SELECT * FROM DESIGN ORDER BY DESIGN_DATE DESC ) A )"
				+ " WHERE ROWNUM <= ? AND ROW_NUMBER > ?";

		int startRow = (currentPage - 1) * limit;
		//int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, limit);
			pstmt.setInt(2, startRow);

			rset = pstmt.executeQuery();
			if (rset != null) {
				
				while (rset.next()) {
					Design d = new Design(
							rset.getString("DESIGN_CODE"),
							rset.getString("DESIGN_TITLE"),
							rset.getString("DESIGN_CATEGORY"),
							rset.getDate("DESIGN_DATE"),
							rset.getString("DESIGN_CONTENTS"),
							rset.getInt("DESIGN_PRICE"),
							rset.getString("DESIGN_IMG"),
							rset.getString("MEMBER_ID"),
							rset.getInt("DESIGN_COUNT"));
					list.add(d);
				}
			}
		} catch (SQLException e){
			
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from design";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
				// select 절의 첫번째 항목을 뜻함
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}
	
	public int addReadCount(Connection con, String designCode) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "UPDATE DESIGN " + "SET DESIGN_COUNT = DESIGN_COUNT + 1 "
		+ "WHERE DESIGN_CODE = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, designCode);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Design> designTop5(Connection con) {
		ArrayList<Design> designList = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM (SELECT * FROM DESIGN ORDER BY DESIGN_COUNT DESC) WHERE ROWNUM < 6";
		
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset != null){
				designList = new ArrayList<Design>();
				while(rset.next()){
					designList.add(new Design(rset.getString("DESIGN_CODE"),
							rset.getString("DESIGN_TITLE"),
							rset.getString("DESIGN_CATEGORY"),
							rset.getDate("DESIGN_DATE"),
							rset.getString("DESIGN_CONTENTS"),
							rset.getInt("DESIGN_PRICE"),
							rset.getString("DESIGN_IMG"),
							rset.getString("MEMBER_ID"),
							rset.getInt("DESIGN_COUNT")));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return designList;
	}
}
