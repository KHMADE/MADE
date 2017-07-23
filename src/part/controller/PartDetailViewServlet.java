package part.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import part.model.service.PartService;
import part.model.vo.Part;

/**
 * Servlet implementation class PartDetailViewServlet
 */
@WebServlet("/pDetail")
public class PartDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("type/html; charset=UTF-8");
		String pId = request.getParameter("id");
		Part p = new PartService().partSelect(pId);
		if(p != null){
			RequestDispatcher view = request.getRequestDispatcher("views/item/partDetailView.jsp");
			request.setAttribute("part", p);
			view.forward(request, response);
		} else {
			response.sendRedirect("404-page.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
