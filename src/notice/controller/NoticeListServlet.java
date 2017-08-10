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
response.setContentType("text/html; charset=utf-8");
		
		int currentPage = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		NoticeService nservice = new NoticeService();
		
		int listCount = nservice.getListCount();
		//System.out.println("議고쉶�맂 紐⑸줉 媛��닔 : " + listCount);
		ArrayList<Notice> list = nservice.noticeSelectList(currentPage, limit);
	
		int maxPage = (int)((double)listCount / limit + 0.9);

		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		RequestDispatcher view = null;
		if(list != null && list.size() > 0){
			view = request.getRequestDispatcher("views/notice/noticeList.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "오류");
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
