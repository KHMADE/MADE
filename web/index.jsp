<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*"%>
<%
	Member m = (Member) session.getAttribute("member");
	String loginout;
	if (m == null) {
		loginout = "<a href='loginout.jsp'>&nbsp;Login&nbsp;</a>";
	} else {
		loginout = "&nbsp;<b>"+m.getNickName()+"</b>님 환영합니다!&nbsp;&nbsp;<a href='logout'>&nbsp;Logout&nbsp;</a>";
	}
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
<title>MAːDÆ - The unique what you made</title>
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
	<header id="header" class="clearfix">
		<div id="top-bar">
			<div class="container">
				<div class="row">
					<div class="col-sm-7 hidden-xs top-info">
						<!--                        <span><i class="fa fa-phone"></i>Phone: (123) 456-7890</span>
                        <span><i class="fa fa-envelope"></i>Email: firerain4@naver.com</span>-->
					</div>
					<div class="col-sm-5 top-info">
						<ul>
							<li style="width: auto;"><%=loginout%></li>
							<li><a
								href="views/user/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%ED%8E%98%EC%9D%B4%EC%A7%80.html">&nbsp;회원가입&nbsp;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- LOGO bar -->
		<div id="logo-bar" class="clearfix">
			<!-- Container -->
			<div class="container">
				<div class="row">
					<!-- Logo / Mobile Menu -->
					<div class="col-xs-12">
						<div id="logo" style="width: 170px;">
							<h1>
								<a href="index.jsp"><img src="images/logo.png" alt="Eve" /></a>
							</h1>
						</div>
					</div>
				</div>
			</div>
			<!-- Container / End -->
		</div>
		<!--LOGO bar / End-->

		<!-- Navigation
================================================== -->
		<div class="navbar navbar-default navbar-static-top" role="navigation">
			<div class="container">
				<div class="row">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="index.jsp">Home</a></li>
							<li><a href="views/notice/공지사항 main.jsp">공지사항</a></li>
							<li><a href="#">DIY 상품</a>
								<ul class="dropdown-menu">
									<li><a href="views/item/item_designed.html">Designed</a></li>
									<li><a href="views/item/item_parts.html">Parts</a></li>
								</ul></li>

							<li><a href="views/mypage/order_page.html">마이페이지</a>
								<ul class="dropdown-menu">
									<li><a href="views/mypage/myinfo.html">My page</a></li>
									<li><a href="views/mypage/order_page.html">주문내역</a></li>
									<li><a href="views/mypage/myinfo.html">회원정보수정</a></li>
									<li><a href="views/mypage/myinfo.html">쪽지함</a></li>
									<li><a href="views/mypage/myinfo.html">1:1문의</a></li>
								</ul></li>
							<li><a href="views/faq/faq.html">FAQ</a></li>
							<li><a href="contact.html">Contact</a></li>
						</ul>
					</div>
				</div>
				<!--/.row -->
			</div>
			<!--/.container -->
		</div>
	</header>
	<!--End Header-->

	<!--start wrapper-->
	<section class="wrapper">
		<div class="slider-wrapper">
			<div class="slider">
				<div class="fs_loader"></div>
				<div class="slide">
					<!--1- slide background-->
					<img src="images/fraction-slider/gadgets/laptop-lg.png"
						data-position="-30,550" data-in="bottom" data-delay="500"
						data-out="fade" width="800" height="750">
					<!--3- laptop-->

					<p class="para-new" data-position="10,600" data-in="top"
						data-out="Right" data-delay="">Welcome to MAːDÆ</p>
				</div>
				<div class="slide">
					<img src="images/fraction-slider/main1_fix.jpg" data-in="fade"
						data-delay="" data-out="fade" width="1920" height="auto">
					<!--2- slide background-->

					<img src="images/fraction-slider/2_fix.png" width="500"
						height="auto" data-position="8,1240" data-in="bottomLeft"
						data-delay="500" data-out="fade" style="width: auto; height: auto">

					<p class="claim light-pink" data-position="40,230" data-in="top"
						data-out="left" data-delay="1800" data-ease-in="easeOutBounce">당신만의
						특별한 아이템!</p>

					<p class="teaser turky small" data-position="150,230"
						data-in="left" data-out="left" data-delay="5500">원하는 디자인 차용</p>

					<p class="teaser turky small" data-position="210,230"
						data-in="left" data-out="left" data-delay="6500">디자이너와 소통</p>

					<p class="teaser turky small" data-position="270,230"
						data-in="left" data-out="left" data-delay="8000">부담없는 자재가격</p>

					<p class="teaser turky small" data-position="150,670"
						data-in="right" data-out="right" data-delay="5500">내가 만드는 특별함</p>

					<p class="teaser turky small" data-position="210,670"
						data-in="right" data-out="right" data-delay="6500">완제품도 구매 가능</p>

					<p class="teaser turky small" data-position="270,670"
						data-in="right" data-out="right" data-delay="8000">설계도면 제공</p>
				</div>
				<div class="slide">
					<img src="images/fraction-slider/main2_fix.jpg" data-in="fade"
						data-out="fade" width="1920" height="auto" />
					<!--3- slide background-->

					<p class="claim light-pink" data-position="30,250" data-in="top"
						data-out="top" data-ease-in="easeOutBounce" data-delay="1500">쉽게
						제작 가능</p>

					<p class="claim  theme-colored" data-position="110,250"
						data-in="left" data-out="Right" data-delay="2500">원하는 디자인도 가능</p>

					<img src="images/fraction-slider/gadgets/laptop.png" width="456"
						height="272" data-position="103,1180" data-in="bottom"
						data-out="bottom" data-delay="400"> <img
						src="images/fraction-slider/gadgets/mack.png" width="357"
						height="313" data-position="60,1040" data-in="top"
						data-out="bottom" data-delay="200"> <img
						src="images/fraction-slider/gadgets/ipad.png" width="120"
						height="170" data-position="230,1030" data-in="left"
						data-delay="300" data-out="left"> <img
						src="images/fraction-slider/gadgets/smartphone.png" width="70"
						height="140" data-position="270,1320" data-in="right"
						data-delay="300" data-out="right">

					<div class="para-2" data-position="200,250" data-in="left"
						data-out="right" data-delay="3000">디자이너와 자재를 Join하여, 누구나 저렴한
						가격으로 원하는 제품을 만들 수 있도록 하자는 목표로 자유롭게 독창적인 제품 제작이 가능하며,이를 위한 디자이너와의
						1:1 소통도 지원합니다.</div>
				</div>
				<div class="slide">
					<img src="images/fraction-slider/main3_fix.jpg" data-in="fade"
						data-out="fade" width="1920" height="auto">
					<!--4- slide background-->

					<p class="claim light-pink" data-position="50,1050" data-in="top"
						data-out="top" data-ease-in="jswing">우리가 고객맞춤형 특화 서비스!</p>

					<p class="teaser turky" data-position="120,1180" data-in="left"
						data-delay="1500">자재별 제품군 나열</p>

					<p class="teaser turky" data-position="170,1180" data-in="left"
						data-delay="3000">제품 설계 도면 제공</p>

					<p class="teaser turky" data-position="220,1180" data-in="left"
						data-delay="4500" data-out="none">도소매 기준가</p>

					<p class="teaser turky" data-position="270,1180" data-in="left"
						data-delay="5500" data-out="none">1:1 친절 상담</p>

					<img src="images/fraction-slider/4_fix.png" width="480"
						height="480" data-position="-20,250" data-in="right"
						data-delay="500" data-out="fade" style="width: auto; height: auto">
				</div>
			</div>
		</div>
		<!--End Slider-->

		<!--start info service-->
		<section class="info_service">
			<div class="container">
				<div class="row sub_content">
					<div class="rs_box">
						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-laptop"></i>
									<h3>Modern Design</h3>
								</div>
								<div class="fr_content">
									<p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean
										commodo ligula eget dolor. Cum sociis natoque penatibus mag
										dis parturient.</p>
									<a class="read" href="#">Read more</a>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-heart"></i>
									<h3>Clean &amp; Minimal</h3>
								</div>
								<div class="fr_content">
									<p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean
										commodo ligula eget dolor. Cum sociis natoque penatibus mag
										dis parturient.</p>
									<a class="read" href="#">Read more</a>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-trophy"></i>
									<h3>Branding Theme</h3>
								</div>
								<div class="fr_content">
									<p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean
										commodo ligula eget dolor. Cum sociis natoque penatibus mag
										dis parturient.</p>
									<a class="read" href="#">Read more</a>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="row sub_content">
					<div class="rs_box">
						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-gear"></i>
									<h3>Easy To Customize</h3>
								</div>
								<div class="fr_content">
									<p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean
										commodo ligula eget dolor. Cum sociis natoque penatibus mag
										dis parturient.</p>
									<a class="read" href="#">Read more</a>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-volume-off"></i>
									<h3>Multimedia Support</h3>
								</div>
								<div class="fr_content">
									<p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean
										commodo ligula eget dolor. Cum sociis natoque penatibus mag
										dis parturient.</p>
									<a class="read" href="#">Read more</a>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-suitcase"></i>
									<h3>Documentation</h3>
								</div>
								<div class="fr_content">
									<p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean
										commodo ligula eget dolor. Cum sociis natoque penatibus mag
										dis parturient.</p>
									<a class="read" href="#">Read more</a>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
		<!--end info service-->

		<!--Start recent work-->
		<section class="latest_work">
			<div class="container">
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
											<a href="images/portfolio/full/portfolio_2.png"
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
											<a href="images/portfolio/full/portfolio_8.png"
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
											<a href="images/portfolio/full/portfolio_3.png"
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
											<a href="images/portfolio/full/portfolio_4.png"
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
											<img src="images/portfolio/portfolio_2.png" alt="" />
										</div>
										<div class="option">
											<a href="images/portfolio/full/portfolio_7.png"
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
											<a href="images/portfolio/full/portfolio_8.png"
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
		<!--Start recent work-->

		<section class="fetaure_bottom">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-6 ">
						<div class="dividerHeading">
							<h4>
								<span>Why Choose Us?</span>
							</h4>

						</div>
						<ul class="list_style circle">
							<li><a href="#"><i class="fa fa-angle-right"></i> Donec
									convallis, metus nec tempus aliquet</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i> Aenean
									commodo ligula eget dolor</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i> Cum
									sociis natoque penatibus mag ipsum</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i> Lorem
									ipsum dolor sit amet cons adipiscing</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i>
									Accumsan vulputate faucibus turpis dictum</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i> Nullam
									ultrices eros accumsan vulputate</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i> Nunc
									aliquet tincidunt metus sit amet</a></li>
						</ul>
					</div>

					<!-- TESTIMONIALS -->
					<div class="col-lg-6 ">
						<div class="dividerHeading">
							<h4>
								<span>What Client's Say</span>
							</h4>
						</div>

						<div id="testimonial-carousel" class="testimonial carousel slide">
							<div class="carousel-inner">
								<div class="active item">
									<div class="testimonial-item">
										<div class="icon">
											<i class="fa fa-quote-right"></i>
										</div>
										<blockquote>
											<p>Donec convallis, metus nec tempus aliquet, nunc metus
												adipiscing leo, a lobortis nisi dui ut odio. Nullam
												ultrices, eros accumsan vulputate faucibus, turpis tortor
												dictum.</p>
										</blockquote>
										<div class="testimonial-review">
											<img src="images/testimonials/1.png" alt="testimoni">
											<h1>
												Jonathan Dower,<small>Company Inc.</small>
											</h1>
										</div>
									</div>
								</div>

								<div class="item">
									<div class="testimonial-item">
										<div class="icon">
											<i class="fa fa-quote-right"></i>
										</div>
										<blockquote>
											<p>Metus aliquet tincidunt metus, sit amet mattis lectus
												sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros
												luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor
												nec risus.</p>
										</blockquote>
										<div class="testimonial-review">
											<img src="images/testimonials/2.png" alt="testimoni">
											<h1>
												Jonathan Dower<small>Leopard</small>
											</h1>
										</div>
									</div>
								</div>

								<div class="item">
									<div class="testimonial-item">
										<div class="icon">
											<i class="fa fa-quote-right"></i>
										</div>
										<blockquote>
											<p>Nunc aliquet tincidunt metus, sit amet mattis lectus
												sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros
												luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor
												nec risus.</p>
										</blockquote>
										<div class="testimonial-review">
											<img src="images/testimonials/3.png" alt="testimoni">
											<h1>
												Jonathan Dower<small>Leopard</small>
											</h1>
										</div>
									</div>
								</div>
							</div>
							<div class="testimonial-buttons">
								<a href="#testimonial-carousel" data-slide="prev"><i
									class="fa fa-chevron-left"></i></a>&#32; <a
									href="#testimonial-carousel" data-slide="next"><i
									class="fa fa-chevron-right"></i></a>
							</div>
						</div>
					</div>
					<!-- TESTIMONIALS END -->
				</div>
			</div>
		</section>
		<section class="clients">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="dividerHeading">
							<h4>
								<span>Our Clients</span>
							</h4>

						</div>

						<div class="our_clients">
							<ul class="client_items clearfix">
								<li class="col-sm-3 col-md-3 col-lg-3"><a
									href="services.html" data-placement="bottom"
									data-toggle="tooltip" title="Client 1"><img
										src="images/clients/1.png" alt="" /></a></li>
								<li class="col-sm-3 col-md-3 col-lg-3"><a
									href="services.html" data-placement="bottom"
									data-toggle="tooltip" title="Client 2"><img
										src="images/clients/2.png" alt="" /></a></li>
								<li class="col-sm-3 col-md-3 col-lg-3"><a
									href="services.html" data-placement="bottom"
									data-toggle="tooltip" title="Client 3"><img
										src="images/clients/3.png" alt="" /></a></li>
								<li class="col-sm-3 col-md-3 col-lg-3"><a
									href="services.html" data-placement="bottom"
									data-toggle="tooltip" title="Client 4"><img
										src="images/clients/4.png" alt="" /></a></li>
							</ul>
							<!--/ .client_items-->
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--end wrapper-->
	</section>

	<!--start footer-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3 col-lg-3">
					<div class="widget_title">
						<h4>
							<span>About Us</span>
						</h4>
					</div>
					<div class="widget_content">
						<p>본 프로젝트는 KH정보교육원 [NCS]웹 개발 응용SW엔지니어 양성과정_2주차 오후반 3조에서 만든
							Semi 프로젝트입니다.</p>
						<ul class="contact-details-alt">
							<li><i class="fa fa-map-marker"></i>
								<p>
									<strong>Address</strong>: 서울시 강남구 역삼동
								</p></li>
							<li><i class="fa fa-user"></i>
								<p>
									<strong>Phone</strong>: 010-5688-2293
								</p></li>
							<li><i class="fa fa-envelope"></i>
								<p>
									<strong>Email</strong>: <a href="#">firerain4@naver.com</a>
								</p></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3">
					<div class="widget_title">
						<h4>
							<span>Recent Posts</span>
						</h4>
					</div>
					<div class="widget_content">
						<ul class="links">
							<li><i class="fa fa-caret-right"></i> <a href="#">Aenean
									commodo ligula eget dolor<span>November 07, 2014</span>
							</a></li>
							<li><i class="fa fa-caret-right"></i> <a href="#">Temporibus
									autem quibusdam <span>November 05, 2014</span>
							</a></li>
							<li><i class="fa fa-caret-right"></i> <a href="#">Debitis
									aut rerum saepe <span>November 03, 2014</span>
							</a></li>
							<li><i class="fa fa-caret-right"></i> <a href="#">Et
									voluptates repudiandae <span>November 02, 2014</span>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3">
					<div class="widget_title">
						<h4>
							<span>Twitter</span>
						</h4>

					</div>
					<div class="widget_content">
						<ul class="tweet_list">
							<li class="tweet_content item"><i class="fa fa-twitter"></i>
								<p class="tweet_link">
									<a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur
									adipiscing eli
								</p> <span class="time">29 September 2014</span></li>
							<li class="tweet_content item"><i class="fa fa-twitter"></i>
								<p class="tweet_link">
									<a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur
									adipiscing eli
								</p> <span class="time">29 September 2014</span></li>
							<li class="tweet_content item"><i class="fa fa-twitter"></i>
								<p class="tweet_link">
									<a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur
									adipiscing eli
								</p> <span class="time">29 September 2014</span></li>
						</ul>
					</div>
					<div class="widget_content">
						<div class="tweet_go"></div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3">
					<div class="widget_title">
						<h4>
							<span>Flickr Gallery</span>
						</h4>
					</div>
					<div class="widget_content">
						<div class="flickr">
							<ul id="flickrFeed" class="flickr-feed"></ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--end footer-->

	<section class="footer_bottom">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 ">
					<p class="copyright">
						&copy; Copyright 2017 MAːDÆ | Powered by <a
							href="http://www.jqueryrain.com/">jQuery Rain</a>
					</p>
				</div>

				<div class="col-lg-6 ">
					<div class="footer_social">
						<ul class="footbot_social">
							<li><a class="fb" href="#." data-placement="top"
								data-toggle="tooltip" title="Facbook"><i
									class="fa fa-facebook"></i></a></li>
							<li><a class="twtr" href="#." data-placement="top"
								data-toggle="tooltip" title="Twitter"><i
									class="fa fa-twitter"></i></a></li>
							<li><a class="dribbble" href="#." data-placement="top"
								data-toggle="tooltip" title="Dribbble"><i
									class="fa fa-dribbble"></i></a></li>
							<li><a class="skype" href="#." data-placement="top"
								data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
							<li><a class="rss" href="#." data-placement="top"
								data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/retina-1.1.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<!-- jQuery cookie -->
	<script type="text/javascript" src="js/styleswitch.js"></script>
	<!-- Style Colors Switcher -->
	<script src="js/jquery.fractionslider.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript" src="js/jquery.smartmenus.min.js"></script>
	<script type="text/javascript"
		src="js/jquery.smartmenus.bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.jcarousel.js"></script>
	<script type="text/javascript" src="js/jflickrfeed.js"></script>
	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="js/swipe.js"></script>
	<script type="text/javascript" src="js/jquery-scrolltofixed-min.js"></script>

	<script src="js/main.js"></script>

	<!-- Start Style Switcher -->
	<div class="switcher"></div>
	<!-- End Style Switcher -->
	<script>
		$(window).load(function() {
			$('.slider').fractionSlider({
				'fullWidth' : true,
				'controls' : true,
				'responsive' : true,
				'dimensions' : "1920,450",
				'increase' : true,
				'pauseOnHover' : true,
				'slideEndAnimation' : true,
				'autoChange' : true
			});
		});
	</script>
</body>
</html>