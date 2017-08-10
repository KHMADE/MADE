package noticereply.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticereply.model.service.NoticeReplyService;

/**
 * Servlet implementation class NoticeReplyUpdateServlet
 */
@WebServlet("/nrupdate")
public class NoticeReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeReplyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		NoticeReplyService nrservice = new NoticeReplyService();
		
		String reviewCode = request.getParameter("reviewCode");
		String updtContent = request.getParameter("updtContent");
		
		RequestDispatcher view = null;
		if(nrservice.updateNoticeReply(reviewCode,updtContent) != null){
			PrintWriter out = response.getWriter();
			out.print("댓글 수정 완료");
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
