package order.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import order.model.dao.OrderDAO;
import part.model.dao.PartDAO;

public class OrderService {
	
	public OrderService() {}

	public int insertPart(String code, int quan, String mid) {
		Connection con = getConnection();
		int result = new OrderDAO().insertPart(con, code, quan, mid);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int insertDesign(String code, int quan, String mid) {
		Connection con = getConnection();
		int result = new OrderDAO().insertDesign(con, code, quan, mid);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
