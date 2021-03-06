package design.controller;

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
import member.model.service.ReviewService;
import member.model.vo.ItemReview;
import part.model.vo.Part;

/**
 * Servlet implementation class DesignDetailViewServlet
 */
@WebServlet("/dDetail")
public class DesignDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String dId = request.getParameter("id");
		String mid = request.getParameter("mid");
		DesignService dservice = new DesignService();
		dservice.addReadCount(dId);
		ArrayList<ItemReview> rvwlist = new ReviewService().selectDesignReview(dId);
		ArrayList<Part> plist = dservice.selectDesignPartList(dId);
		int likechk = dservice.likechk(dId, mid);
		
		Design d = dservice.designSelect(dId);
		int oriPrice = dservice.designPartPrice(dId);
		RequestDispatcher view = null;
		if(d != null){
			view = request.getRequestDispatcher("views/item/designedDetailView.jsp");
			request.setAttribute("design", d);
			request.setAttribute("plist", plist);
			request.setAttribute("like", likechk);
			request.setAttribute("review",rvwlist);
			//System.out.println(plist);
			request.setAttribute("oriPrice", oriPrice);
			//request.setAttribute("page", Integer.parseInt(request.getParameter("page")));
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message","디자인 상세보기 페이지 오류!!<br> 관리자에게 문의하세요!");
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
