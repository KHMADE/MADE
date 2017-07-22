package notice.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;
import notice.model.dao.*;
import notice.model.vo.*;

public class NoticeService {
	public NoticeService() {}
	
	public ArrayList<Notice> noticeList(){
		Connection con = getConnection();
		ArrayList<Notice> noList = new NoticeDAO().noticeList(con);
		close(con);
		return noList;
	}
	
	public HashMap<Integer,Notice> noticeMap(){
		Connection con = getConnection();
		HashMap<Integer,Notice> noList = new NoticeDAO().noticeMap(con);
		close(con);
		return noList;
	}
	
	public Notice noticeSelect(int no){
		Connection con = getConnection();
		Notice notice = new NoticeDAO().selectOne(con,no);
		close(con);
		return notice;
	}
	
	public ArrayList<Notice> selectTitle(String title){
		Connection con = getConnection();
		ArrayList<Notice> noList = new NoticeDAO().selectTitle(con, title);
		close(con);
		return noList;
	}
	
	public int insertNotice(Notice n){
		Connection con = getConnection();
		int result = new NoticeDAO().insertNotice(con, n);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int updateNotice(Notice n){
		Connection con = getConnection();
		int result = new NoticeDAO().updateNotice(con, n);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int deleteNotice(int noticeNo){
		Connection con = getConnection();
		int result = new NoticeDAO().deleteNotice(con, noticeNo);
		if(result > 0){
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
}
