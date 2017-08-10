package part.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import part.model.service.PartService;

/**
 * Servlet implementation class PartLikeCheckServlet
 */
@WebServlet("/partLike")
public class PartLikeCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartLikeCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String pid = request.getParameter("pid");
		String mid = ((Member)request.getSession(false).getAttribute("member")).getId();
		int likechk = Integer.parseInt(request.getParameter("like"));
		PartService pservice = new PartService(); 
		
		PrintWriter out = response.getWriter();
		if(likechk == 0){
			pservice.insertLike(mid, pid);
			out.print(1);
		} else {
			pservice.deleteLike(mid, pid);
			out.print(0);
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
