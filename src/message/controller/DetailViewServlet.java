package message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import message.model.service.MessageService;
import message.model.vo.Message;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class DetailViewServlet
 */
@WebServlet("/dtail")
public class DetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 상세보기 처리용 컨트롤러
				response.setContentType("text/html; charset=utf-8");
				String messageName = (String)(request.getParameter("no"));
				Message message = new MessageService().selectOne(messageName);
				if(message != null){
					RequestDispatcher view = request.getRequestDispatcher("views/message/detailView.jsp");
					request.setAttribute("message", message);
					view.forward(request, response);
				}else{
					response.sendRedirect("404-page.jsp");
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
