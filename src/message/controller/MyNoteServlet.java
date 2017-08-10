package message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import message.model.service.MessageService;
import message.model.vo.Message;

/**
 * Servlet implementation class MyNoteServlet
 */
@WebServlet("/mnote")
public class MyNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 게시글 페이지별 조회 처리용 컨트롤러
				response.setContentType("text/html; charset=utf-8");
				
				//페이지 값 처리용
				int currentPage = 1;
				//한 페이지당 출력할 목록 갯수
				int limit = 10;
				String msgTitle = "보낸쪽지함";
				
				//전달된 페이지값 추출
				if(request.getParameter("page") != null)
					currentPage = Integer.parseInt(request.getParameter("page"));
				
				MessageService mservice = new MessageService();
				String mid = ((Member)(request.getSession(false).getAttribute("member"))).getId();
				//전체 목록 갯수와 해당 페이지별 목록을 리턴받음
				int listCount = mservice.getListCount();
				System.out.println("조회된 목록 갯수 : " + listCount);
				ArrayList<Message> list = mservice.selectMyNote(currentPage, limit, mid);
				System.out.println(list);
				System.out.println(listCount);
				//총 페이지수 계산 : 목록이 최소 1개일 때 1page로 처리하기
				//위해 0.9 더함
				int maxPage = (int)((double)listCount / limit + 0.9);
				//현재 페이지에 보여줄 시작 페이지수
				//(1, 11, 21, .......)
				//현재 페이지가 13page 이면 시작페이지는 11page 가 되어야 함
				int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
				//만약, 목록 아래에 보여질 페이지 갯수가 10개이면
				//끝페이지수는 20페이지가 되어야 함
				int endPage = startPage + limit - 1;
				if(maxPage < endPage)
					endPage = maxPage;
				String msgType = "mnote";
				RequestDispatcher view = null;
				if(list != null && list.size() > 0){
					view = request.getRequestDispatcher("views/message/messageListView.jsp");
					request.setAttribute("list", list);
					request.setAttribute("msgTitle", msgTitle);
					request.setAttribute("currentPage", currentPage);
					request.setAttribute("maxPage", maxPage);
					request.setAttribute("startPage", startPage);
					request.setAttribute("endPage", endPage);
					request.setAttribute("listCount", listCount);
					request.setAttribute("msgType", msgType);
					
					view.forward(request, response);
				} else if(list.size() == 0){
					view = request.getRequestDispatcher("404-page.jsp");
					request.setAttribute("message", "쪽지가 없습니다.");
					view.forward(request, response);
				} else{
					view = request.getRequestDispatcher("404-page.jsp");
					request.setAttribute("message", "쪽지 페이지 조회 실패");
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
