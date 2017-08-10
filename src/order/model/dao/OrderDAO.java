package order.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

import order.model.vo.Order;
import order.model.vo.OrderStat;

public class OrderDAO {
	public OrderDAO() {
	}

	public int insertPart(Connection con, String item, int quan, String mid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ORDER_INFO VALUES('OR'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_OR.NEXTVAL,2,'0'),"
				+" ?, SYSDATE, ?,0,'A',NULL,NULL,NULL,?)";
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, quan);
			pstmt.setString(3, item);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertDesign(Connection con, String code, int quan, String mid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ORDER_INFO VALUES('OR'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_OR.NEXTVAL,2,'0'),"
				+" ?, SYSDATE, ?,0,'A',NULL,NULL,?,NULL)";
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, quan);
			pstmt.setString(3, code);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<OrderStat> selectOrderList(Connection con) {
		ArrayList<OrderStat> olist = new ArrayList<OrderStat>();
		SimpleDateFormat df = new SimpleDateFormat("dd-MMM-YY", Locale.ENGLISH);
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM(SELECT ORDER_DATE, SUM(DESIGN_PRICE)  FROM ORDER_INFO"
				+ " JOIN DESIGN USING(DESIGN_CODE)"
				+ " WHERE MONTHS_BETWEEN(SYSDATE,ORDER_DATE) < 5"
				+ " GROUP BY SUBSTR(ORDER_DATE,1,5),ORDER_DATE order by 1 desc) where rownum < 5 order by 1";
		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(sql);
			if(rset != null){
				while(rset.next()){
					olist.add(new OrderStat(df.format(rset.getDate(1)), rset.getInt(2)));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return olist;
	}
	
	public ArrayList<OrderStat> selectOrderList(Connection con, String mid) {
		ArrayList<OrderStat> olist = new ArrayList<OrderStat>();
		SimpleDateFormat df = new SimpleDateFormat("dd-MMM-YY", Locale.ENGLISH);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM(SELECT ORDER_DATE, SUM(DESIGN_PRICE)  FROM ORDER_INFO"
				+ " JOIN DESIGN USING(DESIGN_CODE)"
				+ " WHERE DESIGN.MEMBER_ID = ?"
				+ " AND MONTHS_BETWEEN(SYSDATE,ORDER_DATE) < 5"
				+ " GROUP BY SUBSTR(ORDER_DATE,1,5),ORDER_DATE order by 1 desc) where rownum < 5 order by 1";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);

			rset = pstmt.executeQuery();
			if(rset != null){
				while(rset.next()){
					olist.add(new OrderStat(df.format(rset.getDate(1)), rset.getInt(2)));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return olist;
	}
	
	public ArrayList<OrderStat> selectTopitemList(Connection con) {
		ArrayList<OrderStat> toplist = new ArrayList<OrderStat>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM (SELECT DESIGN_TITLE, COUNT(*) FROM ORDER_INFO"
				+ " JOIN DESIGN USING(DESIGN_CODE)"
				+ " WHERE MONTHS_BETWEEN(SYSDATE,ORDER_DATE) < 4"
				+ " GROUP BY DESIGN_TITLE, SUBSTR(ORDER_DATE,1,5) ORDER BY 2) WHERE ROWNUM < 8";
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset != null){
				while(rset.next()){
					toplist.add(new OrderStat(rset.getString(1), rset.getInt(2)));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return toplist;
	}
	
	public ArrayList<OrderStat> selectTopitemList(Connection con, String mid) {
		ArrayList<OrderStat> toplist = new ArrayList<OrderStat>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM (SELECT DESIGN_TITLE, COUNT(*) FROM ORDER_INFO"
				+ " JOIN DESIGN USING(DESIGN_CODE)"
				+ " WHERE MONTHS_BETWEEN(SYSDATE,ORDER_DATE) < 4"
				+ " AND DESIGN.MEMBER_ID = ? "
				+ " GROUP BY DESIGN_TITLE, SUBSTR(ORDER_DATE,1,5) ORDER BY 2) WHERE ROWNUM < 8";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);

			rset = pstmt.executeQuery();
			if(rset != null){
				while(rset.next()){
					toplist.add(new OrderStat(rset.getString(1), rset.getInt(2)));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return toplist;
	}

	public ArrayList<OrderStat> selectPurList(Connection con) {
		ArrayList<OrderStat> purlist = new ArrayList<OrderStat>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM (SELECT DESIGN_TITLE, COUNT(*) FROM ORDER_INFO"
				+ " JOIN DESIGN USING(DESIGN_CODE)"
				+ " WHERE MONTHS_BETWEEN(SYSDATE,ORDER_DATE) < 4"
				+ " GROUP BY DESIGN_TITLE ORDER BY 2) WHERE ROWNUM < 8";
		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(sql);
			if(rset != null){
				while(rset.next()){
					purlist.add(new OrderStat(rset.getString(1), rset.getInt(2)));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return purlist;
	}

	public ArrayList<OrderStat> selectPurList(Connection con, String mid) {
		ArrayList<OrderStat> purlist = new ArrayList<OrderStat>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM (SELECT DESIGN_TITLE, COUNT(*) FROM ORDER_INFO"
				+ " JOIN DESIGN USING(DESIGN_CODE)"
				+ " WHERE MONTHS_BETWEEN(SYSDATE,ORDER_DATE) < 4"
				+ " AND DESIGN.MEMBER_ID = ?"
				+ " GROUP BY DESIGN_TITLE ORDER BY 2) WHERE ROWNUM < 8";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);

			rset = pstmt.executeQuery();
			if(rset != null){
				while(rset.next()){
					purlist.add(new OrderStat(rset.getString(1), rset.getInt(2)));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return purlist;
	}

	public ArrayList<OrderStat> yearProfit(Connection con) {
		ArrayList<OrderStat> yearProfit = new ArrayList<OrderStat>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM (SELECT SUBSTR(ORDER_DATE,1,5), COUNT(*), SUM(DESIGN_PRICE) FROM ORDER_INFO"
				+ " JOIN DESIGN USING(DESIGN_CODE)"
				+ " GROUP BY SUBSTR(ORDER_DATE,1,5)) WHERE rownum < 6";
		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(sql);
			if(rset != null){
				while(rset.next()){
					yearProfit.add(new OrderStat(rset.getString(1), rset.getInt(2), rset.getInt(3)));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return yearProfit;
	}
	
	public ArrayList<OrderStat> yearProfit(Connection con, String mid) {
		ArrayList<OrderStat> yearProfit = new ArrayList<OrderStat>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM (SELECT SUBSTR(ORDER_DATE,1,5), COUNT(*), SUM(DESIGN_PRICE) FROM ORDER_INFO"
				+ " JOIN DESIGN USING(DESIGN_CODE)"
				+ " WHERE DESIGN.MEMBER_ID = ? "
				+ " GROUP BY SUBSTR(ORDER_DATE,1,5)) WHERE rownum < 6";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);

			rset = pstmt.executeQuery();
			if(rset != null){
				while(rset.next()){
					yearProfit.add(new OrderStat(rset.getString(1), rset.getInt(2), rset.getInt(3)));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return yearProfit;
	}
}
