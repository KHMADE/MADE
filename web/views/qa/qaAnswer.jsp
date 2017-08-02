<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qa.model.vo.Qa, java.util.*, java.sql.Date" %>
<%	
	Qa q = (Qa)request.getAttribute("qa");	
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	
%>  
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title> QA - MAːDÆ</title>
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
        <div class="container">
	<div class="page-header">
		<h1>쪽지확인</h1>
	</div>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading hide"></div>

			<form method="post">
				<div class="panel-body article">
					<h4>
						<%=q.getQaTitle() %>
					</h4>

					<div class="panel panel-default">
						<div class="panel-heading">
							<span class="label label-info">보낸 아이디 </span>&nbsp;
                            <%=q.getMemberId() %>
							<span class="label label-info">
								보낸 날짜
							</span>&nbsp;
                            <%=q.getQaDate() %>
						</div>
						<div class="panel-body content">
						<%=q.getQaContents() %>
						</div>
						
					</div>
					<h4>
						운영자가 보낸 답장 메세지
					</h4>
			            <div>
						    <h4>ㅎㅎㅎㅎ</h4>
						  </div>
			       
					<ul class="pager">
							<li>
							<button type="button" class="btn btn-default" onclick="top.location.href='/qdetail'">삭제</button>
							</li>
						
						<li>
							<button type="button" class="btn btn-default" onclick="top.location.href='%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20main.html'">
								목록보기
							</button>
						</li>
					</ul>
				</div>
			</form>
		
	</div>
</div>
    </section>
    <!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
</body>
</html>