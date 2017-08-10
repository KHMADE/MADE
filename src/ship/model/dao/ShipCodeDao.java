package ship.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ShipCodeDao {

	public int insertShipCode(Connection conn, String orderCode, String company, String shipCode) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "UPDATE ORDER_INFO "
				+ "SET ORDER_SHIP_CODE = ?, "
				+ "SHIP_COMPANY_NAME = ? "
				+ "WHERE ORDER_CODE = ? ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, shipCode);
			pstmt.setString(2, company);
			pstmt.setString(3, orderCode);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
