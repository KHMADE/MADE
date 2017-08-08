package design.model.dao;

import static common.JDBCTemplate.close;

import java.sql.*;
import java.util.*;

import design.model.vo.*;
import part.model.vo.Part;

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
		String sql = "UPDATE DESIGN SET DESIGN_TITLE = ?, DESIGN_CATEGORY = ?, DESIGN_CONTENTS = ?,"
				+ " DESIGN_PRICE = ?, DESIGN_IMG = ? WHERE DESIGN_CODE = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d.getDesignName());
			pstmt.setString(2, d.getDesignCategory());
			pstmt.setString(3, d.getDesignDesc());
			pstmt.setInt(4, d.getDesignPrice());
			pstmt.setString(5,d.getDesignImg());
			pstmt.setString(6, d.getDesignId());
			
			result = pstmt.executeUpdate();
			//System.out.println(result);
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

	/**
	 * @param con
	 * @return
	 */
	public ArrayList<Design> selectRecent10(Connection con) {
		ArrayList<Design> designList = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM (SELECT * FROM DESIGN ORDER BY DESIGN_DATE DESC) WHERE ROWNUM < 11";
		
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
	
	public String latestDesignData(Connection con){
		Statement stmt = null;
		ResultSet rset = null;
		String designCode = null;
		String sql = "SELECT * FROM (SELECT DESIGN_CODE FROM DESIGN ORDER BY DESIGN_DATE DESC) WHERE ROWNUM = 1";
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset.next()){
				designCode = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return designCode;
	};
	
	public int[] insertDesignPart(Connection con, ArrayList<DesignPart> deplist) {
		PreparedStatement pstmt = null; 
		int[] result = new int[deplist.size()];
		StringBuilder sql = new StringBuilder("INSERT INTO PART_SET VALUES(?, ?, ?)");
		String dId = latestDesignData(con);
		try {
			pstmt = con.prepareStatement(sql.toString());
			for(DesignPart dp : deplist){ 
				//System.out.println(dId+", "+dp.getPartCode()+", "+dp.getQuantity());
				pstmt.setString(1, dId); 
				pstmt.setString(2, dp.getPartCode()); 
				pstmt.setInt(3, dp.getQuantity()); 
				pstmt.addBatch(); 
			} 

			// Batch 실행하여 결과 리턴
			// (처리할 데이터가 많으면 Out Of Memory 발생하므로 후에 분산 insert 처리 필요)
	        result = pstmt.executeBatch();
	        
	        // Batch 초기화 (이전 pstmt가 남아있으므로 전부 비워랏!!!)
	        pstmt.clearBatch();
	        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int[] insertDesignPart(Connection con, String designCode, ArrayList<DesignPart> deplist) {
		PreparedStatement pstmt = null; 
		int[] result = new int[deplist.size()];
		StringBuilder sql = new StringBuilder("INSERT INTO PART_SET VALUES(?, ?, ?)");
		try {
			pstmt = con.prepareStatement(sql.toString());
			for(DesignPart dp : deplist){ 
				//System.out.println(dId+", "+dp.getPartCode()+", "+dp.getQuantity());
				pstmt.setString(1, designCode); 
				pstmt.setString(2, dp.getPartCode()); 
				pstmt.setInt(3, dp.getQuantity()); 
				pstmt.addBatch(); 
			} 

			// Batch 실행하여 결과 리턴
			// (처리할 데이터가 많으면 Out Of Memory 발생하므로 후에 분산 insert 처리 필요)
	        result = pstmt.executeBatch();
	        
	        // Batch 초기화 (이전 pstmt가 남아있으므로 전부 비워랏!!!)
	        pstmt.clearBatch();
	        
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Part> selectDesignPartList(Connection con, String dId) {
		ArrayList<Part> list = new ArrayList<Part>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT PART_CODE, PART_TITLE, PART_CATEGORY, PART_PRICE, QUANTITY, PART_IMG FROM PART"
				+" JOIN PART_SET USING(PART_CODE)"
				+" WHERE DESIGN_CODE = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dId);

			rset = pstmt.executeQuery();
			if (rset != null) {
				while (rset.next()) {
					list.add(new Part(rset.getString("PART_CODE"),
							rset.getString("PART_TITLE"),
							rset.getString("PART_CATEGORY"),
							rset.getInt("PART_PRICE"),
							rset.getInt("QUANTITY"),
							rset.getString("PART_IMG")));
				}
			}
		} catch (SQLException e){
			
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int[] updateDesignPart(Connection con, String dId, ArrayList<DesignPart> deplist) {
		PreparedStatement pstmt = null;
		int result1 = 0;
		int[] result2 = null;
		String sql = "DELETE FROM PART_SET WHERE DESIGN_CODE = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dId);
			result1 = pstmt.executeUpdate();
			if(result1 > 0 ) {
				result2 = insertDesignPart(con, dId, deplist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result2;
	}

	public int likechk(Connection con, String did, String mid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int chk = 0;
		String sql = "SELECT * FROM LIKELIST WHERE DESIGN_CODE = ? AND MEMBER_ID = ?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, did);
			pstmt.setString(2, mid);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				chk = 1;
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return chk;
	}

	public int insertLike(Connection con, String mid, String did) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO LIKELIST VALUES(?, ?, null)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, did);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
	
	public int deleteLike(Connection con, String mid, String did) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM LIKELIST WHERE MEMBER_ID = ? AND DESIGN_CODE = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, did);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
}
