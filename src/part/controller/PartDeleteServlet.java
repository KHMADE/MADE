package part.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import design.model.service.DesignService;
import design.model.vo.Design;
import part.model.service.PartService;
import part.model.vo.Part;

/**
 * Servlet implementation class PartDeleteServlet
 */
@WebServlet("/pdelete")
public class PartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartDeleteServlet() {
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
		PartService pservice = new PartService();
		Part p = pservice.partSelect(id);
		
		// 해당 컨테이너의 구동중인 웹 애플리케이션의 루트 경로 알아냄
		String root = request.getSession().getServletContext().getRealPath("/");
		// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리
		String savePath = root + "images\\items\\parts";
		
		if(p.getPartImg() != null && !p.getPartImg().equals("default_image.jpg")){
			File oldFile = new File(savePath + "\\" + p.getPartCategory().toLowerCase()+ "\\" + p.getPartImg());
			oldFile.delete();
		}
		
		RequestDispatcher view = null;
		if (pservice.deletePart(id) > 0){
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('아이템 삭제가 성공적으로 이루어졌습니다.');");
			out.println("location.href = '/made/partitemlist?page=1';"); 
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
