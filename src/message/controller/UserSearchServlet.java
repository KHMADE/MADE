package message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import message.model.dao.MessageDao;
import message.model.vo.Message;

@WebServlet("/users")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			String userName = request.getParameter("messageCode");
			response.getWriter().write(getJSON(userName));
			
			
	}
	public String getJSON(String messageRecipientId){
		if(messageRecipientId == null) messageRecipientId = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		MessageDao mdao = new MessageDao();
		ArrayList<Message> messageList = mdao.search(messageRecipientId);
		for(int i = 0; i < messageList.size(); i++){
			result.append("[{\"value\":\"" + messageList.get(i).getMessageSenderId()+"\"},");
			result.append("{\"value\":\"" + messageList.get(i).getMessageRecipientId()+"\"},");
			result.append("{\"value\":\"" + messageList.get(i).getMessageTitle()+"\"},");
			result.append("{\"value\":\"" + messageList.get(i).getMessageDate()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
}
