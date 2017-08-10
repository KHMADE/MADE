package ship.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import ship.model.dao.ShipCodeDao;

public class ShipCodeService {

	public int insertShipCode(String orderCode, String company, String shipCode) {
		Connection conn = getConnection();
		int result = new ShipCodeDao().insertShipCode(conn, orderCode, company, shipCode);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		System.out.println("7");
		return result;
	}

}
