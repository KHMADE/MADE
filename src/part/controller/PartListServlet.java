package part.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import part.model.service.PartService;
import part.model.vo.Part;

/**
 * Servlet implementation class PartListServlet
 */
@WebServlet("/partlist")
public class PartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		ArrayList<Part> list = new PartService().selectList();

		if (list != null && list.size() > 0) {
			// 절대경로 사용 못함
			RequestDispatcher view = request.getRequestDispatcher("views/item/item_parts.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
			// 얘는 페이지 주소(url)가 안 바뀜
			// response.sendRedirect("views/notice/noticeListView.jsp");
		} else {
			response.sendRedirect("404-page.jsp");
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
