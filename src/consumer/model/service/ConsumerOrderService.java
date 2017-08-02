package consumer.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import consumer.model.dao.ConsumerOrderDao;
import consumer.model.vo.ConsumerOrder;

public class ConsumerOrderService {

	public int getListCount() {

		Connection conn = getConnection();

		int result = new ConsumerOrderDao().getListCount(conn);

		close(conn);

		return result;
	}

	public ArrayList<ConsumerOrder> selectList(int currentPage) {

		Connection conn = getConnection();

		ArrayList<ConsumerOrder> list = new ConsumerOrderDao().selectList(conn, currentPage);

		close(conn);

		return list;
	}

}
