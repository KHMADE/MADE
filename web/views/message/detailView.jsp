<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="message.model.vo.Message, java.util.*, java.sql.Date" %>
<%	
	Message msg = (Message)request.getAttribute("message");	
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	
%>  
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title> Note - MAːDÆ</title>
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
		<h1>쪽지</h1>
	</div>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading hide"></div>

			
				<div class="panel-body article">
					<h4>
						<%=msg.getMessageTitle() %>
					</h4>
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<span class="label label-info" name="send">보낸 아이디 </span>&nbsp;
                            <%=msg.getMessageSenderId() %>
                            <span class="label label-info">받는 아이디 </span>&nbsp;
                            <%=msg.getMessageRecipientId() %>
							<span class="label label-info">
								보낸 날짜
							</span>&nbsp;
                            <%=msg.getMessageDate() %>
						</div>
						<div class="panel-body content">
						<%=msg.getMessageContents() %>
						</div>
					</div>
					
				<ul class="pager">
						<li>
							<button type="button" class="btn btn-default" onclick="top.location.href='/made/delete?mcode=<%=msg.getMessageCode() %>&send=<%=msg.getMessageSenderId()%>'">
								삭제하기
							</button>
							<button type="button" class="btn btn-default" onclick="javascript:history.back();">
								뒤로가기
							</button>
							
						</li>
					</ul>
				</div>
			
		
	</div>
</div>
    </section>
    
	
  <!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
</body>
</html>
