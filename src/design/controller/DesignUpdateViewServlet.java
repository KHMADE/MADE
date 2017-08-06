package design.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class DesignUpdateViewServlet
 */
@WebServlet("/dupView")
public class DesignUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DesignUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String code = request.getParameter("id");
		DesignService dservice = new DesignService();
		Design d = dservice.designSelect(code);
		ArrayList<Part> plist_all = new PartService().selectList();
		ArrayList<Part> plist = dservice.selectDesignPartList(code);
		
		RequestDispatcher view = null;
		if(d != null){
			view = request.getRequestDispatcher("views/item/designupdateForm.jsp");
			request.setAttribute("degisn", d);
			request.setAttribute("plist", plist);
			request.setAttribute("plist_all", plist_all);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "디자인 상품 게시글 수정 페이지 조회 실패!");
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
