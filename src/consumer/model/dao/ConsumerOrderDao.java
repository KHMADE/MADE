package consumer.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import consumer.model.vo.ConsumerOrder;

public class ConsumerOrderDao {

	public ArrayList<ConsumerOrder> selectList(Connection conn, int currentPage) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ConsumerOrder> list = null;
		
		
		String query = "SELECT * "
				+ "FROM (SELECT ROWNUM RNUM, A.* "
				+ "      FROM (SELECT * "
				+ "            FROM ORDER_INFO "
				+ "            ORDER BY ORDER_DATE DESC) A) "
				+ "WHERE RNUM >= ? AND RNUM <= ?";
		
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = startRow + 10 - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				ConsumerOrder conumerOrder = new ConsumerOrder();

				list.add(conumerOrder);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

}
