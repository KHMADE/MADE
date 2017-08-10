package qa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.service.QaService;
import qa.model.vo.Qa;

/**
 * Servlet implementation class QaMemberListServlet
 */
@WebServlet("/qmlist")
public class QaMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		int limit = 10;
		String member = null;
			currentPage = Integer.parseInt(request.getParameter("page"));
			member=request.getParameter("member");
		QaService qservice = new QaService();
		int listCount = qservice.getMemberListCount(member);
		ArrayList<Qa> list = qservice.qaMemberSelectList(member, currentPage, limit);
		int maxPage = (int)((double)listCount / limit + 0.9);
		System.out.println(member);
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		RequestDispatcher view = null;
		if(list != null && list.size() > 0){
			view = request.getRequestDispatcher("views/qa/qaMemberList.jsp");
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
