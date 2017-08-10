package notice.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import notice.model.vo.Notice;
import qa.model.vo.Qa;

public class NoticeDao {

	public ArrayList<Notice> selectNoticeList(Connection con, int currentPage, int limit) {
		ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "select * from (select rownum rnum, NOTICE_CODE, " 
				+ "NOTICE_TITLE, NOTICE_CONTENTS, "
				+ "NOTICE_DATE, NOTICE_IMG "
				+ "from NOTICE order by NOTICE_CODE desc) " 
				+ "where rnum >= ? and rnum <= ?";
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<Notice>();
					while (rset.next()) {				
							list.add(new Notice(
							rset.getString("NOTICE_CODE"),
							rset.getString("NOTICE_TITLE"),
							rset.getString("NOTICE_CONTENTS"),
							rset.getDate("NOTICE_DATE"),
							rset.getString("NOTICE_IMG")
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

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from NOTICE";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public int insertNotice(Connection con, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO NOTICE VALUES('NO'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_DE.NEXTVAL,2,'0'),?,?,SYSDATE,null)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContents());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Notice selectNotice(Connection con, String noticeNum) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Notice notice=null;
		String sql = "SELECT * FROM NOTICE WHERE NOTICE_CODE = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noticeNum);
			rset = pstmt.executeQuery();
			if(rset.next()){
				notice = new Notice(
						noticeNum,
						rset.getString("NOTICE_TITLE"),
						rset.getString("NOTICE_CONTENTS"),
						rset.getDate("NOTICE_DATE"),
						rset.getString("NOTICE_IMG")
						);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return notice;
	}

	public int deleteNotice(Connection con, String noticeNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from NOTICE "
				+ "where NOTICE_CODE = ?";
		
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, noticeNum);
			
			result = pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int updateNotice(Connection con, Notice no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update NOTICE "
				+ "set NOTICE_TITLE = ? , NOTICE_CONTENTS = ? "
				+ "where NOTICE_CODE = ? ";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, no.getNoticeTitle());
			pstmt.setString(2, no.getNoticeContents());
			pstmt.setString(3, no.getNoticeCode());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

}
