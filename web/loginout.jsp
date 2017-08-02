<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, member.model.vo.*"%>
<%
	Member member = (Member) session.getAttribute("member");
%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="ko">
<!--<![endif]-->
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>로그인 페이지 - MAːDÆ</title>
<meta name="description" content="">
<link rel="shortcut icon" href="images/icon.ico">
<!-- CSS FILES -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" data-name="skins">
<link rel="stylesheet" href="css/layout/wide.css" data-name="layout">

<link rel="stylesheet" href="css/fractionslider.css" />
<link rel="stylesheet" href="css/style-fraction.css" />

<link rel="stylesheet" type="text/css" href="css/switcher.css"
	media="screen" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	
	<!--Start Header-->
	<%@ include file="header.jsp" %>
	<!--End Header-->

	<!--start wrapper-->
	<section class="wrapper">
		<section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>로그인 페이지 - MAːDÆ</h2>
					</div>
				</div>
			</div>
		</section>
		<!--start info service-->
		<section class="content">
			<div class="container" id="loginForm">
				<%
					if (member == null) {
				%>
				<form action="login" method="post">
					<table>
						<tr>
							<td>아이디 : </td>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<td>비밀번호 : </td>
							<td><input type="password" name="pwd"></td>
						</tr>
						<tr>
							<td colspan="2"><p><br><input type="submit" class="btn btn-default" value="로그인">&nbsp;&nbsp;<a
								href="views/user/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%ED%8E%98%EC%9D%B4%EC%A7%80.html">&nbsp;회원가입&nbsp;</a></p></td>
						</tr>
					</table>
				</form>
				<%
					} else {
				%>
				<table>
					<tr>
						<td>환영합니다. <%=member.getName()%>님!!!!
						</td>
						<td><a href="logout">로그아웃</a></td>
					</tr>
				</table>
				<%
					}
				%>
			</div>
		</section>
	</section>
	<!--end wrapper-->
	<!--start footer-->
	<%@ include file="footer.jsp" %>
	<!--end footer-->
</body>
</html>