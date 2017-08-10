package noticereply.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import noticereply.model.vo.NoticeReply;

public class NoticeReplyDao {

	public ArrayList<NoticeReply> selectReplyList(Connection con, String no) {
		ArrayList<NoticeReply> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select * from NOTICE_REPLY where NOTICE_CODE = ? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<NoticeReply>();
					while (rset.next()) {				
							list.add(new NoticeReply(
							rset.getString("NOTICE_CODE"),
							rset.getString("REPLY_CODE"),
							rset.getString("MEMBER_ID"),
							rset.getString("MEMBER_IMG"),
							rset.getString("REPLY_CONTENT"),
							rset.getDate("REPLY_DATE")
							));
							
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int insertNoticeReply(Connection con, NoticeReply n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO NOTICE_REPLY VALUES(?,'NR'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_DE.NEXTVAL,2,'0'),?,?,?,SYSDATE)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeCode());
			pstmt.setString(2, n.getMemberId());
			pstmt.setString(3, n.getMemberImg());
			pstmt.setString(4, n.getReplyContent());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int updateNoticeReply(Connection con, String reviewCode, String updtContent) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE NOTICE_REPLY " + "SET REPLY_CONTENT = ? "
		+ "WHERE REPLY_CODE = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, updtContent);
			pstmt.setString(2, reviewCode);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	public int deleteNoticeReply(Connection con, String reviewCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE FROM NOTICE_REPLY WHERE REPLY_CODE = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reviewCode);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
}
