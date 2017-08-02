<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="consumer.model.vo.ConsumerOrder, java.sql.Date, java.util.ArrayList" %>    

<%
	ArrayList<ConsumerOrder> list = (ArrayList<ConsumerOrder>) request.getAttribute("list");
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Dafault_page - MAːDÆ</title>
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
						<h2>주문/배송 조회</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<!-- ■ ■ ■ ■ ■ 수정하기 ■ ■ ■ ■ ■ -->
								<li><a href="/made/index.jsp">Home</a></li>
								<li><a href="default_page.html">Shortcodes</a></li>
								<li>Typography</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        
        <!--- 여기에 내용을 작성해주세요~ --->
        
        <!-- <div class="container" style="border:1px dashed blue;"> -->
		<div class="container">
        		<div class="panel panel-default">
					<!-- ■ ■ ■ ■ ■ 자리 옮기기 ■ ■ ■ ■ ■ -->
					<style>
						table * {
							text-align : center;
						}
						button {
							border : none;
							padding-top : 2px;
							padding-bottom : 2px;
							margin : 2px;
							background : gray;
							/* #e74c3c */
							color : white;
						}
						button:hover {
							background : #e74c3c;
						}
						table span {
							font-weight: bold;
						}

						.c_product {
							/* border:1px dashed blue; */
							height : 100px;
						}
						.c_product_description {
							border:1px dashed red;
							clear : both; 
							display: table-cell;
  							vertical-align: middle;
						}
						img {
							float : left;
							width: 100px;
							height: 100%;
						}
					</style>
				
					<table class=table>
				  		<thead>
				  			<tr><th>주문일자/주문번호</th><th>상품정보</th><th>금액/수량</th><th>주문상태</th><th>관리</th></tr>
				  		</thead>
				  		<tbody>
				  		<% for(ConsumerOrder e : list) { %>
					  		<tr><td scope=row><%= e.getOrderDate() %><br>(<%= e.getOrderCode() %>)<br><button>영수증출력</button></td>
					  		<% if(e.getDesignCode() != null ) { %>
					  		<td><div class="c_product"><img alt="상품이미지" src="/made/images/items/designed/<%= e.getDesignImg() %>"><div class="c_product_description"><a href="#"><%= e.getDesignTitle() %></a></div></div></td><td><%= e.getDesignprice() * e.getOrderCount() %><br>(<%= e.getOrderCount() %>개)</td><td><span><%= e.getOrderStateName() %></span><br><button>상품리뷰</button><br>한진택배<br>121053968031<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
							<% } else { %>
							<td><div class="c_product">
								<% if(e.getPartCategory().equals("WOOD")){ %>
								<img alt="상품이미지" src="/made/images/items/parts/wood/<%= e.getPartImg() %>">
								<% } else if(e.getPartCategory().equals("STEEL")){ %>
								<img alt="상품이미지" src="/made/images/items/parts/steel/<%= e.getPartImg() %>">
								<% } else if(e.getPartCategory().equals("PLASTIC")){ %>
								<img alt="상품이미지" src="/made/images/items/parts/plastic/<%= e.getPartImg() %>">
								<% } %>
							<div class="c_product_description"><a href="#"><%= e.getPartTitle() %></a></div></div></td><td><%= e.getPartPrice() * e.getOrderCount() %><br>(<%= e.getOrderCount() %>개)</td><td><span><%= e.getOrderStateName() %></span><br><button>상품리뷰</button><br>한진택배<br>121053968031<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
							<% } %>
						<% } %>
					  	</tbody>
					</table>
				</div>

				<nav aria-label="Page navigation" style="text-align:center;">
				  <ul class="pagination pagination-sm">
				  
				    <li>
				   	  <% if(currentPage <= 1) { %>
				        <span aria-hidden="true">&laquo;</span>
				      <% } else { %>
				     	<a href="/made/corderlist?page=<%= currentPage - 1 %>" aria-label="Previous">
				        	<span aria-hidden="true">&laquo;</span>
				      	</a>
				      <% } %>
				    </li>
				    
				    <% for(int p = startPage; p<= endPage; p++) { %>
						<% if(p == currentPage) { %>
							<li class="active"><a href="#"><%= p %></a></li>
						<% } else { %>
							<li><a href="/made/corderlist?page=<%= p %>"><%= p %></a></li>
						<% } %>
					<% } %>
					
					<li>
					<% if(currentPage == maxPage) { %>
						<span aria-hidden="true">&raquo;</span>
					<% } else { %>
						<a href="/made/corderlist?page=<%= currentPage + 1 %>" aria-label="Next">
				        	<span aria-hidden="true">&raquo;</span>
				      	</a>
					<% } %>
					</li>
					
				  </ul>
				</nav>
        	</div>
    </section>

	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->

</body>
</html>