package notice.model.dao;

import java.sql.*;
import java.util.*;

import static common.JDBCTemplate.*;
import java.sql.*;
import notice.model.dao.*;
import notice.model.vo.*;

public class NoticeDAO {
	public NoticeDAO() {}

	public ArrayList<Notice> noticeList(Connection con) {
		ArrayList<Notice> noticeList = null;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM NOTICE ORDER BY NOTICE_DATE DESC";
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset != null){
				 noticeList = new ArrayList<Notice>();
				while(rset.next()){
					noticeList.add(new Notice(rset.getInt("NOTICE_NO"),
							rset.getString("NOTICE_TITLE"),
							rset.getString("NOTICE_WRITER"),
							rset.getDate("NOTICE_DATE"),
							rset.getString("NOTICE_CONTENT"),
							rset.getString("FILE_PATH")));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return noticeList;
	}
	
	public HashMap<Integer,Notice> noticeMap(Connection con) {
		HashMap<Integer,Notice> noticeMap = null;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM NOTICE ORDER BY NOTICE_DATE DESC";
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset != null){
				noticeMap = new HashMap<Integer,Notice>();
				while(rset.next()){
					/*Notice notice = new Notice(rset.getInt("NOTICE_NO"),
							rset.getString("NOTICE_TITLE"),
							rset.getString("NOTICE_WRITER"),
							rset.getDate("NOTICE_DATE"),
							rset.getString("NOTICE_CONTENT"),
							rset.getString("FILE_PATH"));
					// -------------------------- //
					noticeMap.put(notice.getNoticeNo(), notice);*/
					noticeMap.put(rset.getInt("NOTICE_NO"), 
							new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
									rset.getString("NOTICE_WRITER"),
									rset.getDate("NOTICE_DATE"),
									rset.getString("NOTICE_CONTENT"),
									rset.getString("FILE_PATH")));
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return noticeMap;
	}
	
	public Notice selectOne(Connection con, int no) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM NOTICE WHERE NOTICE_NO = ?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			if(rset.next()){
				notice = new Notice(no,
						rset.getString("NOTICE_TITLE"),
						rset.getString("NOTICE_WRITER"),
						rset.getDate("NOTICE_DATE"),
						rset.getString("NOTICE_CONTENT"),
						rset.getString("FILE_PATH"));
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return notice;
	}
	
	public ArrayList<Notice> selectTitle(Connection con, String title){
		ArrayList<Notice> noticeList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM NOTICE WHERE NOTICE_TITLE LIKE ? ORDER BY NOTICE_DATE DESC";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%||"+title+"||%");
			rset = pstmt.executeQuery();
			if(rset != null){
				 noticeList = new ArrayList<Notice>();
				while(rset.next()){
					Notice notice = new Notice(rset.getInt("NOTICE_NO"),
							rset.getString("NOTICE_TITLE"),
							rset.getString("NOTICE_WRITER"),
							rset.getDate("NOTICE_DATE"),
							rset.getString("NOTICE_CONTENT"),
							rset.getString("FILE_PATH"));
					noticeList.add(notice);
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return noticeList;
	}
	
	public int insertNotice(Connection con, Notice n){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO NOTICE VALUES(SEQ_NOTICE.NEXTVAL, ?, ?, SYSDATE, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeWriter());
			pstmt.setString(3, n.getNoticeContent());
			pstmt.setString(4, n.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
	
	public int updateNotice(Connection con, Notice n){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE NOTICE SET NOTICE_TITLE = ?, NOTICE_CONTENT = ?, "
				+ "FILE_PATH = ? WHERE NOTICE_NO = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getFilePath());
			pstmt.setInt(4, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
	
	public int deleteNotice(Connection con, int noticeNo){
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM NOTICE WHERE NOTICE_NO = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
}