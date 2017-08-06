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
 * Servlet implementation class PartUpdateViewServlet
 */
@WebServlet("/pupdateView")
public class PartUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String code = request.getParameter("code");
		Part p = new PartService().partSelect(code);
		RequestDispatcher view = null;
		if(p != null){
			view = request.getRequestDispatcher("views/item/partupdateForm.jsp");
			request.setAttribute("part", p);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "부품 게시글 수정 페이지 조회 실패!");
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
