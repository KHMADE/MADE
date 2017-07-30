package part.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import part.model.service.PartService;
import part.model.vo.Part;

/**
 * Servlet implementation class PartInsertServlet
 */
@WebServlet("/pinsert")
public class PartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//"INSERT INTO PART VALUES('PA'||TO_CHAR(SYSDATE,'RRMMDDHH24MI')||LPAD(SEQ_PART.NEXTVAL,2,'0'),?,?,SYSDATE,?,?,?,?)";
		//INSERT INTO PART VALUES('PA8','철재 180X100cm','STEEL',SYSDATE,2300,5,'기본 철재 샘플4','default_steel4.jpg');
			
		if(new PartService().insertPart(new Part(request.getParameter("title"),
				request.getParameter("category"),Integer.parseInt(request.getParameter("price")),
				Integer.parseInt(request.getParameter("quantity")),	request.getParameter("content"),
				request.getParameter("fileName"))) > 0){
			response.sendRedirect("/made/partitemlist");
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
