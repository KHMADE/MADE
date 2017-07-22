package notice.controller;

import java.io.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class NoticeInsertservlet
 */
@WebServlet("/ninsert")
public class NoticeInsertservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 업로드 기능이 포함된 공지글 등록 서비스
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int maxSize = 1024*1024*10; // 10M 로 용량 제한
		
		//enctype="multipart/form-data" 인지 체크함
	    if(!ServletFileUpload.isMultipartContent(request)){ 
	      	response.sendRedirect("/first/views/notice/noticeError.jsp");
	    }
	    
		// 웹서버 컨테이너(톰캣) 경로 추출함
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println(root);
		//또는 별도의 저장위치를 지정함
		//String root = "c:\\saveFiles";
		
		String savePath = root + "nuploadFiles/";
		// web/nuploadFiles;
		
	    // Request를 MultipartRequest 객체로 변경해야 함!!
	    try{
	        MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize,
	        		"UTF-8", new DefaultFileRenamePolicy());
	        
	     // 업로드 파일명 (DB 기록용)
	        String fileName = mrequest.getFilesystemName("file");
	        if(new NoticeService().insertNotice(new Notice(mrequest.getParameter("title"), mrequest.getParameter("writer"),
	        		mrequest.getParameter("content"), fileName)) > 0){
	        	response.sendRedirect("/first/nlist");
	        } else {
	        	response.sendRedirect("/first/views/notice/noticeError.jsp");
	        }
	        
	    }catch(Exception e){
	        e.printStackTrace();
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
