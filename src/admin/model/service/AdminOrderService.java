package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminOrderDao;
import admin.model.vo.AdminOrder;

public class AdminOrderService {

	public int getListCount() {

		Connection conn = getConnection();

		int result = new AdminOrderDao().getListCount(conn);

		close(conn);

		return result;
	}

	public ArrayList<AdminOrder> selectList(int currentPage) {

		Connection conn = getConnection();

		ArrayList<AdminOrder> list = new ArrayList<AdminOrder>();

		list = new AdminOrderDao().selectList(conn, currentPage);

		close(conn);

		return list;
	}

}
