package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import noticereply.model.dao.NoticeReplyDao;
import noticereply.model.vo.NoticeReply;


public class NoticeService {
	public ArrayList<Notice> qaSelectList(int currentPage, int limit){
		Connection con = getConnection();
		ArrayList<Notice> qa = new NoticeDao().selectNoticeList(con,currentPage,limit);
		close(con);
		return qa;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new NoticeDao().getListCount(con);
		close(con);
		return listCount;
	}
	public int noticeInsert(Notice n) {
		int result=0;
		Connection con = getConnection();
		result = new NoticeDao().insertNotice(con,n);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public Notice noticeSelect(String noticeNum) {
		Connection con = getConnection();
		Notice notice = new NoticeDao().selectNotice(con,noticeNum);
		close(con);
		return notice;
	}

	public int deleteNotice(String noticeNum) {
		int result=0;
		Connection con = getConnection();
		result = new NoticeDao().deleteNotice(con,noticeNum);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}
	
	public int updateNotice(Notice no) {
		int result=0;
		Connection con = getConnection();
		result = new NoticeDao().updateNotice(con,no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public ArrayList<Notice> noticeSelectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> notice = new NoticeDao().selectNoticeList(con,currentPage,limit);
		close(con);
		return notice;
	}

}
