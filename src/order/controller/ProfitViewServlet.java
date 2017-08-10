package order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import order.model.service.OrderService;
import order.model.vo.OrderStat;

/**
 * Servlet implementation class ProfitViewServlet
 */
@WebServlet("/pview")
public class ProfitViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfitViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String mid = ((Member)request.getSession(false).getAttribute("member")).getId();
		Member m = new MemberService().selectMember(mid);
		OrderService oservice = new OrderService();
		ArrayList<OrderStat> olist = new ArrayList<OrderStat>();
		ArrayList<OrderStat> toplist = new ArrayList<OrderStat>();
		ArrayList<OrderStat> purlist = new ArrayList<OrderStat>();
		ArrayList<OrderStat> yearProfit =  new ArrayList<OrderStat>();
		RequestDispatcher view = null;
		
		if(m.getClassCode().equals("A")){
			olist = oservice.selectOrderList();
			toplist = oservice.selectTopitemList();
			purlist = oservice.selectPurList();
			yearProfit = oservice.yearProfit();
			view = request.getRequestDispatcher("views/mypage/profitView.jsp");
			request.setAttribute("olist", olist);
			request.setAttribute("toplist", toplist);
			request.setAttribute("purlist", purlist);
			request.setAttribute("yearProfit", yearProfit);
			//System.out.println(olist);
			view.forward(request, response);
		} else if(m.getClassCode().equals("D")){
			olist = oservice.selectOrderList(mid);
			toplist = oservice.selectTopitemList(mid);
			purlist = oservice.selectPurList(mid);
			yearProfit = oservice.yearProfit(mid);
			view = request.getRequestDispatcher("views/mypage/profitView.jsp");
			request.setAttribute("olist", olist);
			request.setAttribute("toplist", toplist);
			request.setAttribute("purlist", purlist);
			request.setAttribute("yearProfit", yearProfit);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message","인가된 사용자가 아닙니다.<br> 관리자에게 문의하세요!");
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
