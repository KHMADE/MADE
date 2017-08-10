package like.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import consumer.model.service.ConsumerOrderService;
import consumer.model.vo.ConsumerOrder;
import like.model.service.LikeService;
import like.model.vo.Like;
import member.model.vo.Member;

/**
 * Servlet implementation class LikeList
 */
@WebServlet("/llist")
public class LikeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeList() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		int currentPage = 1;

		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		LikeService likeService = new LikeService();

		String id = ((Member) request.getSession().getAttribute("member")).getId();
		
		int listCount = likeService.getListCount(id);
		
		ArrayList<Like> list = likeService.selectList(id, currentPage);
	
		int maxPage = (int) ((double) listCount / 10 + 0.9);

		int startPage = (((int) ((double) currentPage / 10 + 0.9)) - 1) * 10 + 1;

		int endPage = startPage + 10 - 1;
		if (maxPage < endPage)
			endPage = maxPage;
		
		RequestDispatcher view = null;
		
		for(Like e : list)
			System.out.println("■ list : " + e);
		System.out.println("■ currentPage : " + currentPage);
		System.out.println("■ maxPage : " + maxPage);
		System.out.println("■ startPage : " + startPage);
		System.out.println("■ endPage : " + endPage);
		System.out.println("■ listCount : " + listCount);
		
		if (list != null && list.size() > 0) {
			view = request.getRequestDispatcher("views/mypage/likeList.jsp");
		 	request.setAttribute("list", list);
		 	request.setAttribute("currentPage", currentPage);
		 	request.setAttribute("maxPage", maxPage);
		 	request.setAttribute("startPage", startPage);
		 	request.setAttribute("endPage", endPage);
		 	request.setAttribute("listCount", listCount);
		 	view.forward(request, response);
		 } else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "게시글 페이지별 조회 실패");
			view.forward(request, response);
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
