package message.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import message.model.dao.*;
import message.model.vo.Message;

public class MessageService {
	public MessageService(){}
/*	
	public Message selectMessage(String id, String userPWD){
		Connection con = getConnection();
		Message loginMessage = new MessageDao().selectMessage(con, id);
		close(con);
		return loginMessage;
	}
*/

	public int updateMessage(Message m) {
		Connection con = getConnection();
		int result = new MessageDao().updateMessage(con, m);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}

	public int deleteMessage(String userid) {
		Connection con = getConnection();
		int result = new MessageDao().deleteMessage(con, userid);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
		}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new MessageDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<Message> selectListAll(int currentPage, int limit, String mid) {
		Connection con = getConnection();
		ArrayList<Message> list = 
				new MessageDao().selectListAll(con, 
						currentPage, limit, mid);
		close(con);
		return list;
	}
	
	public ArrayList<Message> selectListRecv(int currentPage, int limit, String mid) {
		Connection con = getConnection();
		ArrayList<Message> list = 
				new MessageDao().selectListRecv(con, 
						currentPage, limit, mid);
		close(con);
		return list;
	}
	
	public ArrayList<Message> selectListSend(int currentPage, int limit, String mid) {
		Connection con = getConnection();
		ArrayList<Message> list = 
				new MessageDao().selectListSend(con, 
						currentPage, limit, mid);
		close(con);
		return list;
	}

	public ArrayList<Message> selectMyNote(int currentPage, int limit, String mid) {
		Connection con = getConnection();
		ArrayList<Message> list = 
				new MessageDao().selectMyNote(con, 
						currentPage, limit, mid);
		close(con);
		return list;
	}

	public ArrayList<Message> keepList(int currentPage, int limit, String mid) {
		Connection con = getConnection();
		ArrayList<Message> list = 
				new MessageDao().keepList(con, 
						currentPage, limit, mid);
		close(con);
		return list;
	}

	public int MessageInsert(Message m) {
		Connection con = getConnection();
		int result = new MessageDao().insertMessage(con, m);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}

	public Message selectOne(String messageName) {
		Connection con = getConnection();
		Message me = new MessageDao().selectMessage(con, messageName);
		close(con);
		return me;
	}

	public int deleteNote(String noteNum) {
		Connection con = getConnection();
		int result = new MessageDao().deleteMessage(con, noteNum);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}


}
