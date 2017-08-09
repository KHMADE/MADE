package consumer.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import order.model.service.OrderService;

/**
 * Servlet implementation class OrderInsertServlet
 */
@WebServlet("/orderinsert")
public class OrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		String item = request.getParameter("item");
		String code = request.getParameter("code");
		int quan = Integer.parseInt(request.getParameter("quan"));
		String imp_uid = request.getParameter("imp_uid");
		String pay_method = request.getParameter("pay_method");
		int price = Integer.parseInt(request.getParameter("price"));
		String status = request.getParameter("status");
		//	ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)
		String title = request.getParameter("title");
		String pg_tid = request.getParameter("pg_tid");
		String mid = request.getParameter("buyer_name");
		String paid_at = request.getParameter("paid_at");
		String receipt_url = request.getParameter("receipt_url"); 
		//전달되는 URL을 그대로 open하면 매출전표 확인가능
		OrderService oservice = new OrderService();
		int result = 0;
		PrintWriter out = response.getWriter();
		if(item.equals("part")){
			result = oservice.insertPart(code, quan, mid);
		} else {
			result = oservice.insertDesign(code, quan, mid);
		}
		JSONObject json = new JSONObject();
		
		if(result > 0){
			json.put("code", code);
			json.put("status", status);
			json.put("pay_method", pay_method);
			json.put("price", price);
			json.put("pg_tid", pg_tid);
		} else {
			json.put("fail","failed");
		}
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
