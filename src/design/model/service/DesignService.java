package design.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import design.model.dao.DesignDAO;
import design.model.vo.Design;

public class DesignService {

	public DesignService() {
	}

	// 부품 가격 출력
	public int designPartPrice(String id) {
		Connection con = getConnection();
		int price = new DesignDAO().designPartPrice(con, id);
		close(con);
		return price;
	}

	public ArrayList<Design> selectList() {
		Connection con = getConnection();
		ArrayList<Design> list = new DesignDAO().designList(con);
		close(con);
		return list;
	}

	public HashMap<String, Design> designMap() {
		Connection con = getConnection();
		HashMap<String, Design> list = new DesignDAO().designMap(con);
		close(con);
		return list;
	}

	public Design designSelect(String id) {
		Connection con = getConnection();
		Design design = new DesignDAO().selectOne(con, id);
		close(con);
		return design;
	}

	public ArrayList<Design> selectTitle(String title) {
		Connection con = getConnection();
		ArrayList<Design> list = new DesignDAO().selectTitle(con, title);
		close(con);
		return list;
	}

	public int insertDesign(Design d) {
		Connection con = getConnection();
		int result = new DesignDAO().insertDesign(con, d);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int updateDesign(Design d) {
		Connection con = getConnection();
		int result = new DesignDAO().updateDesign(con, d);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteDesign(String id) {
		Connection con = getConnection();
		int result = new DesignDAO().deleteDesign(con, id);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Design> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Design> list = new DesignDAO().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new DesignDAO().getListCount(con);
		close(con);
		return listCount;
	}

	public void addReadCount(String dId) {
		Connection con = getConnection();
		int result = new DesignDAO().addReadCount(con, dId);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
	}

	/**
	 * @return
	 */
	public ArrayList<Design> selectTop5() {
		Connection con = getConnection();
		ArrayList<Design> list = new DesignDAO().designTop5(con);
		close(con);
		return list;
	}
}
