package message.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import message.model.dao.*;
import message.model.vo.Message;

public class MessageService {
	public MessageService(){}
	
	public Message selectMessage(String id, String userPWD){
		Connection con = getConnection();
		Message loginMessage = new MessageDao().selectMessage(con, id);
		close(con);
		return loginMessage;
	}

	public int insertMessage(Message m) {
		Connection con = getConnection();
		int result = new MessageDao().insertMessage(con, m);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}

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

	public ArrayList<Message> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Message> list = 
				new MessageDao().selectList(con, 
						currentPage, limit);
		close(con);
		return list;
	}

	public ArrayList<Message> selectList(int currentPage, int limit, String mid) {
		Connection con = getConnection();
		ArrayList<Message> list = 
				new MessageDao().selectList(con, 
						currentPage, limit, mid);
		close(con);
		return list;
	}

	public Message selectOne(String messageName) {
		Connection con = getConnection();
		Message m = new MessageDao().selectMessage(con, messageName);
		close(con);
		return m;
	}

	


}
