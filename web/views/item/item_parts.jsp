<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="part.model.vo.Part, member.model.vo.*, java.util.*"%>
<%
	ArrayList<Part> list = (ArrayList<Part>) request.getAttribute("list");
 	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
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
<title>Parts - MAːDÆ</title>
<meta name="description" content="">
<link rel="shortcut icon" href="/made/images/icon.ico">
<!-- CSS FILES -->
<link rel="stylesheet" href="/made/css/bootstrap.min.css" />
<link rel="stylesheet" href="/made/css/style.css">
<link rel="stylesheet" type="text/css" href="/made/css/style.css"
	media="screen" data-name="skins">
<link rel="stylesheet" href="/made/css/layout/wide.css"
	data-name="layout">
<link rel="stylesheet" href="/made/css/fractionslider.css" />
<link rel="stylesheet" href="/made/css/style-fraction.css" />
<link rel="stylesheet" type="text/css" href="/made/css/switcher.css"
	media="screen" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.touching img {
	width: 250px;
	height: 250px;
}
</style>
</head>

<body>

	<!--Start Header-->
	<%@ include file="../../header.jsp"%>
	<!--End Header-->

	<!--start wrapper-->
	<section class="wrapper">
		<section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>Parts Item</h2>
						<%
							if (m != null && m.getClassCode().equals("A")) {
						%>
						&nbsp;&nbsp;&nbsp;
						<button class="btn btn-default"
							onclick="location.href='/made/views/item/partInsertForm.jsp';">글 등록하기</button>
						<%
							}
						%>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li>Parts</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
		<section class="content portfolio large-images">
			<div class="container">
				<div class="row sub_content">
					<div class="row">
						<!--begin isotope -->
						<div class="col-lg-12 isotope">
							<!--begin portfolio filter -->
							<ul id="filter">
								<li data-filter="*" class="selected"><a href="#">All</a></li>
								<li data-filter=".WOOD"><a href="#">Wood</a></li>
								<li data-filter=".STEEL"><a href="#">Steel</a></li>
								<li data-filter=".PLASTIC"><a href="#">Plastic</a></li>
								<li data-filter=".ETC"><a href="#">ETC</a></li>
							</ul>
							<!--end portfolio filter -->
							<!--begin portfolio_list -->
							<ul id="list" class="portfolio_list clearfix ">
								<%
									for (Part p : list) {
								%>
								<!--begin List Item -->
								<li class="list_item col-sm-6 <%=p.getPartCategory()%>">
									<div class="recent-item">
										<figure>
											<div class="touching medium">
												<img
													src="/made/images/items/parts/<%=p.getPartCategory().toLowerCase() + "/" + p.getPartImg()%>"
													alt="" />
											</div>
											<div class="option">
												<a
													href="/made/images/items/parts/<%=p.getPartCategory().toLowerCase() + "/" + p.getPartImg()%>"
													class="hover-zoom mfp-image"><i class="fa fa-search"></i></a>
												<%
													if (m != null) {
												%>
												<a href="pDetail?id=<%=p.getPartId()%>&page=<%=currentPage%>" class="hover-link"><i
													class="fa fa-link"></i></a>
												<%
													}
												%>
											</div>
											<figcaption class="item-description">
												<h5>상세보기</h5>
												<span><%=p.getPartName()%></span>
											</figcaption>
										</figure>
									</div>
								</li>
								<!--end List Item -->
								<%
									}
								%>
							</ul>
							<!--end portfolio_list -->
						</div>
						<!--end isotope -->

						<!-- 페이지 번호 처리 -->
						<div class="col-lg-7 col-md-7 col-sm-7">
							<ul class="pagination pull-right mrgt-0">
								<%
									if (currentPage <= 1) {
								%>
								<li><a href="#">&laquo;</a></li>
								<%
									} else {
								%>
								<li><a href="/made/partitemlist?page=<%=currentPage-1%>">&laquo;</a></li>
								&nbsp;
								<%
									}
								%>
								<!-- 페이지 숫자 보여주기  -->
								<%
									for (int p = startPage; p <= endPage; p++) {
										if (p == currentPage) {
								%><li class="active"><a href="#"><%=p%></a></li>
								<%
									} else {
								%>
								<li><a href="/made/partitemlist?page=<%=p%>"><%=p%></a></li>
								<%
									}
									} //else and for close
								%>
								<%
									if (currentPage >= maxPage) {
								%>
								<li><a href="#">&raquo;</a></li>
								<%
									} else {
								%>
								<li><a href="/made/partitemlist?page=<%=currentPage + 1%>">&raquo;</a></li>
								<%
									}
								%>
							</ul>
						</div>
						<!-- 페이지 번호 처리 -->
					</div>
				</div>
				<!--./row-->
			</div>
			<!--./div-->
		</section>
	</section>
	<!--End wrapper-->

	<!--start footer-->
	<%@ include file="../../footer.jsp"%>
	<!--end footer-->
</body>
</html>