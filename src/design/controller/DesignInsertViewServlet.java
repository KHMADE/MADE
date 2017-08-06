package design.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import part.model.service.PartService;
import part.model.vo.Part;

/**
 * Servlet implementation class DesignInsertViewServlet
 */
@WebServlet("/dinsertView")
public class DesignInsertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignInsertViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		ArrayList<Part> plist = new PartService().selectList();
		ArrayList<String> didlist = new MemberService().selectAllDesigner();
		RequestDispatcher view = null;
		if(plist != null){
			view = request.getRequestDispatcher("views/item/designInsertForm.jsp");
			request.setAttribute("plist", plist);
			request.setAttribute("didlist", didlist);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "등록에 필요한 부품 아이템 조회 실패");
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
