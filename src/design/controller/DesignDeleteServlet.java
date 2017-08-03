package design.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.ResponseCache;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import design.model.service.DesignService;
import design.model.vo.Design;
import order.model.service.OrderService;
import part.model.service.PartService;

/**
 * Servlet implementation class DesignDeleteServlet
 */
@WebServlet("/ddelete")
public class DesignDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignDeleteServlet() {
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
		DesignService dservice = new DesignService();
		Design d = dservice.designSelect(id);
		
		// 해당 컨테이너의 구동중인 웹 애플리케이션의 루트 경로 알아냄
		String root = request.getSession().getServletContext().getRealPath("/");
		// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리
		String savePath = root + "images\\items\\designed";
		
		if(d.getDesignImg() != null && !d.getDesignImg().equals("default_image.jpg")){
			File oldFile = new File(savePath + "\\" + d.getDesignImg());
			oldFile.delete();
		}
		
		RequestDispatcher view = null;
		if (dservice.deleteDesign(id) > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('아이템 삭제가 성공적으로 이루어졌습니다.');");
			out.println("location.href = '/made/designitemlist?page=1';"); 
			out.println("</script>"); 
			out.close();
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "아이템 삭제 실패!! : 현재 주문이 존재하는 상품입니다.");
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
