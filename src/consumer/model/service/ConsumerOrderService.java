package consumer.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import consumer.model.dao.ConsumerOrderDao;
import consumer.model.vo.ConsumerOrder;

public class ConsumerOrderService {

	public ArrayList<ConsumerOrder> selectList(int currentPage) {
		
		Connection conn = getConnection();
		
		ArrayList<ConsumerOrder> list = new ConsumerOrderDao().selectList(conn, currentPage);
		
		close(conn);
		
		return list;
	}

}
