package order.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import design.model.service.DesignService;
import design.model.vo.Design;
import member.model.vo.Member;
import order.model.service.OrderService;
import part.model.service.PartService;
import part.model.vo.Part;

/**
 * Servlet implementation class OrderConfirmServlet
 */
@WebServlet("/orderconfirm")
public class OrderConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String mid = ((Member) request.getSession().getAttribute("member")).getId();
		String item = request.getParameter("item");
		String code = request.getParameter("code");
		int quan = Integer.parseInt(request.getParameter("quan"));
		int price = Integer.parseInt(request.getParameter("price"));
		String imp_uid = request.getParameter("imp_uid");
		String paid_at = request.getParameter("paid_at");
		String status = request.getParameter("status");
		String pg_tid = request.getParameter("pg_tid");
		String pay_method = request.getParameter("pay_method"); // card 인지 아닌지
		String receipt_url = request.getParameter("receipt_url");
		String buyer_name = request.getParameter("buyer_name"); // nickname
		Design d = null;
		Part p = null;
		OrderService oservice = new OrderService();
		int result = 0;
		
		switch(pay_method){
		case "card": pay_method = "신용카드 결제"; break;
		case "trans": pay_method = "실시간계좌이체 결제"; break;
		case "vbank": pay_method = "가상계좌 결제"; break;
		case "phone": pay_method = "휴대폰소액결제 결제"; break;
		case "samsung": pay_method = "삼성페이 결제"; break;
		case "kpay": pay_method = "KPay앱 결제"; break;
		case "cultureland": pay_method = "문화상품권 결제"; break;
		case "smartculture": pay_method = "스마트문상 결제"; break;
		case "happymoney": pay_method = "해피머니 결제"; break;
		default:
		}
		/*
		 * pay_method
		card(신용카드)
		trans(실시간계좌이체)
		vbank(가상계좌)
		phone(휴대폰소액결제)
		samsung(삼성페이 / 이니시스 전용)
		kpay(KPay앱 직접호출 / 이니시스 전용)
		cultureland(문화상품권 / 이니시스 전용)
		smartculture(스마트문상 / 이니시스 전용)
		happymoney(해피머니 / 이니시스 전용)
		
		status
		ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)
		 */
		System.out.println(item+", "+code+", "+quan+", "+price+", "+imp_uid+", "+paid_at+", "+status);
		System.out.println(pg_tid+", "+pay_method+", "+receipt_url+", "+buyer_name);
		// part, PA170809061302, , 1, , 5500, , imp_615197443348, , 1502372273, , paid
		// tlgda2017081022375256554, card, , http://pgweb.dacom.net:7085/pg/wmp/etc/jsp/Receipt_Link.jsp?mertid=tlgdacomxpay&tid=tlgda2017081022375256554&authdata=138526094ced24ce0d89d97a78e4d979, , 관리자
		
		long unixTime = Long.parseLong(paid_at);
		Date date = new Date(unixTime); 
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-DD");
		//System.out.println(df.format(date));
		
		if(item.equals("part")){
			p = new PartService().partSelect(code);
			result = oservice.insertPart(code, quan, mid);
		} else {
			d = new DesignService().designSelect(code);
			result = oservice.insertDesign(code, quan, mid);
		}
		
		RequestDispatcher view = null;
		if(result > 0){
			//System.out.println("주문 정보 생성 완료!");
			/*view = request.getRequestDispatcher("views/mypage/orderConfirm.jsp");
			request.setAttribute("item", item);
			request.setAttribute("date", df.format(date));
			request.setAttribute("design", d);
			request.setAttribute("part", p);
			request.setAttribute("nick", buyer_name);
			request.setAttribute("quan", quan);
			request.setAttribute("price", price);
			request.setAttribute("pay_method", pay_method);
			view.forward(request, response);*/
			/*PrintWriter out = response.getWriter();
			out.print("ok");
			out.flush();
			out.close();*/
		} else {
			view = request.getRequestDispatcher("404-page.jsp");
			request.setAttribute("message","상품 구매에 실패하셨습니다. ㅠㅜ<br>구매하신 내역을 다시 확인해 주세요~!");
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
