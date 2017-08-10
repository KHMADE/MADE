package designer.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import designer.model.dao.DesignerOrderDao;
import designer.model.vo.DesignerOrder;

public class DesignerOrderService {

	public int getListCount(String id) {

		Connection conn = getConnection();

		int result = new DesignerOrderDao().getListCount(conn, id);

		close(conn);

		return result;
	}

	public ArrayList<DesignerOrder> selectList(String id, int currentPage) {

		Connection conn = getConnection();

		ArrayList<DesignerOrder> list = new ArrayList<DesignerOrder>();

		list = new DesignerOrderDao().selectList(conn, id, currentPage);

		close(conn);

		return list;
	}

}
