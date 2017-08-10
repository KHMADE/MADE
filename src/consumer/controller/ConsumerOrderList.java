package consumer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import consumer.model.service.ConsumerOrderService;
import consumer.model.vo.ConsumerOrder;
import member.model.vo.Member;

/**
 * Servlet implementation class ConsumerOrderList
 */
@WebServlet("/corderlist")
public class ConsumerOrderList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConsumerOrderList() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		int currentPage = 1;

		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		ConsumerOrderService consumerOrderService = new ConsumerOrderService();

		String id = ((Member) request.getSession().getAttribute("member")).getId();
		
		int listCount = consumerOrderService.getListCount(id);
		
		ArrayList<ConsumerOrder> list = consumerOrderService.selectList(id, currentPage);
	
		int maxPage = (int) ((double) listCount / 10 + 0.9);

		int startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1) * 10 + 1;

		int endPage = startPage + 10 - 1;
		if (maxPage < endPage)
			endPage = maxPage;
		
		RequestDispatcher view = null;
		
		if (list != null && list.size() > 0) {
			view = request.getRequestDispatcher("views/mypage/consumerOrder.jsp");
		 	request.setAttribute("list", list);
		 	request.setAttribute("currentPage", currentPage);
		 	request.setAttribute("maxPage", maxPage);
		 	request.setAttribute("startPage", startPage);
		 	request.setAttribute("endPage", endPage);
		 	request.setAttribute("listCount", listCount);
		 	view.forward(request, response);
		 } else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "현재 주문하신 상품이 존재하지 않습니다.<br>하나만 사주시죠 ㅎㅎ");
			view.forward(request, response);
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
