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

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/nlist")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 전체 조회 서비스 처리용 컨트롤러
		// 1. 인코딩
		response.setContentType("text/html; charset=UTF-8");
		
		ArrayList<Notice> list = new NoticeService().noticeList();
		
		if(list != null && list.size() > 0){
			// 절대경로 사용 못함
			RequestDispatcher view = request.getRequestDispatcher("views/notice/noticeListView.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
			// 얘는 페이지 주소(url)가 안 바뀜
			//response.sendRedirect("views/notice/noticeListView.jsp");
		} else {
			response.sendRedirect("views/notice/noticeError.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}