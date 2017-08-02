<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<!--start wrapper-->
	<section class="wrapper">
       <section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>QA 게시판</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li>QA</li>
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
                <% if ( m != null ) {%>
                <form method="post">
                <input type="hidden" value="<%=m.getId()%>" name="qaMember">
                    <div class="panel-body article">
                        <h4>1대1문의</h4>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5>제목 : <input style="text" name="title"></h5> </div>
                            <div class="panel-body content" align="center">
                                <textarea style="resize:none;width:95%;height:100%" name="content"></textarea>
                            </div>
                        </div>
                        <ul class="pager">
                            <li>
                                <button type="button" class="btn btn-default" onclick="top.location.href='/made/qlist'"> 보내기 </button>
                            </li>
                            <li>
                                <button type="button" class="btn btn-default" onclick="no()"> 취소 </button>
                            </li>
                        </ul>
                    </div>
                </form>
                <% } else { %>
                <h2>가입한 회원만 이용이 가능합니다.<br><a href='/made/loginout.jsp'>로그인 화면으로 넘어가기</a></h2>
                
                <% } %>
            </div>
</div>
    </section>

	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->

</body>
</html>