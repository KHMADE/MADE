package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/minsert")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 처리용 컨트롤러
		// 1. 전송값에 한글이 있을 경우 문자 인코딩 처리, 응답처리에 대해서도 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		// 2. 전송값 꺼내서 변수에 기록
		String userid = request.getParameter("userid");
		String userpwd = request.getParameter("userpwd");
		String userpwd2 = request.getParameter("userpwd2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		//int age = Integer.parseInt(request.getParameter("age"));
		int age = Integer.parseInt(request.getParameter("age"));
		String phone = request.getParameter("phone");
		
		StringBuilder sb = new StringBuilder();
		sb.append(request.getParameter("post_num"));
		sb.append(","+request.getParameter("address1"));
		sb.append(","+request.getParameter("address2"));
		String address = sb.toString();
		
		/*if(userpwd.equals(userpwd2)){
			// 3. 비즈니스로직 처리용 모델 객체 생성과 메소드 호출
			// 리턴값 받기
			Member m = new Member(userid,userpwd,name,email,gender,age,phone,address);
			int result = new MemberService().insertMember(m);
			
			if(result > 0){ // 성공
				JOptionPane.showMessageDialog(null,"가입 성공~~!!");
				response.sendRedirect("/first/index.jsp");
			} else {
				JOptionPane.showMessageDialog(null,"가입 실패!!");
				response.sendRedirect("views/member/memberError.jsp");
			}
		} else {
			JOptionPane.showMessageDialog(null,"비밀번호 값과 확인 값이 다르네여~~");
			response.sendRedirect("views/member/memberError.jsp");
		}*/
		response.sendRedirect("views/member/memberError.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
