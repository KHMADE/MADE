package noticereply.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;


import noticereply.model.dao.NoticeReplyDao;
import noticereply.model.vo.NoticeReply;


public class NoticeReplyService {
	public ArrayList<NoticeReply> replySelectList(String no){
		Connection con = getConnection();
		ArrayList<NoticeReply> noticeReply = new NoticeReplyDao().selectReplyList(con,no);
		close(con);
		return noticeReply;
	}


	public int replyInsert(NoticeReply n) {
		int result=0;
		Connection con = getConnection();
		result = new NoticeReplyDao().insertNoticeReply(con,n);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}


	public Object updateNoticeReply(String reviewCode, String updtContent) {
		Connection con = getConnection();
		int result = new NoticeReplyDao().updateNoticeReply(con, reviewCode, updtContent);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Object deleteNoticeReply(String reviewCode) {
		Connection con = getConnection();
		int result = new NoticeReplyDao().deleteNoticeReply(con, reviewCode);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
}
