package member.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import design.model.dao.DesignDAO;
import member.model.vo.*;
import member.model.dao.*;

public class ReviewService {
	public ReviewService() {}

	public ArrayList<ItemReview> selectDesignReview(String dId) {
		Connection con = getConnection();
		ArrayList<ItemReview> rvwlist = new ReviewDAO().selectDesignReview(con, dId);
		close(con);
		return rvwlist;
	}
	
	public int insertDesignReview(String dId, String mid, String content) {
		Connection con = getConnection();
		int result = new ReviewDAO().insertDesignReview(con, dId, mid, content);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Object updateDesignReview(String reviewCode, String updtContent) {
		Connection con = getConnection();
		int result = new ReviewDAO().updateDesignReview(con, reviewCode, updtContent);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Object deleteDesignReview(String reviewCode) {
		Connection con = getConnection();
		int result = new ReviewDAO().deleteDesignReview(con, reviewCode);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public ArrayList<ItemReview> selectPartReview(String pId) {
		Connection con = getConnection();
		ArrayList<ItemReview> rvwlist = new ReviewDAO().selectPartReview(con, pId);
		close(con);
		return rvwlist;
	}

	public int insertPartReview(String pId, String mid, String content) {
		Connection con = getConnection();
		int result = new ReviewDAO().insertPartReview(con, pId, mid, content);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Object updatePartReview(String reviewCode, String updtContent) {
		Connection con = getConnection();
		int result = new ReviewDAO().updatePartReview(con, reviewCode, updtContent);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Object deletePartReview(String reviewCode) {
		Connection con = getConnection();
		int result = new ReviewDAO().deletePartReview(con, reviewCode);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
}
