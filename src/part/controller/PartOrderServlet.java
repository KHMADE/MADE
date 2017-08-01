package part.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.model.service.OrderService;
import order.model.vo.Order;
import part.model.service.PartService;
import part.model.vo.Part;

/**
 * Servlet implementation class PartOrderServlet
 */
@WebServlet("/porder")
public class PartOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PartOrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("type/html; charset=UTF-8");

		String mid = request.getParameter("mid");
		String item = request.getParameter("item");
		int quan = Integer.parseInt(request.getParameter("quan"));
		PartService pservice = new PartService();
		Part p = pservice.partSelect(item);
		// int point = (int)((p.getPrice() * quan) * 0.05);
 
		RequestDispatcher view = null;
		if (new OrderService().insertPart(item, quan, mid) > 0) {
			view = request.getRequestDispatcher("views/order/orderView.jsp");
			request.setAttribute("item", p);
			request.setAttribute("quan", quan);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "게시글 페이지별 조회 실패");
			view.forward(request, response);
		}
		response.sendRedirect("views/member/memberError.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
