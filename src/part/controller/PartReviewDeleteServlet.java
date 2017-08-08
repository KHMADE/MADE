package part.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.ReviewService;

/**
 * Servlet implementation class PartReviewDeleteServlet
 */
@WebServlet("/pDelReview")
public class PartReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ReviewService rwservice = new ReviewService();
		String reviewCode = request.getParameter("reviewCode");
		
		RequestDispatcher view = null;
		if(rwservice.deleteDesignReview(reviewCode) != null){
			PrintWriter out = response.getWriter();
			out.print("후기 삭제가 정상적으로 완료되었습니다!!");
			out.flush();
			out.close();
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message","부품 후기 삭제 과정 중 오류가 발생했습니다!!<br>상세한 사항은 관리자에게 문의하세요!");
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
