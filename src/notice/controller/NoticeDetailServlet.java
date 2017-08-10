package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;
import noticereply.model.service.NoticeReplyService;
import noticereply.model.vo.NoticeReply;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/ndetail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String noticeNum = request.getParameter("nnum");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		NoticeService nservice = new NoticeService();
		NoticeReplyService nrservice = new NoticeReplyService();
		ArrayList<NoticeReply> list = nrservice.replySelectList(noticeNum);
		Notice notice = nservice.noticeSelect(noticeNum);
		RequestDispatcher view = null;
		if(notice != null){
			view = request.getRequestDispatcher("views/notice/noticeDetail.jsp");
			request.setAttribute("notice", notice);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("list", list);
			view.forward(request, response);
			
		}else{
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "1:1 상세조회 실패!");
			view.forward(request, response);
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
