package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateViewServlet
 */
@WebServlet("/nupview")
public class NoticeUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		// 게시글 상세보기 처리용

		String noticeNum = request.getParameter("nnum");
		int currentPage = Integer.parseInt(request.getParameter("page"));
				
		NoticeService nservice = new NoticeService();

		Notice notice = nservice.noticeSelect(noticeNum);
		
		RequestDispatcher view = null;
		if(notice != null){
			view = request.getRequestDispatcher("views/notice/noticeUpdate.jsp");
			request.setAttribute("notice", notice);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "게시글 상세조회 실패!");
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
