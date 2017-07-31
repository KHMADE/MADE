<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*"%>
<%
	Member m = (Member) session.getAttribute("member");
	String loginout;
	if (m == null) {
		loginout = "<a href='../../loginout.jsp'>&nbsp;Login&nbsp;</a>";
	} else {
		loginout = "&nbsp;<b>"+m.getNickName()+"</b>님 환영합니다!&nbsp;&nbsp;<a href='/made/logout'>&nbsp;Logout&nbsp;</a>";
	}
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
	<link rel="shortcut icon" href="../../images/icon.ico">
	<!-- CSS FILES -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css" media="screen" data-name="skins">
    <link rel="stylesheet" href="../../css/layout/wide.css" data-name="layout">

    <link rel="stylesheet" href="../../css/fractionslider.css"/>
    <link rel="stylesheet" href="../../css/style-fraction.css"/>

    <link rel="stylesheet" type="text/css" href="../../css/switcher.css" media="screen" />
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
                            <li><a href="../user/%ED%9A%8C%EC%9B%90%EA%B0%80%EC%9E%85%ED%8E%98%EC%9D%B4%EC%A7%80.html">&nbsp;회원가입&nbsp;</a></li>
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
                       <div id="logo" style="width:170px;">
                           <h1><a href="../../index.jsp"><img src="../../images/logo.png" alt="Made" /></a></h1>
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
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="../../index.jsp">Home</a>
                            </li>
                            <li><a href="../notice/공지사항 main.jsp">공지사항</a>
                            </li>
                            <li><a href="#">DIY 상품</a>
                                <ul class="dropdown-menu">
                                    <li><a href="../item/item_designed.html">Designed</a></li>
                                    <li><a href="../item/item_parts.html">Parts</a></li>
                                </ul>
                            </li>

                            <li><a href="#">마이페이지</a>
                                <ul class="dropdown-menu">
                                    <li><a href="../mypage/myinfo.html">My page</a></li>
                                    <li><a href="../mypage/order_page.html">주문내역</a></li>
                                    <li><a href="../mypage/myinfo.html">회원정보수정</a></li>
                                    <li><a href="../mypage/myinfo.html">쪽지함</a></li>
                                    <li><a href="../mypage/myinfo.html">1:1문의</a></li>
                                </ul>
                            </li>
                            <li><a href="../faq/faq.jsp">FAQ</a></li>
                            <li><a href="../../contact.html">Contact</a></li>
                        </ul>
                    </div>
                </div><!--/.row -->
            </div><!--/.container -->
        </div>
	</header>
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
								<li><a href="../../index.jsp">Home</a></li>
								<li><a href="default_page.html">Shortcodes</a></li>
								<li>Typography</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        <div class="container">
        
        <!--- 여기에 내용을 작성해주세요~ --->
        
       
        <div class="container" style="border:1px dashed blue;">


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
							border:1px dashed blue;
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
					  		<tr><td scope=row>2017-07-01<br>(221053968031)<br><button>영수증출력</button></td><td><div class="c_product"><img alt="상품이미지" src="#"><div class="c_product_description"><a href="#">[삼성]상품 이름 01<br>100*200*300(mm)</a></div></div></td><td>50,000<br>(1개)</td><td><span>구매확정</span><br><button>상품리뷰</button><br>한진택배<br>121053968031<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-02<br>(221053968032)<br><button>영수증출력</button></td><td>■</td><td>51,000<br>(2개)</td><td><span>배송중</span><br>한진택배<br>121053968032<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-03<br>(221053968033)<br><button>영수증출력</button></td><td>■</td><td>52,000<br>(3개)</td><td><span>배송중</span><br>한진택배<br>121053968033<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-04<br>(221053968034)<br><button>영수증출력</button></td><td>■</td><td>53,000<br>(4개)</td><td><span>배송중</span><br>한진택배<br>121053968034<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-05<br>(221053968035)<br><button>영수증출력</button></td><td>■</td><td>54,000<br>(5개)</td><td><span>배송중</span><br>한진택배<br>121053968035<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-06<br>(221053968036)<br><button>영수증출력</button></td><td>■</td><td>55,000<br>(6개)</td><td><span>배송중</span><br>한진택배<br>121053968036<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-07<br>(221053968037)<br><button>영수증출력</button></td><td>■</td><td>56,000<br>(7개)</td><td><span>배송중</span><br>한진택배<br>121053968037<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-08<br>(221053968038)<br><button>영수증출력</button></td><td>■</td><td>57,000<br>(8개)</td><td><span>배송중</span><br>한진택배<br>121053968038<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-09<br>(221053968039)<br><button>영수증출력</button></td><td>■</td><td>58,000<br>(9개)</td><td><span>배송중</span><br>한진택배<br>121053968039<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-10<br>(221053968040)<br><button>영수증출력</button></td><td>■</td><td>59,000<br>(10개)</td><td><span>배송중</span><br>한진택배<br>121053968030<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
					  	</tbody>
					</table>
				</div>

				<nav aria-label="Page navigation" style="text-align:center;">
				  <ul class="pagination pagination-sm">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="active"><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#">6</a></li>
				    <li><a href="#">7</a></li>
				    <li><a href="#">8</a></li>
				    <li><a href="#">9</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>

        	</div>
        </div>
        
        
        
        
        
        
    </section>

    <!--start footer-->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-3 col-lg-3">
                    <div class="widget_title">
                        <h4><span>About Us</span></h4>
                    </div>
                    <div class="widget_content">
                        <p>본 프로젝트는 KH정보교육원 [NCS]웹 개발 응용SW엔지니어 양성과정_2주차 오후반 3조에서 만든 Semi 프로젝트입니다.</p>
                        <ul class="contact-details-alt">
                            <li><i class="fa fa-map-marker"></i> <p><strong>Address</strong>: 서울시 강남구 역삼동</p></li>
                            <li><i class="fa fa-user"></i> <p><strong>Phone</strong>: 010-5688-2293</p></li>
                            <li><i class="fa fa-envelope"></i> <p><strong>Email</strong>: <a href="#">firerain4@naver.com</a></p></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3">
                    <div class="widget_title">
                        <h4><span>Recent Posts</span></h4>
                    </div>
                    <div class="widget_content">
                        <ul class="links">
                            <li><i class="fa fa-caret-right"></i> <a href="#">Aenean commodo ligula eget dolor<span>November 07, 2014</span></a></li>
                            <li><i class="fa fa-caret-right"></i> <a href="#">Temporibus autem quibusdam <span>November 05, 2014</span></a></li>
                            <li><i class="fa fa-caret-right"></i> <a href="#">Debitis aut rerum saepe <span>November 03, 2014</span></a></li>
                            <li><i class="fa fa-caret-right"></i> <a href="#">Et voluptates repudiandae <span>November 02, 2014</span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3">
                    <div class="widget_title">
                        <h4><span>Twitter</span></h4>

                    </div>
                    <div class="widget_content">
                        <ul class="tweet_list">
                            <li class="tweet_content item">
                                <i class="fa fa-twitter"></i>
                                <p class="tweet_link"><a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur adipiscing eli</p>
                                <span class="time">29 September 2014</span>
                            </li>
                            <li class="tweet_content item">
                                <i class="fa fa-twitter"></i>
                                <p class="tweet_link"><a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur adipiscing eli</p>
                                <span class="time">29 September 2014</span>
                            </li>
                            <li class="tweet_content item">
                                <i class="fa fa-twitter"></i>
                                <p class="tweet_link"><a href="#">@jquery_rain </a> Lorem ipsum dolor et, consectetur adipiscing eli</p>
                                <span class="time">29 September 2014</span>
                            </li>
                        </ul>
                    </div>
                    <div class="widget_content">
                        <div class="tweet_go"></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 col-lg-3">
                    <div class="widget_title">
                        <h4><span>Flickr Gallery</span></h4>
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
                    <p class="copyright">&copy; Copyright 2017 MAːDÆ | Powered by  <a href="http://www.jqueryrain.com/">jQuery Rain</a></p>
				</div>
				
				<div class="col-lg-6 ">
					<div class="footer_social">
						<ul class="footbot_social">
							<li><a class="fb" href="#." data-placement="top" data-toggle="tooltip" title="Facbook"><i class="fa fa-facebook"></i></a></li>
							<li><a class="twtr" href="#." data-placement="top" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a class="dribbble" href="#." data-placement="top" data-toggle="tooltip" title="Dribbble"><i class="fa fa-dribbble"></i></a></li>
							<li><a class="skype" href="#." data-placement="top" data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
							<li><a class="rss" href="#." data-placement="top" data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/jquery.easing.1.3.js"></script>
    <script src="../../js/retina-1.1.0.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.cookie.js"></script> <!-- jQuery cookie -->
    <script type="text/javascript" src="../../js/styleswitch.js"></script> <!-- Style Colors Switcher -->
    <script src="../../js/jquery.fractionslider.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="../../js/jquery.smartmenus.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.smartmenus.bootstrap.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.jcarousel.js"></script>
    <script type="text/javascript" src="../../js/jflickrfeed.js"></script>
    <script type="text/javascript" src="../../js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="../../js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="../../js/swipe.js"></script>
    <script type="text/javascript" src="../../js/jquery-scrolltofixed-min.js"></script>

    <script src="../../js/main.js"></script>

    <!-- Start Style Switcher -->
    <div class="switcher"></div>
    <!-- End Style Switcher -->
</body>
</html>