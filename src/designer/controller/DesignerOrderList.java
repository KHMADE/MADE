package designer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import designer.model.service.DesignerOrderService;
import designer.model.vo.DesignerOrder;
import member.model.vo.Member;

/**
 * Servlet implementation class DesignerOrderList
 */
@WebServlet("/dorderlist")
public class DesignerOrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignerOrderList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		int currentPage = 1;

		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		DesignerOrderService designerOrderService = new DesignerOrderService();

		String id = ((Member) request.getSession().getAttribute("member")).getId();
		
		int listCount = designerOrderService.getListCount(id);
		
		ArrayList<DesignerOrder> list = designerOrderService.selectList(id, currentPage);
	
		int maxPage = (int) ((double) listCount / 10 + 0.9);

		int startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1) * 10 + 1;

		int endPage = startPage + 10 - 1;
		if (maxPage < endPage)
			endPage = maxPage;
		
		RequestDispatcher view = null;
		
		if (list != null) {
			view = request.getRequestDispatcher("views/mypage/designerOrder.jsp");
		 	request.setAttribute("list", list);
		 	request.setAttribute("currentPage", currentPage);
		 	request.setAttribute("maxPage", maxPage);
		 	request.setAttribute("startPage", startPage);
		 	request.setAttribute("endPage", endPage);
		 	request.setAttribute("listCount", listCount);
		 	view.forward(request, response);
		 } else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "게시글 페이지별 조회 실패");
			view.forward(request, response);
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
