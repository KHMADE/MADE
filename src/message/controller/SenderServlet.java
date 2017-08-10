package message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import message.model.service.MessageService;
import message.model.vo.Message;

/**
 * Servlet implementation class SenderServlet
 */
@WebServlet("/sender")
public class SenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SenderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userID = request.getParameter("id");
		String userPWD = request.getParameter("pwd");
		Message ms = new MessageService().selectMessage(userID, userPWD);
		if(ms != null){
			//System.out.println(member);
			HttpSession session = request.getSession();
			//System.out.println(session.getId());
			// 웹 페이지마다 값이 다름 (Map과 비슷함: key = String, value= Object)
			session.setAttribute("message", ms);
			
			response.sendRedirect("myinfo.html");
		} else {
			response.sendRedirect("404-page.jsp");
			// 파일을 직접 내보냄
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
