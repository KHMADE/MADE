package qa.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import qa.model.dao.QaDao;
import qa.model.vo.Qa;



public class QaService {

	public ArrayList<Qa> qaSelectList(int currentPage, int limit){
		Connection con = getConnection();
		ArrayList<Qa> qa = new QaDao().selectQaList(con,currentPage,limit);
		close(con);
		return qa;
	}
	
	public ArrayList<Qa> qaMemberSelectList(String member, int currentPage, int limit){
		Connection con = getConnection();
		ArrayList<Qa> qa = new QaDao().selectMemberQaList(con,member,currentPage,limit);
		close(con);
		return qa;
	}
	
	public Qa qaSelect(String no) {
		Connection con = getConnection();
		Qa qa = new QaDao().selectQa(con,no);
		close(con);
		return qa;
	}
	public int qaInsert(Qa qa) {
		int result=0;
		Connection con = getConnection();
		result = new QaDao().insertQa(con,qa);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new QaDao().getListCount(con);
		close(con);
		return listCount;
	}
	public int getMemberListCount(String member) {
		Connection con = getConnection();
		int listCount = new QaDao().getMemberListCount(con,member);
		close(con);
		return listCount;
		
	}
	public int qaAnswerUpdate(String qaNum ,String answer) {
		int result=0;
		Connection con = getConnection();
		result = new QaDao().updateQaAnswer(con,qaNum,answer);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
}
