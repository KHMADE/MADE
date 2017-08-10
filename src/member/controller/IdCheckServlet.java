package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/icheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // ID 중복 검사 처리
	  
	        ArrayList<String> ids = new MemberService().selectMemberId();
	        response.setContentType("text/html;charset=UTF-8");
	        response.setHeader("Cache-Control", "no-cache");
	        PrintWriter out = response.getWriter();
	        // id 중복 처리
	        String gotId = request.getParameter("id");
	        
	        String result = null;
	        for(String id : ids){
	            if(id.equals(gotId)){
	                // 응답 메세지 1 : 이미 등록된 ID 입니다.
	                result = "<font color=\"red\">이미 등록된 ID 입니다.</font>";
	                break;
	            }else{

	                // 응답 메세지 2 : 사용할 수 있는 ID 입니다.
	                result = "<font color=\"green\">사용할 수 있는 ID 입니다.</font>";
	            }
	        }  
	        out.println(result);
	    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
