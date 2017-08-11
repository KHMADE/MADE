package member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javafx.scene.control.Alert;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mupdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 회원 정보 수정용 컨트롤러
		// 1. 전송값에 한글이 있을 경우 문자인코딩 처리
		// 응답처리에 컨텐츠타입 지정
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		
		 
		int maxSize = 1024 * 1024 * 10;
		RequestDispatcher view = null;
		if (!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message", "form enctype 속성 사용 안 됨!");
			view.forward(request, response);
		}
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "\\images\\userimage";
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		
		// 2. 전송값 꺼내서 변수에 기록하기
		 String userId= ((Member)request.getSession(false).getAttribute("member")).getId();
		 System.out.println(userId);
		String userPwd = mrequest.getParameter("userpwd");
		System.out.println(userPwd);
		String phone1 = mrequest.getParameter("phone1");
		String phone2 = mrequest.getParameter("phone2");
		String phone3 = mrequest.getParameter("phone3");
		String phone4 = phone1+"-"+phone2+"-"+phone3;
		System.out.println(phone4);

		String u_originFileName = mrequest.getFilesystemName("img");
		System.out.println("u_originFileName : " + u_originFileName);
		
		MemberService mservice = new MemberService();
		
		String originFileName = mservice.selectOrigenFileName(userId);
		System.out.println("originFileName : "+originFileName);
		int result = 0;
		
		if(u_originFileName == null ){
			Member m = new Member(userId, userPwd, phone4, null);
			//img를 삽입하지 않는 서비스
			result = new MemberService().updateMember1(m);
			System.out.println("2");
		}else{
			//■rename 쓸지 안쓸지 물어봄
				// 업로도된 파일명을 "년월일시분초.확장자" 로 변경함
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
						+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
				System.out.println("3");
				// 파일명 바꾸기하려면 File 객체의 renameTo() 사용함
				File f_u_originFileName = new File(savePath + "\\" + u_originFileName);
				File f_originFileName = new File(savePath + "\\" + originFileName);
				File renameFile = new File(savePath + "\\" + renameFileName);
				if (!f_u_originFileName.renameTo(renameFile)) {
					int read = -1;
					byte[] buf = new byte[1024];
					// 한번에 읽을 배열 크기 지정
					FileInputStream fin = new FileInputStream(u_originFileName);
					FileOutputStream fout = new FileOutputStream(renameFile);

					while ((read = fin.read(buf, 0, buf.length)) != -1) {
						fout.write(buf, 0, read);
					}

					fin.close();
					fout.close();
					f_u_originFileName.delete(); // 원본 파일 삭제함
				
					f_originFileName.delete();
				}
				
				
			Member m = new Member(userId, userPwd, phone4, u_originFileName);
			System.out.println("4");
			result = new MemberService().updateMember2(m);
		}
		System.out.println("result:"+result);
		
		// 4. 리턴값을 가지고 성공.실패에 대한 뷰페이지를 내보내는 작업
		if (result > 0) {// 수정 성공시
			response.sendRedirect("/made/index.jsp");
			//■alert넣기
		}else{// 가입 실패시
				view = request.getRequestDispatcher("404-page.jsp");
				request.setAttribute("message", "회원정보 수정이 실패하였습니다!");
				view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
