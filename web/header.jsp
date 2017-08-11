<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*"%>
<%
	Member m = (Member) session.getAttribute("member");
	String loginout;
	String[] addr = new String[3];
	
	if (m == null) {
		loginout = "<a href='#login-modal' data-toggle='modal' data-target='#login-modal'>&nbsp;Login&nbsp;</a>";
		//loginout = "<a href='/made/loginout.jsp'>&nbsp;Login&nbsp;</a>";
	} else {
		loginout = "&nbsp;<b>" + m.getNickName()
				+ "</b>님 환영합니다!&nbsp;&nbsp;<a href='/made/logout'>&nbsp;Logout&nbsp;</a>";
		addr = m.getAddress().split(",");
	}
%>
<script type="text/javascript" src="/made/js/jquery-1.10.2.min.js"></script>
<script src="/made/js/bootstrap.min.js"></script>

<!-- 서브메뉴 색상 변경 jQuery -->
<script>
	/* $(function() {
		//console.log("현 경로 : "+currentPath);
		$(".navbar-nav > li").each(
				function() {
					$(this).on('click',function(){
						$(".navbar-nav > li").not($(this)).removeClass('active');
			        	$(this).addClass('active');
					});
				});
	}); */
	 var currentPath = window.location.pathname.substr(window.location.pathname.lastIndexOf("/")+1);
	//console.log(currentPath);
	//console.log(window.location.pathname);
	$(function(){
		//console.log("현 경로 : "+currentPath);
		$(".navbar-nav > li").each(function(){
	        var usePage = $(this).children('a').attr('href').substr($(this).children('a').attr('href').lastIndexOf("/")+1);
	        //console.log(usePage);
	        if(currentPath == usePage){
	        	$(".navbar-nav > li").not($(this)).removeClass('active');
	        	$(this).addClass('active');
	        } else if(currentPath.indexOf("item") != -1 
	        		|| currentPath.indexOf("part") != -1
	        		|| currentPath.indexOf("design") != -1
	        		|| currentPath.indexOf("dDetail") != -1 
	        		|| currentPath.indexOf("pDetail") != -1
	        		|| currentPath.indexOf("pup") != -1
	        		|| currentPath.indexOf("dup") != -1){
                $(".navbar-nav > li").removeClass('active');
	        	$("li#item").addClass('active');
	        } else if(currentPath.indexOf("notice") != -1 || currentPath.indexOf("nlist") != -1 || currentPath.indexOf("ndetail") != -1){
                $(".navbar-nav > li").removeClass('active');
	        	$("li#notice").addClass('active');
            } else if (currentPath.indexOf("mypage") != -1 || currentPath.indexOf("order") != -1 || currentPath.indexOf("qlist") != -1  || currentPath.indexOf("qa") != -1 || currentPath.indexOf("qdetail") != -1 || currentPath.indexOf("qmlist") != -1){
            	$(".navbar-nav > li").removeClass('active');
	        	$("li#mypage").addClass('active');
            } else {
            	$(".navbar-nav > li").removeClass('active');
            	$(".navbar-nav > li").eq(0).addClass('active');
            }
	        //console.log("참조할 경로 : "+$(this).children('a').attr('href').substr($(this).children('a').attr('href').lastIndexOf("/")+1));
	    });
	}); 
</script>
<!-- 서브메뉴 색상 변경 End -->
<!-- Modal Start -->
<style type="text/css">
.modal-dialog {
    width: 300px;
}
.modal-footer {
    height: 70px;
    margin: 0;
}
.modal-footer .btn {
    font-weight: bold;
}
.input-group-addon {
    color: #fff;
    background: #3276B1;
}
.prettyline {
  height: 5px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}
</style>
<script type="text/javascript">
$(function(){
    $('.modal-footer > button').click(function(){
    	$.ajax({
			url : "/made/login",
			data : {id : $('#uLogin').val(), pwd : $('#uPassword').val()},
			type : "post",
			success : function(result){
				if(result == "ok"){
					alert("로그인 성공!");
					location.href = "/made/index.jsp";
				} else {
					alert("로그인 실패!! 입력값을 재확인 하세요!");
					location.href = "/made/index.jsp";
				}
			}, error : function(request,status,error) {
				alert("ERROR code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				location.href = "/made/404-page.jsp?message='로그인 서비스 실패'";
			}
		});
    	$('#login-modal').modal('hide');
	});
});
</script>
 <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<p class="modal-title" id="myModalLabel" align="center">
				<img src="/made/images/logo.png" style="height:30px; width:auto; margin-top: -6px;">
				&nbsp;&nbsp;<b style="font-size: 16pt;">Log in</b></p>
			</div> <!-- /.modal-header -->

			<div class="modal-body">
				<form role="form" id="loginform">
					<div class="form-group">
						<div class="input-group">
							<label for="uLogin" class="input-group-addon glyphicon glyphicon-user"></label>
							<input type="text" class="form-control" id="uLogin" placeholder="Login">
						</div>
					</div> <!-- /.form-group -->

					<div class="form-group">
						<div class="input-group">
							<label for="uPassword" class="input-group-addon glyphicon glyphicon-lock"></label>
							<input type="password" class="form-control" id="uPassword" placeholder="Password">
						</div> <!-- /.input-group -->
					</div> <!-- /.form-group -->
				</form>

			</div> <!-- /.modal-body -->

			<div class="modal-footer">
				<button class="form-control btn btn-default btn-block">Ok</button>
			</div> <!-- /.modal-footer -->

		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- Modal End -->

<!-- 로그인 여부를 확인하고 로그인 모달 창 호출 -->
<script type="text/javascript">
	$(function(){
		$('#mypage ul li a').on("click", function(){
			if($('a').first().text().trim() == "Login"){
				$("#login-modal").modal();
				return false;
			}
		});
	});
	function noticeErr(){
		alert("가입한 회원만 열람이 가능합니다.");
	};
</script>


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
						<!-- <li><%=request.getRequestURL()%></li> -->
						<li style="width: auto;"><%=loginout%></li>
						<%
							if (m == null) {
						%>
						<li><a
							href="/made/views/user/signup.jsp">&nbsp;회원가입&nbsp;</a></li>
						<%
							}
						%>
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
							<a href="/made/index.jsp"><img src="/made/images/logo.png"
								alt="Made" /></a>
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
						<li><a href="/made/index.jsp">Home</a></li>
						<% if(m == null) { %>
						<li id="notice"><a href="#" onclick="noticeErr();">공지사항</a></li>
						<% } else { %>
						<li id="notice"><a href="/made/nlist?page=1">공지사항</a></li>
						<% } %>
						<li id="item"><a href="#">DIY 상품</a>
							<ul class="dropdown-menu">
								<li><a href="/made/designitemlist?page=1">Designed</a></li>
								<li><a href="/made/partitemlist?page=1">Parts</a></li>
							</ul></li>

						<li id="mypage"><a href="#">마이페이지</a>
							<ul class="dropdown-menu">
								<li><a href="/made/llist">찜목록</a></li>
								<% if(m != null && m.getClassCode().equals("C")) {%>
									<li><a href="/made/corderlist">주문내역</a></li>
								<% } else if(m != null && m.getClassCode().equals("A")) { %>
									<li><a href="/made/aorderlist">주문내역</a></li>
								<% } else if(m != null && m.getClassCode().equals("D")) { %>
									<li><a href="/made/dorderlist">주문내역</a></li>
								<% } %>
								<li><a href="/made/views/mypage/myinfo.jsp">회원정보수정</a></li>
								<li><a href="/made/acheck?page=1">쪽지함</a></li>
								<% if(m != null && m.getClassCode().charAt(0) == 'A'){ %>
									<li><a href="/made/qlist?page=1">1:1문의확인</a></li>
									<%}else{ %>
									<li><a href="/made/qmlist?page=1">1:1문의</a></li>
									<%} %>
									<% if(m != null &&(m.getClassCode().equals("A") || m.getClassCode().equals("D"))) {%>
									<li><a href="/made/pview?mid=<%=m.getId()%>">수익 분석 차트</a></li>
									<%} %>
								</ul></li>
						<li><a href="/made/views/faq/faq.jsp">FAQ</a></li>
						<li><a href="/made/contact.jsp">Contact</a></li>
					</ul>
				</div>
			</div>
			<!--/.row -->
		</div>
		<!--/.container -->
	</div>
</header>