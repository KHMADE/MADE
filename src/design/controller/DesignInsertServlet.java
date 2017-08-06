package design.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import design.model.service.DesignService;
import design.model.vo.Design;
import design.model.vo.DesignPart;

/**
 * Servlet implementation class DesignInsertServlet
 */
@WebServlet("/dinsert")
public class DesignInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DesignInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 업로드할 파일의 용량 제한 : 10Mbyte로 제한한다면
		int maxSize = 1024 * 1024 * 10;

		RequestDispatcher view = null;
		// enctype="multipart/form-data" 로 전송되었는지 확인
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "form enctype 속성 사용 안 됨!");
			view.forward(request, response);
		}
		
		// 해당 컨테이너의 구동중인 웹 애플리케이션의 루트 경로 알아냄
				String root = request.getSession().getServletContext().getRealPath("/");
				// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리
				String savePath = root + "\\images\\items\\designed";
				// web/nuploadFiles 로 지정함

				// request 를 MultipartRequest 객체로 변환함
				MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				ArrayList<DesignPart> deplist = null;
				String title = mrequest.getParameter("title");
				String designer = mrequest.getParameter("designer");
				int price = Integer.parseInt(mrequest.getParameter("price"));
				int partCnt = Integer.parseInt(mrequest.getParameter("partCnt"));
				String category = mrequest.getParameter("category");
				String content = mrequest.getParameter("content");
				
				//System.out.println(partCnt);
				if(partCnt > 0){
					deplist = new ArrayList<DesignPart>();
					for(int i = 1; i < partCnt+1 ; i++){
						deplist.add(new DesignPart(mrequest.getParameter("part"+i),
								Integer.parseInt(mrequest.getParameter("partQuan"+i))));
					}
				}
				//System.out.println(deplist);
				Design d = null; 

				DesignService dservice = new DesignService();
				String originFileName = mrequest.getFilesystemName("input_file");
				if (originFileName != null) {
					// 업로도된 파일명을 "년월일시분초.확장자" 로 변경함
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);

					// 파일명 바꾸기하려면 File 객체의 renameTo() 사용함
					File originFile = new File(savePath + "\\" + originFileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					// 파일이름 바꾸기 실행 >> 실패할 경우 직접 바꾸기함
					// 새 파일만들고 원래 파일내용 읽어서 복사 기록하고
					// 원 파일 삭제함
					if (!originFile.renameTo(renameFile)) {
						int read = -1;
						byte[] buf = new byte[1024];
						// 한번에 읽을 배열 크기 지정
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						while ((read = fin.read(buf, 0, buf.length)) != -1) {
							fout.write(buf, 0, read);
						}

						fin.close();
						fout.close();
						originFile.delete(); // 원본 파일 삭제함
					}

					d = new Design(title, category, content, price, renameFileName, designer);
				}
				else d = new Design(title, category, content, price, "default_image.jpg", designer);

				if (dservice.insertDesign(d) > 0) {
					if(deplist == null || dservice.insertDesignPart(deplist) > 0 ){
						response.sendRedirect("/made/designitemlist?page=1");
					} else {
						view = request.getRequestDispatcher("404-page.jsp");
						request.setAttribute("message", "디자인 부품 목록 등록 실패!");
						view.forward(request, response);
					}
				} else {
					view = request.getRequestDispatcher("404-page.jsp");
					request.setAttribute("message", "디자인 아이템 등록 실패!");
					view.forward(request, response);
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
