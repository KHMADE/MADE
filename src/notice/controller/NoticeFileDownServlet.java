package notice.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class NoticeFileDownServlet
 */
@WebServlet("/nfdown")
public class NoticeFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeFileDownServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; UTF-8");

		// 저장된 폴더 경로
		String saveFolder = request.getSession().getServletContext().getRealPath("/nuploadFiles");
		String fileName = request.getParameter("path");

		// 폴더에서 파일읽기용 스트림 생성
		File downFile = new File(saveFolder + "/" + fileName);
		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(downFile));

		// 파일 내보내기(다운로드)용 출력 객체 생성
		ServletOutputStream downOut = response.getOutputStream();

		// response의 헤더에 따옴표로 묶은 내용을 전송
		response.addHeader("Content-Disposition",
				"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int) downFile.length());

		// 읽어온 파일을 바이트 단위로 출력!
		int readData = 0;

		while ((readData = bin.read()) != -1) {
			downOut.write(readData);
		}
		
		downOut.close();
		bin.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
