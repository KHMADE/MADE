package noticereply.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.vo.Notice;
import noticereply.model.service.NoticeReplyService;
import noticereply.model.vo.NoticeReply;

/**
 * Servlet implementation class NoticeReplyInsertServlet
 */
@WebServlet("/nrinsert")
public class NoticeReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String img = request.getParameter("img");
		String nnum = request.getParameter("nnum");
		String content = request.getParameter("content");
		int currentPage = Integer.parseInt(request.getParameter("page"));
		NoticeReplyService nrservice = new NoticeReplyService();
		NoticeReply n = new NoticeReply(nnum,null,id,img,content, null);
		if(nrservice.replyInsert(n) > 0){
			response.sendRedirect("/made/ndetail?nnum="+nnum+"&page="+currentPage);
		} else {
			response.sendRedirect("/made/404-page.jsp");
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
