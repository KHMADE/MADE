package order.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import order.model.dao.OrderDAO;
import part.model.dao.PartDAO;

public class OrderService {
	
	public OrderService() {}

	public int insertPart(String item, int quan, String mid) {
		Connection con = getConnection();
		int result = new OrderDAO().insertPart(con, item, quan, mid);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
