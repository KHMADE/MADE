<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="design.model.vo.*, member.model.vo.*, java.sql.*"%>
<%
	Design d = (Design) request.getAttribute("design");
	int oriPrice = (int) request.getAttribute("oriPrice");
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
<title><%=d.getDesignName()%> Detail - MAːDÆ</title>
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
<style>
button#like {
	background: #fcabdd;
	color: black;
}

button#like:hover {
	background: black;
	color: #fcabdd;
}
</style>
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
						<h2>
							Item
							<%=d.getDesignName()%></h2>
					</div>
				</div>
			</div>
		</section>
		<section class="content portfolio_single">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-7 col-md-7 col-sm-7">
						<!--Project Details Page-->
						<div class="porDetCarousel">
							<div class="carousel-content">
								<img class="carousel-item active"
									style="width: 500px; height: 400px;"
									src="/made/images/items/designed/<%=d.getDesignImg()%>" alt="">
							</div>
						</div>
					</div>
					<div class="col-lg-5 col-md-5 col-sm-5">
						<div class="project_details">
							<div class="widget_title">
								<h4>
									<span>Item Purchase</span>
								</h4>
							</div>
							<ul class="details">
								<li><span>Designed by </span><%=d.getDesignerId()%></li>
								<li><span>재질:</span><%=d.getDesignCategory()%></li>
								<li><span>디자인 가격:</span><%=d.getDesignPrice()%>원</li>
								<li><span>완제품 구매:</span><input type="checkbox" name="chk"
									id="chk"></li>
								<li><span>구매수량 :</span><input type="number" name="quan"
									min="1" max="99" value="1" id="quan"></li>
								<li><span>총 가격 :</span><input type="number" id="price"
									name="price" readonly></li>
							</ul>
							<br>
							<p align="center"><% if(m != null){ %>
								<button class="btn btn-default" id="like">♥</button>
								&nbsp;&nbsp;
								<button class="btn btn-default" onclick="pay_test();">구매하기</button>
								<% } %>
							</p>
						</div>
					</div>
				</div>
				<div class="row sub_content">
					<div class="col-lg-6">
						<div class="dividerHeading">
							<h4>
								<span>Item Descriptions</span>
							</h4>
						</div>
						<ul class="nav nav-tabs" id="myTab">
							<li class="active"><a data-toggle="tab" href="#Popular">상품설명</a></li>
							<li class=""><a data-toggle="tab" href="#Recent">상품설계도</a></li>
							<li class=""><a data-toggle="tab" href="#Recent-Comment">Comment</a></li>
						</ul>
						<div class="tab-content clearfix" id="myTabContent">
							<div id="Popular" class="tab-pane fade active in">
								상품 설명
								<%=d.getDesignDesc()%></div>
							<div id="Recent" class="tab-pane fade">상품 설계도.</div>
							<div id="Recent-Comment" class="tab-pane fade">
								<ul class="comments">
									<li class="comments_list clearfix"><a href="#"
										class="post-thumbnail"><img width="60" height="60" alt="#"
											src="images/content/recent_3.png"></a>
										<p>
											<strong><a href="#">LaraDut</a> <i>says: </i> </strong> Morbi
											augue velit, tempus mattis dignissim nec, porta sed risus.
											Donec eget magna eu lorem tristique pellentesque eget eu dui.
											Fusce lacinia tempor malesuada.
										</p></li>
									<li class="comments_list clearfix"><a href="#"
										class="post-thumbnail"><img width="60" height="60" alt="#"
											src="images/content/recent_1.png"></a>
										<p>
											<strong><a href="#">Ronny</a> <i>says: </i> </strong> Tempus
											mattis dignissim nec, porta sed risus. Donec eget magna eu
											lorem tristique pellentesque eget eu dui. Fusce lacinia
											tempor malesuada.
										</p></li>
									<li class="comments_list clearfix"><a href="#"
										class="post-thumbnail"><img width="60" height="60" alt="#"
											src="images/content/recent_2.png"></a>
										<p>
											<strong><a href="#">Steve</a> <i>says: </i> </strong> Donec
											convallis, metus nec tempus aliquet, nunc metus adipiscing
											leo, a lobortis nisi dui ut odio. Nullam ultrices, eros
											accumsan vulputate faucibus, turpis tortor.
										</p></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row sub_content">
					<div class="carousel-intro">
						<div class="col-md-12">
							<div class="dividerHeading">
								<h4>
									<span>Recent Work</span>
								</h4>
							</div>
							<div class="carousel-navi">
								<div id="work-prev" class="arrow-left jcarousel-prev">
									<i class="fa fa-angle-left"></i>
								</div>
								<div id="work-next" class="arrow-right jcarousel-next">
									<i class="fa fa-angle-right"></i>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="jcarousel recent-work-jc">
						<ul class="jcarousel-list">
							<!-- Recent Work Item -->
							<li class="col-sm-3 col-md-3 col-lg-3">
								<div class="recent-item">
									<figure>
										<div class="touching medium">
											<img src="images/portfolio/portfolio_1.png" alt="" />
										</div>
										<div class="option">
											<a href="images/portfolio/full/portfolio_1.png"
												class="hover-zoom mfp-image"><i class="fa fa-search"></i></a>
											<a href="portfolio_single.html" class="hover-link"><i
												class="fa fa-link"></i></a>
										</div>
										<figcaption class="item-description">
											<h5>Touch and Swipe</h5>
											<span>Technology</span>
										</figcaption>
									</figure>
								</div>
							</li>
							<!-- Recent Work Item -->
							<li class="col-sm-3 col-md-3 col-lg-3">
								<div class="recent-item">
									<figure>
										<div class="touching medium">
											<img src="images/portfolio/portfolio_2.png" alt="" />
										</div>
										<div class="option">
											<a href="images/portfolio/full/portfolio_1.png"
												class="hover-zoom mfp-image"><i class="fa fa-search"></i></a>
											<a href="portfolio_single.html" class="hover-link"><i
												class="fa fa-link"></i></a>
										</div>
										<figcaption class="item-description">
											<h5>Touch and Swipe</h5>
											<span>Technology</span>
										</figcaption>
									</figure>
								</div>
							</li>
							<!-- Recent Work Item -->
							<li class="col-sm-3 col-md-3 col-lg-3">
								<div class="recent-item">
									<figure>
										<div class="touching medium">
											<img src="images/portfolio/portfolio_3.png" alt="" />
										</div>
										<div class="option">
											<a href="images/portfolio/full/portfolio_1.png"
												class="hover-zoom mfp-image"><i class="fa fa-search"></i></a>
											<a href="portfolio_single.html" class="hover-link"><i
												class="fa fa-link"></i></a>
										</div>
										<figcaption class="item-description">
											<h5>Touch and Swipe</h5>
											<span>Technology</span>
										</figcaption>
									</figure>
								</div>
							</li>
							<!-- Recent Work Item -->
							<li class="col-sm-3 col-md-3 col-lg-3">
								<div class="recent-item">
									<figure>
										<div class="touching medium">
											<img src="images/portfolio/portfolio_4.png" alt="" />
										</div>
										<div class="option">
											<a href="images/portfolio/full/portfolio_1.png"
												class="hover-zoom mfp-image"><i class="fa fa-search"></i></a>
											<a href="portfolio_single.html" class="hover-link"><i
												class="fa fa-link"></i></a>
										</div>
										<figcaption class="item-description">
											<h5>Touch and Swipe</h5>
											<span>Technology</span>
										</figcaption>
									</figure>
								</div>
							</li>
							<!-- Recent Work Item -->
							<li class="col-sm-3 col-md-3 col-lg-3">
								<div class="recent-item">
									<figure>
										<div class="touching medium">
											<img src="images/portfolio/portfolio_5.png" alt="" />
										</div>
										<div class="option">
											<a href="images/portfolio/full/portfolio_1.png"
												class="hover-zoom mfp-image"><i class="fa fa-search"></i></a>
											<a href="portfolio_single.html" class="hover-link"><i
												class="fa fa-link"></i></a>
										</div>
										<figcaption class="item-description">
											<h5>Touch and Swipe</h5>
											<span>Technology</span>
										</figcaption>
									</figure>
								</div>
							</li>
							<!-- Recent Work Item -->
							<li class="col-sm-3 col-md-3 col-lg-3">
								<div class="recent-item">
									<figure>
										<div class="touching medium">
											<img src="images/portfolio/portfolio_1.png" alt="" />
										</div>
										<div class="option">
											<a href="images/portfolio/full/portfolio_1.png"
												class="hover-zoom mfp-image"><i class="fa fa-search"></i></a>
											<a href="portfolio_single.html" class="hover-link"><i
												class="fa fa-link"></i></a>
										</div>
										<figcaption class="item-description">
											<h5>Touch and Swipe</h5>
											<span>Technology</span>
										</figcaption>
									</figure>
								</div>
							</li>
							<!-- Recent Work Item -->
							<li class="col-sm-3 col-md-3 col-lg-3">
								<div class="recent-item">
									<figure>
										<div class="touching medium">
											<img src="images/portfolio/portfolio_2.png" alt="" />
										</div>
										<div class="option">
											<a href="images/portfolio/full/portfolio_1.png"
												class="hover-zoom mfp-image"><i class="fa fa-search"></i></a>
											<a href="portfolio_single.html" class="hover-link"><i
												class="fa fa-link"></i></a>
										</div>
										<figcaption class="item-description">
											<h5>Touch and Swipe</h5>
											<span>Technology</span>
										</figcaption>
									</figure>
								</div>
							</li>
							<!-- Recent Work Item -->
							<li class="col-sm-3 col-md-3 col-lg-3">
								<div class="recent-item">
									<figure>
										<div class="touching medium">
											<img src="images/portfolio/portfolio_3.png" alt="" />
										</div>
										<div class="option">
											<a href="images/portfolio/full/portfolio_1.png"
												class="hover-zoom mfp-image"><i class="fa fa-search"></i></a>
											<a href="portfolio_single.html" class="hover-link"><i
												class="fa fa-link"></i></a>
										</div>
										<figcaption class="item-description">
											<h5>Touch and Swipe</h5>
											<span>Technology</span>
										</figcaption>
									</figure>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</section>
	<!--End wrapper-->
		<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
	<script>
		var price = <%=oriPrice%>
		$(function(){
			$("#price").val(price);
			$("#chk").change(function(){
		        if($(this).is(":checked")){
		        	$("#price").val($("#quan").val()*<%=d.getDesignPrice()%>);
		        }else{
		        	$("#price").val($("#quan").val()*price);
		        }
		    });
			$("#quan").on("change",function(){
				if($("#chk").is(":checked")){
					$("#price").val($("#quan").val()*<%=d.getDesignPrice()%>);
				} else {
					$("#price").val($("#quan").val()*price);
				}
			});
		});
	</script>
	<!-- I'm Port 전자결제 -->
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script>
		var IMP = window.IMP; // 생략가능
		$(function() {
			IMP.init('imp99940489');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// 문서 로딩될 때 바로 호출
		function pay_test() {
			IMP.request_pay({
				pg : 'kakao',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:<%=d.getDesignName() %>',
				amount : $('#price').val(),
				buyer_email : '<%=m.getEmail()%>',
				buyer_name : '<%=m.getName()%>',
				buyer_tel : '<%=m.getPhone()%>',
				buyer_addr : '<%=addr[1]+" "+addr[2]%>',
				buyer_postcode : '<%=addr[0]%>',
			    kakaoOpenApp : true
			}, function(rsp) {
				if (rsp.success) {
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
						type : 'POST',
						dataType : 'json',
						data : {
							imp_uid : rsp.imp_uid
						//기타 필요한 데이터가 있으면 추가 전달
						}
					}).done(function(data) {
						//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if (everythings_fine) {
							var msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
							alert(msg);
						} else {
							//[3] 아직 제대로 결제가 되지 않았습니다.
							//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
		};
	</script>
	<!--------------------->
</body>
</html>