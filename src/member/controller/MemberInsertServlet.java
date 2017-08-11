package member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 회원가입 처리용 컨트롤러
		// 1. 전송값에 한글이 있을 경우 문자 인코딩 처리, 응답처리에 대해서도 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	      
		String command = request.getParameter("command");
		RequestDispatcher view = null;
	    if(!idcheck(request,response)){
	    
	    	view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "회원 가입이 실패하였습니다!");
			view.forward(request, response);
	    
	    }

	   
		// 업로드할 파일의 용량 제한 : 10Mbyte로 제한한다면
		int maxSize = 1024 * 1024 * 10;

		
		// enctype="multipart/form-data" 로 전송되었는지 확인
		if (!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "form enctype 속성 사용 안 됨!");
			view.forward(request, response);
		}

		// 해당 컨테이너의 구동중인 웹 애플리케이션의 루트 경로 알아냄
		String root = request.getSession().getServletContext().getRealPath("/");
		// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리
		String savePath = root + "\\images\\userimage";
		// web/nuploadFiles 로 지정함

		// request 를 MultipartRequest 객체로 변환함
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 2. 전송값 꺼내서 변수에 기록
		String userid = mrequest.getParameter("userid");
		String userpwd = mrequest.getParameter("userpwd");
		String userpwd2 = mrequest.getParameter("userpwd2");
		String classCode = mrequest.getParameter("classCode");
		String name = mrequest.getParameter("name");
		String email = mrequest.getParameter("email1")+"@"+ mrequest.getParameter("email");
		String gender = mrequest.getParameter("gender");
		String nickname = mrequest.getParameter("nickname");
		//int age = 2018 - Integer.parseInt(mrequest.getParameter("FirstSelectYear"));
		Date birth = Date.valueOf(mrequest.getParameter("FirstSelectYear")+"-"+mrequest.getParameter("FirstSelectMonth")+"-"+mrequest.getParameter("FirstSelectDay"));
		String phone = mrequest.getParameter("phone1")+"-"+mrequest.getParameter("phone2")+"-"+mrequest.getParameter("phone3");

		StringBuilder sb = new StringBuilder();
		sb.append(mrequest.getParameter("post_num"));
		sb.append("," + mrequest.getParameter("address1"));
		sb.append("," + mrequest.getParameter("address2"));
		String address = sb.toString();
		Member m = null;

		String originFileName = mrequest.getFilesystemName("img");

		if (originFileName != null) {
			// 업로도된 파일명을 "년월일시분초.확장자" 로 변경함
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

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
				m = new Member(userid, classCode, userpwd, name, email, gender, birth, phone, address, renameFileName, nickname);
		} else {
				m = new Member(userid, classCode, userpwd, name, email, gender, birth, phone, address, "default_image.jpg", nickname);
		}

		int result = 0;
		 
	    if(classCode.equals("C")){
	    	result = new MemberService().insertMember(m); //일반회원일때
	    }else  if(classCode.equals("D")){
	    	result = new MemberService().insertMember(m); //기업회원일때
	    }
	    
	    
		if (result > 0) { // 성공
			response.sendRedirect("index.jsp");
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "회원 가입이 실패하였습니다!");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	        doGet(request, response);
	        /*if(command.equals("getHello")){
	            getHello(request,response);
	        }else if(command.equals("postHello")){
	            postHello(request,response);
	        }else if(command.equals("idcheck")){
	            idcheck(request,response);
	        }else if(command.equals("subwayline")){
	            subwayline(request,response);
	        }*/
	    }
	     
	    // ID 중복 검사 처리
	    protected boolean idcheck(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
	        ArrayList<String> ids = new MemberService().selectMemberId();
	        PrintWriter out = response.getWriter();
	        // id 중복 처리
	        String gotId = request.getParameter("id");
	        
	        boolean result = false;
	        for(String id : ids){
	            if(id.equals(gotId)){
	                // 응답 메세지 1 : 이미 등록된 ID 입니다.
	                result = false;
	                break;
	            }else{

	                // 응답 메세지 2 : 사용할 수 있는 ID 입니다.
	                result = true;
	            }
	        }  
	        return result;
	    }
	    
	  
	    
}
