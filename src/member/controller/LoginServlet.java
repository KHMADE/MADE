package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import member.model.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
// 어노테이션은 컴파일러 주석문이다
// 자바 1.7버전 부터 추가
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request : 전송값 , response : 요청자
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		// 1. 전송할 값에 한글이 있을 경우, 문자셋 인코딩 처리함
		// 응답 보낼 값에도 한글이 있을 경우 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// 여기에 오타가 날 경우, 보낼 파일 발송 시 파일 선택 창이 발생함
		
		// 2. 전송값 꺼내서 변수에 기록하기
		String userID = request.getParameter("id");
		String userPWD = request.getParameter("pwd");
		
		// 3. 비즈니스 로직 처리용 모델 객체 생성하고,
		// 필요한 메소드 구동하고 처리결과를 받는다.
		Member member = new MemberService().selectMember(userID, userPWD);
		if(member != null){
			//System.out.println(member);
			HttpSession session = request.getSession();
			//System.out.println(session.getId());
			// 웹 페이지마다 값이 다름 (Map과 비슷함: key = String, value= Object)
			session.setAttribute("member", member);
			response.getWriter().append("ok");
			//response.sendRedirect("index.jsp");
		} else {
			response.getWriter().append("on");
			//response.sendRedirect("404-page.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		/*System.out.println("전송방식 POST로 값 받았어요~");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");*/
	}

}
