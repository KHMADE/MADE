package part.model.dao;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.util.*;

import part.model.vo.*;

public class PartDAO {

	public PartDAO() {}
	
	public ArrayList<Part> selectList(Connection con){
		ArrayList<Part> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM PART ORDER BY PART_DATE DESC";
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset != null){
				 list = new ArrayList<Part>();
				while(rset.next()){
					list.add(new Part(rset.getString("PART_CODE"),rset.getString("PART_TITLE"),rset.getString("PART_CATEGORY"),
							rset.getDate("PART_DATE"),rset.getInt("PART_PRICE"),
							rset.getInt("PART_STOCK"),rset.getString("PART_CONTENTS"),
							rset.getString("PART_IMG")));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	public HashMap<String,Part> partMap(Connection con) {
		HashMap<String,Part> partMap = null;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM PART ORDER BY PART_DATE DESC";
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset != null){
				partMap = new HashMap<String,Part>();
				while(rset.next()){
					partMap.put(rset.getString("PART_CODE"),
							new Part(rset.getString("PART_CODE"),rset.getString("PART_TITLE"),
									rset.getString("PART_CATEGORY"),rset.getDate("PART_DATE"),
									rset.getInt("PART_PRICE"),rset.getInt("PART_STOCK"),
									rset.getString("PART_CONTENTS"),rset.getString("PART_IMG")));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return partMap;
	}
	
	public ArrayList<Part> selectTitle(Connection con, String title){
		ArrayList<Part> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM NOTICE WHERE PART_TITLE LIKE ? ORDER BY PART_DATE DESC";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+title+"%");
			rset = pstmt.executeQuery();
			if(rset != null){
				 list = new ArrayList<Part>();
				while(rset.next()){
					list.add(new Part(rset.getString("PART_CODE"),rset.getString("PART_TITLE"),rset.getString("PART_CATEGORY"),
							rset.getDate("PART_DATE"),rset.getInt("PART_PRICE"),
							rset.getInt("PART_STOCK"),rset.getString("PART_CONTENTS"),
							rset.getString("PART_IMG")));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Part selectPartOne(Connection con, String id) {
		Part part = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM PART WHERE PART_CODE = ?";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();

			if(rset.next()){
				part = new Part(id,rset.getString("PART_TITLE"),rset.getString("PART_CATEGORY"),
						rset.getDate("PART_DATE"),rset.getInt("PART_PRICE"),
						rset.getInt("PART_STOCK"),rset.getString("PART_CONTENTS"),
						rset.getString("PART_IMG"));
			}
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return part;
	}

	public int insertPart(Connection con, Part p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO PART VALUES('PA'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_PART.NEXTVAL,2,'0'),?,?,SYSDATE,?,?,?,?,0)";
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p.getPartName());
			pstmt.setString(2, p.getPartCategory());
			pstmt.setInt(3, p.getPrice());
			pstmt.setInt(4, p.getQuantity());
			pstmt.setString(5, p.getPartDesc());
			pstmt.setString(6, p.getPartImg());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePart(Connection con, Part p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE PART SET PART_TITLE = ?, PART_CATEGORY = ?, PART_PRICE = ?, "
				+"PART_STOCK = ?, PART_CONTENTS = ?, PART_IMG = ? "
				+"WHERE PART_CODE = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p.getPartName());
			pstmt.setString(2, p.getPartCategory());
			pstmt.setInt(3, p.getPrice());
			pstmt.setInt(4, p.getQuantity());
			pstmt.setString(5, p.getPartDesc());
			pstmt.setString(6, p.getPartImg());
			pstmt.setString(7, p.getPartId());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deletePart(Connection con, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM PART WHERE PART_CODE = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Part> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Part> list = new ArrayList<Part>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM (SELECT ROWNUM AS ROW_NUMBER,"
				+ " COUNT(*) OVER() TOTAL_ROW_COUNT, A.* FROM"
				+ " ( SELECT * FROM PART ORDER BY PART_DATE DESC ) A )"
				+ " WHERE ROWNUM <= ? AND ROW_NUMBER > ?";
		
		//"SELECT * FROM (SELECT ROWNUM AS ROW_NUMBER, COUNT(*) OVER() TOTAL_ROW_COUNT, A.* FROM ( " + 페이징할 쿼리문 + " ) A ) WHERE ROWNUM <= :PAGE_SIZE AND ROW_NUMBER > (:PAGE_NUMBER-1) * :PAGE_SIZE;"
		
		int startRow = (currentPage - 1) * limit;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, limit);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			if (rset != null) {
				while (rset.next()) {
					Part p = new Part(rset.getString("PART_CODE"),
							rset.getString("PART_TITLE"),
							rset.getString("PART_CATEGORY"),
							rset.getDate("PART_DATE"),
							rset.getInt("PART_PRICE"),
							rset.getInt("PART_STOCK"),
							rset.getString("PART_CONTENTS"),
							rset.getString("PART_IMG"));
					list.add(p);
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

		String query = "select count(*) from part";

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
	
	public int addReadCount(Connection con, String partCode) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "UPDATE PART " + "SET PART_COUNT = PART_COUNT + 1 "
		+ "WHERE PART_CODE = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, partCode);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}
