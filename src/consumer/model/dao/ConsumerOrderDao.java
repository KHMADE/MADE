package consumer.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import consumer.model.vo.ConsumerOrder;

public class ConsumerOrderDao {
	
	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "SELECT COUNT(*) FROM ORDER_INFO";

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

	public ArrayList<ConsumerOrder> selectList(Connection conn, int currentPage) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ConsumerOrder> list = new ArrayList<>();
		
		
		String query = "SELECT * "
				+ "FROM (SELECT ROWNUM RNUM, A.* "
				+ "      FROM (SELECT * "
				+ "            FROM ORDER_INFO "
				+ "            LEFT OUTER JOIN DESIGN USING(DESIGN_CODE) "
				+ "            LEFT OUTER JOIN PART USING(PART_CODE) "
				+ "            JOIN ORDER_STATE USING(ORDER_STATE_CODE) "
				+ "            LEFT OUTER JOIN SHIP_COMPANY USING(SHIP_COMPANY_NAME) "
				+ "            ORDER BY ORDER_DATE DESC ) A )"
				+ "WHERE RNUM >= ? AND RNUM <= ?";
		
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = startRow + 10 - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				ConsumerOrder consumerOrder = new ConsumerOrder();
				consumerOrder.setOrderCode(rset.getString("ORDER_CODE"));
				consumerOrder.setDesignCode(rset.getString("DESIGN_CODE"));
				consumerOrder.setPartCode(rset.getString("PART_CODE"));
				consumerOrder.setOrderDate(rset.getDate("ORDER_DATE"));
				consumerOrder.setOrderCount(rset.getInt("ORDER_COUNT"));
				consumerOrder.setDesignTitle(rset.getString("DESIGN_TITLE"));
				consumerOrder.setDesignprice(rset.getInt("DESIGN_PRICE"));
				consumerOrder.setDesignImg(rset.getString("DESIGN_IMG"));
				consumerOrder.setPartTitle(rset.getString("PART_TITLE"));
				consumerOrder.setPartPrice(rset.getInt("PART_PRICE"));
				consumerOrder.setPartImg(rset.getString("PART_IMG"));
				consumerOrder.setPartCategory(rset.getString("PART_CATEGORY"));
				consumerOrder.setOrderStateName(rset.getString("ORDER_STATE_NAME"));
				consumerOrder.setShipCompanyName(rset.getString("SHIP_COMPANY_NAME"));
				
				list.add(consumerOrder);
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
