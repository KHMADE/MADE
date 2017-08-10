package order.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import order.model.dao.OrderDAO;
import order.model.vo.Order;
import order.model.vo.OrderStat;
import part.model.dao.PartDAO;

public class OrderService {
	
	public OrderService() {}

	public int insertPart(String code, int quan, String mid) {
		Connection con = getConnection();
		int result = new OrderDAO().insertPart(con, code, quan, mid);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int insertDesign(String code, int quan, String mid) {
		Connection con = getConnection();
		int result = new OrderDAO().insertDesign(con, code, quan, mid);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<OrderStat> selectOrderList() {
		Connection con = getConnection();
		ArrayList<OrderStat> olist = new OrderDAO().selectOrderList(con);
		close(con);
		return olist;
	}
	
	public ArrayList<OrderStat> selectOrderList(String mid) {
		Connection con = getConnection();
		ArrayList<OrderStat> olist = new OrderDAO().selectOrderList(con, mid);

		close(con);
		return olist;
	}

	public ArrayList<OrderStat> selectTopitemList() {
		Connection con = getConnection();
		ArrayList<OrderStat> toplist = new OrderDAO().selectTopitemList(con);
		close(con);
		return toplist;
	}

	public ArrayList<OrderStat> selectTopitemList(String mid) {
		Connection con = getConnection();
		ArrayList<OrderStat> toplist = new OrderDAO().selectTopitemList(con, mid);
		close(con);
		return toplist;
	}

	public ArrayList<OrderStat> selectPurList() {
		Connection con = getConnection();
		ArrayList<OrderStat> purlist = new OrderDAO().selectPurList(con);
		close(con);
		return purlist;
	}

	public ArrayList<OrderStat> selectPurList(String mid) {
		Connection con = getConnection();
		ArrayList<OrderStat> purlist = new OrderDAO().selectPurList(con, mid);
		close(con);
		return purlist;
	}

	public ArrayList<OrderStat> yearProfit() {
		Connection con = getConnection();
		ArrayList<OrderStat> yearProfit = new OrderDAO().yearProfit(con);
		close(con);
		return yearProfit;
	}
	
	public ArrayList<OrderStat> yearProfit(String mid) {
		Connection con = getConnection();
		ArrayList<OrderStat> yearProfit = new OrderDAO().yearProfit(con, mid);
		close(con);
		return yearProfit;
	}
}
