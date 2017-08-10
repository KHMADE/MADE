<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.sql.Date, 
	design.model.vo.Design, part.model.vo.Part, java.util.ArrayList" %>
<%
//Design d = (Design) request.getAttribute("design");
//Part p = (Part) request.getAttribute("part");

SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-DD");
String item = request.getParameter("item");
String date = df.format(new Date(Long.parseLong(request.getParameter("date"))));
String nick = (String) request.getParameter("nick");
String payType = (String) request.getParameter("pay_method");
int quan = Integer.parseInt(request.getParameter("quan"));
int price = Integer.parseInt(request.getParameter("price"));

switch(payType){
case "card": payType = "신용카드 결제"; break;
case "trans": payType = "실시간계좌이체 결제"; break;
case "vbank": payType = "가상계좌 결제"; break;
case "phone": payType = "휴대폰소액결제 결제"; break;
case "samsung": payType = "삼성페이 결제"; break;
case "kpay": payType = "KPay앱 결제"; break;
case "cultureland": payType = "문화상품권 결제"; break;
case "smartculture": payType = "스마트문상 결제"; break;
case "happymoney": payType = "해피머니 결제"; break;
default:
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Order Confirm - MAːDÆ</title>
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
						<h2><%=item %>주문 확인 페이지</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li>my page</li>
								<li>Order Confirm</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
    <div class="container">
        <div class="row sub_content">
			<div class="col-lg-12 col-md-12 col-sm-10 col-xs-12">
				<div class="dividerHeading">
				<h4><span><%=item %>결제 확인 내역</span></h4>
				</div>
					<blockquote class="default">
					<p align="center"><span class="dropcap default">∴ </span><font id="totPrice" style="font-size:17pt;">총 구매 가격 : <i class="fa fa-won"></i>&nbsp;&nbsp;<%= price%></font></p>
					<p style="font-size: 15pt;"><%= date %>, <%=nick %>님의 <%=payType %>가 정상적으로 이루어졌습니다.<br>이용해 주셔서 감사합니다 ♥ </p>
						<p align="center">
						<% if(item.equals("design")){ %>
						<button class="btn btn-success btn-lg" onclick="location.href='/made/designitemlist?page=1';"> 확 인 </button>
						<%} else { %>
						<button class="btn btn-success btn-lg" onclick="location.href='/made/partitemlist?page=1';"> 확 인 </button>
						<%} %>
						</p>
						</blockquote>
					</div>
				</div>
			</div>
    </section>

	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->

</body>
</html>