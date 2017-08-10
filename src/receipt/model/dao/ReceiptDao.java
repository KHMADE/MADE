package receipt.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import receipt.model.vo.Receipt;

public class ReceiptDao {

	public Receipt selectDesignReceipt(Connection conn, String orderCode) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Receipt reciept = null;

		String query = "SELECT ORDER_CODE, ORDER_DATE, MEMBER_NAME, DESIGN_PRICE, DESIGN_TITLE, ORDER_COUNT "
				+ "FROM ORDER_INFO "
				+ "JOIN MEMBER USING(MEMBER_ID) "
				+ "JOIN DESIGN USING(DESIGN_CODE) "
				+ "WHERE ORDER_CODE = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, orderCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				reciept = new Receipt(rset.getString("ORDER_CODE"), rset.getDate("ORDER_DATE"), rset.getString("MEMBER_NAME"), rset.getInt("DESIGN_PRICE"), rset.getString("DESIGN_TITLE"), rset.getInt("ORDER_COUNT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return reciept;
	}

	public Receipt selectPartReceipt(Connection conn, String orderCode) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Receipt reciept = null;

		String query = "SELECT ORDER_CODE, ORDER_DATE, MEMBER_NAME, PART_PRICE, PART_TITLE, ORDER_COUNT "
				+ "FROM ORDER_INFO "
				+ "JOIN MEMBER USING(MEMBER_ID) "
				+ "JOIN PART USING(PART_CODE) "
				+ "WHERE ORDER_CODE = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, orderCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				reciept = new Receipt(rset.getString("ORDER_CODE"), rset.getDate("ORDER_DATE"), rset.getString("MEMBER_NAME"), rset.getInt("PART_PRICE"), rset.getString("PART_TITLE"), rset.getInt("ORDER_COUNT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return reciept;
	}
}
