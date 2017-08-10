package designer.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import designer.model.vo.DesignerOrder;

public class DesignerOrderDao {

	public int getListCount(Connection con, String id) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "SELECT COUNT(*) FROM ORDER_INFO WHERE DESIGN_CODE IN (SELECT DESIGN_CODE FROM DESIGN WHERE MEMBER_ID = ?)";

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

	public ArrayList<DesignerOrder> selectList(Connection conn, String id, int currentPage) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DesignerOrder> list = new ArrayList<>();

		String query = "SELECT * " + "FROM (SELECT ROWNUM RNUM, A.* "
				+ "      FROM (SELECT * "
				+ "            FROM ORDER_INFO "
				+ "            LEFT OUTER JOIN DESIGN USING(DESIGN_CODE) "
				+ "            LEFT OUTER JOIN PART USING(PART_CODE) "
				+ "            JOIN ORDER_STATE USING(ORDER_STATE_CODE) "
				+ "            LEFT OUTER JOIN SHIP_COMPANY USING(SHIP_COMPANY_NAME) "
				+ "            WHERE DESIGN_CODE IN (SELECT DESIGN_CODE "
				+ "                                  FROM DESIGN "
				+ "                                  WHERE MEMBER_ID = ?)"
				+ "            ORDER BY ORDER_DATE DESC ) A )"
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
				DesignerOrder designerOrder = new DesignerOrder();
				designerOrder.setOrderCode(rset.getString("ORDER_CODE"));
				designerOrder.setDesignCode(rset.getString("DESIGN_CODE"));
				designerOrder.setPartCode(rset.getString("PART_CODE"));
				designerOrder.setOrderDate(rset.getDate("ORDER_DATE"));
				designerOrder.setOrderCount(rset.getInt("ORDER_COUNT"));
				designerOrder.setDesignTitle(rset.getString("DESIGN_TITLE"));
				designerOrder.setDesignprice(rset.getInt("DESIGN_PRICE"));
				designerOrder.setDesignImg(rset.getString("DESIGN_IMG"));
				designerOrder.setPartTitle(rset.getString("PART_TITLE"));
				designerOrder.setPartPrice(rset.getInt("PART_PRICE"));
				designerOrder.setPartImg(rset.getString("PART_IMG"));
				designerOrder.setPartCategory(rset.getString("PART_CATEGORY"));
				designerOrder.setOrderStateName(rset.getString("ORDER_STATE_NAME"));
				designerOrder.setShipCompanyName(rset.getString("SHIP_COMPANY_NAME"));
				designerOrder.setOrderShipCode(rset.getString("ORDER_SHIP_CODE"));

				list.add(designerOrder);
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
