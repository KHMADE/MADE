package member.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import member.model.vo.*;
import member.model.service.*;

public class ReviewDAO {

	public ReviewDAO() {}

	public ArrayList<ItemReview> selectDesignReview(Connection con, String dId) {
		ArrayList<ItemReview> reviewlist = new ArrayList<ItemReview>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = "SELECT * FROM VW_ITEM_REVIEW WHERE DESIGN_CODE = ? ";
/*
 * CREATE OR REPLACE VIEW VW_ITEM_REVIEW AS
SELECT REVIEW_CODE,MEMBER_ID,MEMBER_PROFILE_IMG,PART_CODE,DESIGN_CODE,REVIEW_CONTENT,REVIEW_DATE  FROM MEMBER
JOIN ITEM_REVIEW USING(MEMBER_ID) ORDER BY REVIEW_DATE DESC;
*/
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dId);
			rset = pstmt.executeQuery();

			if (rset != null) {
				while(rset.next()){
					reviewlist.add(new ItemReview(rset.getString("REVIEW_CODE"),
							rset.getString("PART_CODE"),rset.getString("DESIGN_CODE"),
							rset.getString("MEMBER_ID"),rset.getString("MEMBER_PROFILE_IMG"),
							rset.getString("REVIEW_CONTENT"), rset.getDate("REVIEW_DATE")));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reviewlist;
	}
}
