package receipt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import receipt.model.service.ReceiptService;
import receipt.model.vo.Receipt;

/**
 * Servlet implementation class ReceiptServlet
 */
@WebServlet("/receipt")
public class ReceiptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReceiptServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		String orderCode = request.getParameter("order_code");
		String productCode = request.getParameter("productCode");
		
		Receipt receipt = null;
		if (productCode.substring(0, 2).equals("DE"))
			receipt = new ReceiptService().selectDesignReceipt(orderCode);
		else if (productCode.substring(0, 2).equals("PA"))
			receipt = new ReceiptService().selectPartReceipt(orderCode);

		RequestDispatcher view = null;
		if (receipt != null) {
			view = request.getRequestDispatcher("views/mypage/receipt.jsp");
		 	request.setAttribute("receipt", receipt);
		 	view.forward(request, response);
		 } else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "영수증 조회 실패");
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
