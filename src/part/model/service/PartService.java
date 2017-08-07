package part.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.util.*;

import part.model.dao.PartDAO;
import part.model.vo.Part;

public class PartService {

	public PartService() {}

	public ArrayList<Part> selectList(){
		Connection con = getConnection();
		ArrayList<Part> list = new PartDAO().selectList(con);
		close(con);
		return list;
	}
	
	public HashMap<String,Part> partMap(){
		Connection con = getConnection();
		HashMap<String,Part> list = new PartDAO().partMap(con);
		close(con);
		return list;
	}
	
	public Part partSelect(String id){
		Connection con = getConnection();
		Part part = new PartDAO().selectPartOne(con, id);
		close(con);
		return part;
	}
	
	public ArrayList<Part> selectTitle(String title){
		Connection con = getConnection();
		ArrayList<Part> list = new PartDAO().selectTitle(con, title);
		close(con);
		return list;
	}
	
	public int insertPart(Part p){
		Connection con = getConnection();
		int result = new PartDAO().insertPart(con, p);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int updatePart(Part p){
		Connection con = getConnection();
		int result = new PartDAO().updatePart(con, p);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int deletePart(String id){
		Connection con = getConnection();
		int result = new PartDAO().deletePart(con, id);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Part> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Part> list = new PartDAO().selectList(con, currentPage, limit);
		
		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new PartDAO().getListCount(con);
		close(con);
		return listCount;
	}

	public void addReadCount(String pId) {
		Connection con = getConnection();
		int result = new PartDAO().addReadCount(con, pId);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
	}

	public int likechk(String pid, String mid) {
		Connection con = getConnection();
		int chk = new PartDAO().likechk(con, pid, mid);
		close(con);

		return chk;
	}

	public int insertLike(String mid, String pid) {
		Connection con = getConnection();
		int result = new PartDAO().insertLike(con, mid, pid);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteLike(String mid, String pid) {
		Connection con = getConnection();
		int result = new PartDAO().deleteLike(con, mid, pid);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Part> selectRecent10() {
		Connection con = getConnection();
		ArrayList<Part> list = new PartDAO().selectRecent10(con);
		close(con);
		return list;
	}
}
