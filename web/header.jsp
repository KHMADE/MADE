<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*"%>
<%
	Member m = (Member) session.getAttribute("member");
	String loginout;
	if (m == null) {
		loginout = "<a href='/made/loginout.jsp'>&nbsp;Login&nbsp;</a>";
	} else {
		loginout = "&nbsp;<b>"+m.getNickName()+"</b>님 환영합니다!&nbsp;&nbsp;<a href='/made/logout'>&nbsp;Logout&nbsp;</a>";
	}
%>

	<header id="header" class="clearfix">
		<div id="top-bar">
			<div class="container">
				<div class="row">
					<div class="col-sm-7 hidden-xs top-info">
						<!--                        <span><i class="fa fa-phone"></i>Phone: (123) 456-7890</span>
                        <span><i class="fa fa-envelope"></i>Email: firerain4@naver.com</span>-->
					</div>
					<div class="col-sm-5 top-info">
						<ul>
							<li style="width: auto;"><%=loginout%></li>
							<% if(m ==null ) {%>
							<li><a
								href="/made/views/user/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%ED%8E%98%EC%9D%B4%EC%A7%80.html">&nbsp;회원가입&nbsp;</a></li>
								<% } %>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- LOGO bar -->
		<div id="logo-bar" class="clearfix">
			<!-- Container -->
			<div class="container">
				<div class="row">
					<!-- Logo / Mobile Menu -->
					<div class="col-xs-12">
						<div id="logo" style="width: 170px;">
							<h1>
								<a href="/made/index.jsp"><img src="/made/images/logo.png" alt="Eve" /></a>
							</h1>
						</div>
					</div>
				</div>
			</div>
			<!-- Container / End -->
		</div>
		<!--LOGO bar / End-->

		<!-- Navigation
================================================== -->
		<div class="navbar navbar-default navbar-static-top" role="navigation">
			<div class="container">
				<div class="row">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.jsp">Home</a></li>
							<li><a href="/made/views/notice/공지사항 main.jsp">공지사항</a></li>
							<li><a href="#">DIY 상품</a>
								<ul class="dropdown-menu">
									<li><a href="/made/designlist">Designed</a></li>
									<li><a href="/made/partlist">Parts</a></li>
								</ul></li>

							<li><a href="/made/views/mypage/order_page.html">마이페이지</a>
								<ul class="dropdown-menu">
									<li><a href="/made/views/mypage/myinfo.html">My page</a></li>
									<li><a href="/made/views/mypage/order_page.html">주문내역</a></li>
									<li><a href="/made/views/mypage/myinfo.html">회원정보수정</a></li>
									<li><a href="/made/views/mypage/myinfo.html">쪽지함</a></li>
									<li><a href="/made/views/mypage/myinfo.html">1:1문의</a></li>
								</ul></li>
							<li><a href="/made/views/faq/faq.jsp">FAQ</a></li>
							<li><a href="/made/views/default_page/default_page.jsp">Default</a></li>
							<li><a href="/made/views/default_page/default_page.jsp">Contact</a></li>
						</ul>
					</div>
				</div>
				<!--/.row -->
			</div>
			<!--/.container -->
		</div>
	</header>
	