package member.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;

import member.model.vo.Member;

public class MemberDAO {
	public MemberDAO() {}

	public Member selectMember(Connection con, String id, String pwd) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PASSWORD = ?";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member(id,rset.getString("MEMBER_CLASS_CODE"),pwd,rset.getString("MEMBER_NAME"),
						rset.getDate("MEMBER_BIRTHDAY"),rset.getString("MEMBER_EMAIL"),
						rset.getString("MEMBER_PHONE"),rset.getString("MEMBER_ADDRESS"),
						rset.getDate("MEMBER_SIGN_DATE"),rset.getString("MEMBER_PROFILE_IMG"),
						rset.getInt("MEMBER_POINT"),rset.getString("MEMBER_NICKNAME"));
			}
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int insertMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?, SYSDATE,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getClassCode());
			pstmt.setString(3, m.getPwd());
			pstmt.setString(4, m.getName());
			pstmt.setDate(5, m.getBirthday());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getAddress());
			pstmt.setString(9, m.getProfileImg());
			pstmt.setInt(10, m.getPoint());
			pstmt.setString(11, m.getNickName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET MEMBER_PASSWORD = ?, MEMBER_EMAIL = ?,"
				+ "MEMBER_PHONE = ?, MEMBER_ADDRESS = ?, MEMBER_PROFILE_IMG = ?,"
				+ " WHERE MEMBER_ID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getPwd());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getProfileImg());
			pstmt.setString(6, m.getId());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection con, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MEMBER WHERE MEMBER_ID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
