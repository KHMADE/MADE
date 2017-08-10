package message.model.dao;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;

import message.model.vo.Message;
import notice.model.vo.Notice;

public class MessageDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rset;
	
	public MessageDao(){}

	public Message selectMessage(Connection con, String id) {
		Message message = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT * FROM MESSAGE" /* WHERE MESSAGE_CODE = ? AND MESSAGE_PASSWORD = ?"*/;
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				message = new Message(
						rset.getString("message_code"),
						rset.getString("message_title"),
						rset.getString("message_sender_id"),
						rset.getString("message_recipient_id"),
						rset.getString("message_contents"),
						rset.getDate("message_date"));
				
				/*id,rset.getString("message_code"),
				pwd,rset.getString("message_title"),
				rset.getString("message_sender_id"),
				rset.getString("message_recipient_id"),
				rset.getString("message_contents"),
				rset.getDate("message_date"))*/
						
			}
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return message;
	}

	public int insertMessage(Connection con, Message m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MESSAGE VALUES(?,?,?,?,?, SYSDATE,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getMessageCode());
			pstmt.setString(2, m.getMessageTitle());
			pstmt.setString(3, m.getMessageSenderId());
			pstmt.setString(4, m.getMessageRecipientId());
			pstmt.setString(5, m.getMessageContents());
			pstmt.setDate(6, m.getMessageDate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMessage(Connection con, Message m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MESSAGE SET  MESSAGE_TITLE = ?,"
				+ "MESSAGE_RECIPIENT_ID = ?, MESSAGE_CONTENTS = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getMessageTitle());
			pstmt.setString(2, m.getMessageRecipientId());
			pstmt.setString(3, m.getMessageContents());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMessage(Connection con, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MESSAGE WHERE MESSAGE_CODE = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Message> selectList(Connection con, int currentPage, int limit) {
		// 페이지 단위로 게시글 목록 조회용 메소드

		
				ArrayList<Message> list = null;
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				/*	MESSAGE_CODE
				MESSAGE_TITLE
				MESSAGE_SENDER_ID
				MESSAGE_RECIPIENT_ID
				MESSAGE_CONTENTS
				MESSAGE_DATE*/
				String query = "select * from " 
						+ "(select rownum rnum, "
						+ "MESSAGE_CODE, " 
						+ "MESSAGE_TITLE, "
						+ "MESSAGE_SENDER_ID, "
						+ "MESSAGE_RECIPIENT_ID, "
						+ "MESSAGE_CONTENTS, "
						+ "MESSAGE_DATE "
						+ "from (select * from message " 
						+ "order by MESSAGE_DATE desc, MESSAGE_CONTENTS desc, "
						+ "MESSAGE_RECIPIENT_ID asc, MESSAGE_SENDER_ID asc)) " 
						+ "where rnum >= ? and rnum <= ?";

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				try {
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);

					rset = pstmt.executeQuery();
					if (rset != null) {
						list = new ArrayList<Message>();
						while (rset.next()) {
							list.add(new Message(
									rset.getString("MESSAGE_CODE"),
									rset.getString("MESSAGE_TITLE"),
									rset.getString("MESSAGE_SENDER_ID"),
									rset.getString("MESSAGE_RECIPIENT_ID"),
									rset.getString("MESSAGE_CONTENTS")
									));
//							Message m = new Message();
//							m.setMessageCode(rset.getString("MESSAGE_CODE"));
//							m.setMessageTitle(rset.getString("MESSAGE_TITLE"));
//							m.setMessageSenderId(rset.getString("MESSAGE_SENDER_ID"));
//							m.setMessageRecipientId(rset.getString("MESSAGE_RECIPIENT_ID"));
//							m.setMessageContents(rset.getString("MESSAGE_CONTENTS"));
//							
//
//							list.add(m);
						}
					}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}

				return list;
	}

	public int getListCount(Connection con) {
		
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select count(*) from message";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
				// select 절의 첫번째 항목을 뜻함
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public ArrayList<Message> selectList(Connection con, int currentPage, int limit, String mid) {
		ArrayList<Message> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		/*	MESSAGE_CODE
		MESSAGE_TITLE
		MESSAGE_SENDER_ID
		MESSAGE_RECIPIENT_ID
		MESSAGE_CONTENTS
		MESSAGE_DATE*/
		String query = "select * from " 
				+ "(select rownum rnum, "
				+ "MESSAGE_CODE, " 
				+ "MESSAGE_TITLE, "
				+ "MESSAGE_SENDER_ID, "
				+ "MESSAGE_RECIPIENT_ID, "
				+ "MESSAGE_CONTENTS, "
				+ "MESSAGE_DATE "
				+ "from (select * from message WHERE MESSAGE_RECIPIENT_ID = ?" 
				+ "order by MESSAGE_DATE desc, MESSAGE_CONTENTS desc, "
				+ "MESSAGE_RECIPIENT_ID asc, MESSAGE_SENDER_ID asc)) " 
				+ "where rnum >= ? and rnum <= ?";

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<Message>();
				while (rset.next()) {
					list.add(new Message(
							rset.getString("MESSAGE_CODE"),
							rset.getString("MESSAGE_TITLE"),
							rset.getString("MESSAGE_SENDER_ID"),
							rset.getString("MESSAGE_RECIPIENT_ID"),
							rset.getString("MESSAGE_CONTENTS")
							));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}



	

	public ArrayList<Message> search(String messageRecipientId) {
		
		String SQL = "select * from message where message_sender_id like ?";
		ArrayList<Message> messageList = new ArrayList<Message>();
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, "%" + messageRecipientId + "%" );
			rset = pstmt.executeQuery();
			while(rset.next()){
				Message message = new Message();
				message.setMessageRecipientId(rset.getString(1));
				message.setMessageSenderId(rset.getString(2));
				message.setMessageTitle(rset.getString(3));
				messageList.add(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return messageList;
	}
//위에 코드는 AJAX 하려다 막힘 못함 

}
