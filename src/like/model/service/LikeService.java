package like.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import consumer.model.dao.ConsumerOrderDao;
import consumer.model.vo.ConsumerOrder;
import like.model.dao.LikeDao;
import like.model.vo.Like;

public class LikeService {

	public int getListCount(String id) {

		Connection conn = getConnection();

		int result = new LikeDao().getListCount(conn, id);

		close(conn);

		return result;
	}

	public ArrayList<Like> selectList(String id, int currentPage) {

		Connection conn = getConnection();

		ArrayList<Like> list = new LikeDao().selectList(conn, id, currentPage);

		close(conn);

		return list;
	}

}