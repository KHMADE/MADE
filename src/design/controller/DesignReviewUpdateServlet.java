 package design.controller;

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
 * Servlet implementation class DesignReviewUpdateServlet
 */
@WebServlet("/dupReview")
public class DesignReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//DesignService dservice = new DesignService();
		ReviewService rwservice = new ReviewService();
		
		String reviewCode = request.getParameter("reviewCode");
		String updtContent = request.getParameter("updtContent");
		
		//System.out.println("디자인 리뷰 업뎃 서블릿 : "+reviewCode+", "+updtContent);
		RequestDispatcher view = null;
		if(rwservice.updateDesignReview(reviewCode,updtContent) != null){
			PrintWriter out = response.getWriter();
			out.print("후기 수정이 정상적으로 완료되었습니다!!");
			out.flush();
			out.close();
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message","디자인 후기 수정 과정 중 오류가 발생했습니다!!<br>상세한 사항은 관리자에게 문의하세요!");
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
