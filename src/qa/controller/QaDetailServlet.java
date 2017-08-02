package qa.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qa.model.service.QaService;
import qa.model.vo.Qa;

/**
 * Servlet implementation class QaDetailServlet
 */
@WebServlet("/qdetail")
public class QaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QaDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String qaNum = request.getParameter("qnum");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		QaService qservice = new QaService();

		Qa qa = qservice.qaSelect(qaNum);
		RequestDispatcher view = null;
		
		if(qa != null){
			view = request.getRequestDispatcher("views/qa/qaDetail.jsp");
			request.setAttribute("qa", qa);
			request.setAttribute("currentPage", currentPage);
			view.forward(request, response);
			
		}else{
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "1:1 상세조회 실패!");
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
