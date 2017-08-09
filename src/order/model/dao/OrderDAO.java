package order.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import order.model.vo.Order;

public class OrderDAO {
	public OrderDAO() {
	}

	public int insertPart(Connection con, String item, int quan, String mid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ORDER_INFO VALUES('OR'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_OR.NEXTVAL,2,'0'),"
				+" ?, SYSDATE, ?,0,'A',NULL,NULL,NULL,?)";
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, quan);
			pstmt.setString(3, item);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertDesign(Connection con, String code, int quan, String mid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ORDER_INFO VALUES('OR'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_OR.NEXTVAL,2,'0'),"
				+" ?, SYSDATE, ?,0,'A',NULL,NULL,?,NULL)";
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, quan);
			pstmt.setString(3, code);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
