package order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import design.model.service.DesignService;
import design.model.vo.Design;
import part.model.service.PartService;
import part.model.vo.Part;

/**
 * Servlet implementation class OrderInfoServlet
 */
@WebServlet("/orderInfo")
public class OrderInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String itemCode = request.getParameter("code");
		int price = Integer.parseInt(request.getParameter("price"));
		int quan = Integer.parseInt(request.getParameter("quan"));
		int oriPrice = 0;
		String item = request.getParameter("item");
		Part p = null;
		Design d = null;
		ArrayList<Part> plist = new ArrayList<Part>();
		String dFull = null;
//		System.out.println(itemCode);
//		System.out.println(quan);
//		System.out.println(item);
		DesignService dservice = new DesignService();
		PartService pservice = new PartService();
		
		if(item.equals("design")){
			d = dservice.designSelect(itemCode);
			plist = dservice.selectDesignPartList(itemCode);
			dFull = request.getParameter("dfull");
			oriPrice = dservice.designPartPrice(itemCode);
		} else {
			p = pservice.partSelect(itemCode);
		}
		RequestDispatcher view = null;
		if(d != null){
			
			view = request.getRequestDispatcher("views/mypage/designOrderView.jsp");
			request.setAttribute("design", d);
			request.setAttribute("price", price);
			request.setAttribute("quan", quan);
			request.setAttribute("dFull", dFull);
			request.setAttribute("plist", plist);
			request.setAttribute("oriPrice", oriPrice);
			view.forward(request, response);
		} else if (p != null) {
			
			view = request.getRequestDispatcher("views/mypage/partOrderView.jsp");
			request.setAttribute("part", p);
			request.setAttribute("price", price);
			request.setAttribute("quan", quan);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message","주문 확인 페이지 오류!!<br> 관리자에게 문의하세요!");
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
