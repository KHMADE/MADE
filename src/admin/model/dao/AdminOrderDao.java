package admin.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import admin.model.vo.AdminOrder;

public class AdminOrderDao {

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "SELECT COUNT(*) FROM ORDER_INFO WHERE DESIGN_CODE IS NOT NULL";

		try {
			stmt = conn.createStatement();
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

	public ArrayList<AdminOrder> selectList(Connection conn, int currentPage) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminOrder> list = new ArrayList<>();

		String query = "SELECT * " + "FROM (SELECT ROWNUM RNUM, A.* "
				+ "      FROM (SELECT * "
				+ "            FROM ORDER_INFO "
				+ "            LEFT OUTER JOIN DESIGN USING(DESIGN_CODE) "
				+ "            LEFT OUTER JOIN PART USING(PART_CODE) "
				+ "            JOIN ORDER_STATE USING(ORDER_STATE_CODE) "
				+ "            LEFT OUTER JOIN SHIP_COMPANY USING(SHIP_COMPANY_NAME) "
				+ "            WHERE DESIGN_CODE IS NOT NULL "
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
				AdminOrder adminOrder = new AdminOrder();
				adminOrder.setOrderCode(rset.getString("ORDER_CODE"));
				adminOrder.setDesignCode(rset.getString("DESIGN_CODE"));
				adminOrder.setPartCode(rset.getString("PART_CODE"));
				adminOrder.setOrderDate(rset.getDate("ORDER_DATE"));
				adminOrder.setOrderCount(rset.getInt("ORDER_COUNT"));
				adminOrder.setDesignTitle(rset.getString("DESIGN_TITLE"));
				adminOrder.setDesignprice(rset.getInt("DESIGN_PRICE"));
				adminOrder.setDesignImg(rset.getString("DESIGN_IMG"));
				adminOrder.setPartTitle(rset.getString("PART_TITLE"));
				adminOrder.setPartPrice(rset.getInt("PART_PRICE"));
				adminOrder.setPartImg(rset.getString("PART_IMG"));
				adminOrder.setPartCategory(rset.getString("PART_CATEGORY"));
				adminOrder.setOrderStateName(rset.getString("ORDER_STATE_NAME"));
				adminOrder.setShipCompanyName(rset.getString("SHIP_COMPANY_NAME"));
				adminOrder.setOrderShipCode(rset.getString("ORDER_SHIP_CODE"));

				list.add(adminOrder);
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
