
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.Notice,noticereply.model.vo.NoticeReply, java.util.ArrayList, java.sql.Date" %>
<% 
ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
ArrayList<NoticeReply> list1=(ArrayList<NoticeReply>)request.getAttribute("list1");
int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
int startPage = ((Integer)request.getAttribute("startPage")).intValue();
int endPage = ((Integer)request.getAttribute("endPage")).intValue();
int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title> NOTICE - MAːDÆ</title>
	<meta name="description" content="">
	<link rel="shortcut icon" href="/made/images/icon.ico">
	<!-- CSS FILES -->
    <link rel="stylesheet" href="/made/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/made/css/style.css">
    <link rel="stylesheet" type="text/css" href="/made/css/style.css" media="screen" data-name="skins">
    <link rel="stylesheet" href="/made/css/layout/wide.css" data-name="layout">

    <link rel="stylesheet" href="/made/css/fractionslider.css"/>
    <link rel="stylesheet" href="/made/css/style-fraction.css"/>

    <link rel="stylesheet" type="text/css" href="/made/css/switcher.css" media="screen" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<!--Start Header-->
	<%@ include file="../../header.jsp" %>
	<!--End Header-->
<section class="wrapper">
       <section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>공지사항</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="../../index.html">Home</a></li>
                                <li>NOTICE</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
		<br>
        <div class="container">
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading hide"></div>

		<table class="board-list table">
			<thead>
			<tr class="header">
				<th width="*" class="text-left">제목</th>
				<th width="110px" class="text-center">작성자</th>
				<th width="90px" class="text-center">작성날짜</th>
			</tr>
			</thead>
			<%	for(Notice n : list){%>
			<tbody>
				<tr class="">                  
					<td class="title">
					<a href="/made/ndetail?nnum=<%=n.getNoticeCode()%>&page=<%=currentPage%>"><%=n.getNoticeTitle() %></a>
					</td>
					<td class="author">관리자</td>
					<td class="date">
						<%=n.getNoticeDate() %>
					</td>
				</tr>
			</tbody>
			<%} %>
		</table>
	</div>
	<%if(m.getClassCode().charAt(0)=='A'){ %>
	<button type="button" class="btn btn-default" onclick="top.location.href='/made/views/notice/notice.jsp'">공지사항 작성</button>
	<%} %>
	<%-- 페이지 번호 처리 --%>
	<div class="board-page text-center">
		<ul class="pagination">
			<li class="">
			<%  if(currentPage <= 1){	%>
					<span class="glyphicon glyphicon-chevron-left " style="color:blue"></span> &nbsp;
			<%  }else{ %>
					<a href="/made/nlist?page=<%= currentPage - 1 %>"><span class="glyphicon glyphicon-chevron-left"></span></a> &nbsp;
			<%  } %>
			</li>
			<li>
			<%  for(int p = startPage; p <= endPage; p++){ 
			if(p == currentPage){
				%><a style="color:blue"><%= p %></a>
			<%     }else{ %>
				<a href="/made/nlist?page=<%= p %>"><%= p %></a>
			<%  }}%>
			</li>
			
			<li class="">
			<% if(currentPage >= maxPage){ %>
				<span class="glyphicon glyphicon-chevron-right" style="color:blue">
			<% }else{ %>
				<a href="/made/nlist?page=<%= currentPage + 1 %>"><span class="glyphicon glyphicon-chevron-right"></a>
			<% } %>
			</li>
		</ul>
	</div>
</div>
    </section>
<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->

</body>
</html>