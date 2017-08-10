<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="like.model.vo.Like, java.sql.Date, java.util.ArrayList" %>    

<%
	ArrayList<Like> list = (ArrayList<Like>) request.getAttribute("list");
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
	<title>찜 목록 리스트 - MAːDÆ</title>
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
    
<style>
	table * {
		text-align : center;
		vertical-align: middle;
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
	.c_review_image_div {
        		float: left;
   	}
	.c_review_image_div li {
		list-style-type: none;
		float: left;
	    position: relative;
	    width: 68px;
	    height: 68px;
	    margin-right: 10px;
	    border: 1px solid #dbdbdb;
	}
</style>
				
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
						<h2>찜 목록 리스트</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li>마이페이지</li>
								<li>찜 목록 조회</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        
        <!--- 여기에 내용을 작성해주세요~ --->
        
		<div class="container">
        		<div class="panel panel-default">
					<input type="hidden" id="m_id" value="<%=m.getId()%>">
					<% if(list.size() != 0) { %>
					<table class="table">
				  		<thead>
				  			<tr><th>상품정보</th><th>금액/수량</th><th>취소</th></tr>
				  		</thead>
				  		<tbody>
				  		<% for(Like e : list) { %>
					  		<tr>
					  		
					  		
					  		<% if(e.getDesignCode() != null ) { %>
					  		<td><div class="c_product"><img alt="상품이미지" src="/made/images/items/designed/<%= e.getDesignImg() %>">
					  		<div class="c_product_description"><a href="/made/dDetail?id=<%= e.getDesignCode() %>"><%= e.getDesignTitle() %></a></div></div></td><td><%= e.getDesignprice() %></td><td><button class="btn btn-default like_design" id="like<%= e.getDesignCode() %>">♥ 찜 취소</button></tr>
							
							<% } else { %>
							<td><div class="c_product">
								<% if(e.getPartCategory().equals("WOOD")){ %>
								<img alt="상품이미지" src="/made/images/items/parts/wood/<%= e.getPartImg() %>">
								<% } else if(e.getPartCategory().equals("STEEL")){ %>
								<img alt="상품이미지" src="/made/images/items/parts/steel/<%= e.getPartImg() %>">
								<% } else if(e.getPartCategory().equals("PLASTIC")){ %>
								<img alt="상품이미지" src="/made/images/items/parts/plastic/<%= e.getPartImg() %>">
								<% } %>
							<div class="c_product_description"><a href="/made/pDetail?id=<%= e.getPartCode() %>"><%= e.getPartTitle() %></a></div></div></td><td><%= e.getPartPrice() %></td><td><button class="btn btn-default like_part" id="like<%= e.getPartCode() %>">♥ 찜 취소</button></td></tr>
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
				<% } else { %>
				<table class="table">
					<thead>
				  		<tr><th>상품정보</th><th>금액/수량</th><th>취소</th></tr>
				  	</thead>
				  	<tbody>
				  		<tr><td colspan="3" align="center"><h3>현재 찜하신 아이템이 없습니다. ㅠㅜ</h3></td></tr>
				  	</tbody>
				</table>
				<% } %>
        	</div>
    </section>

	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
<script type="text/javascript">
$(".like_design").on('click',function(){
	var thisLike = $(this);
	var code = $(this).attr("id").substring(4);
	$.ajax({
		url : "/made/designLike",
		type : "post",
		data : {
			like : 1,
			mid : $("#m_id").val(),
			did : code
		},
		success : function(data) {
			thisLike.parent().parent().remove();
			alert("찜하기가 해제 되었습니다.");
		},
		error : function(request,status,error) {
			alert("오류");
		}
	});
});
$(".like_part").on('click',function(){
	var thisLike = $(this);
	var code = $(this).attr("id").substring(4);
	$.ajax({
		url : '/made/partLike',
		type : 'post',
		data : {
			like : 1,
			mid : $("#m_id").val(),
			pid : code
		},
		success : function(data) {
			thisLike.parent().parent().remove();
			alert("찜하기가 해제 되었습니다.");
		},
		error : function(request,status,error) {
			alert("오류");
		}
	});
});
</script>
</body>
</html>