package design.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import design.model.service.DesignService;

/**
 * Servlet implementation class DesignReviewInsertServlet
 */
@WebServlet("/dreviewinsert")
public class DesignReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String dId = request.getParameter("did");
		String mid = request.getParameter("mid");
		String content = request.getParameter("content");
		//System.out.println(content);
		DesignService dservice = new DesignService();
		RequestDispatcher view = null;
		if(dservice.insertDesignReview(dId, mid, content) > 0){
			response.sendRedirect("/made/dDetail?id="+dId+"&mid="+mid);	
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "디자인 아이템 후기 등록 실패!");
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
