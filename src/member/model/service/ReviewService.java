package member.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

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

}
