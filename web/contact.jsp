<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Contact Page - MAːDÆ</title>
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
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
</head>
<body>
	
	<!--Start Header-->
	<%@ include file="header.jsp" %>
	<!--End Header-->

	
	<!--start wrapper-->
	<section class="wrapper">
		<section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>Contact Us</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="index.jsp">Home</a></li>
								<li>Contact Us</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>

		<section class="content contact">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="maps">
							<div id="map"></div>
						</div>
					</div>
				</div>

				<div class="row sub_content">
					<div class="col-lg-8 col-md-8 col-sm-8">
						<div class="dividerHeading">
							<h4><span>찾아오시는 길</span></h4>
						</div>
						<p>상단의 지도는 KH정보교육원 강남 1관으로,<br>하단에 찾아 오시는 길을 안내해드리도록 하겠습니다.</p>
							
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th colspan="2"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>주소</td>
                        <td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F(T: 1544-9970 / F: 070-8290-2889)</td>
                    </tr>
                    <tr>
                        <td>버스</td>
                        <td>역삼역.포스코P&amp;S타워 정류장<br>
                        	지선 146 / 740 / 341 / 360 &nbsp;&nbsp;&amp;&nbsp;&nbsp;간선 1100 / 1700 / 2000 / 7007 / 8001</td>
                    </tr>
                    <tr>
                        <td>지하철</td>
                        <td>지하철 2호선 역삼역 3번출구 100m</td>
                    </tr>
                    </tbody>
                    </table>
                    <img src="/made/images/company.jpg">
                    <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                    	<th colspan="2"></th>
                    </tr>
                    </thead>
                    <tr>
                        <td>교육시설</td>
                        <td>강의실 / 프로젝트룸 / 세미나실<br>
                        	상담실 / 취업상담실</td>
                    </tr>
                    <tr>
                        <td>기타시설</td>
                        <td>휴게실 / 행정시설지원(FAX, 프린트, Scan)</td>
                    </tr>
                    <tr>
                        <td><b>2F</b></td>
                        <td>강의실(A,B,C) / 인포데스크 / 교원연구실 / 취업지원센터 / 교육개발본부</td>
                    </tr>
                    <tr>
                        <td>3F</td>
                        <td>강의실(G,H,I) / 원장실 / 경영지원사업본부 / 프로젝트룸</td>
                    </tr>
                    <tr>
                        <td>4F</td>
                        <td>강의실(Q,R,S) / 회의실 / 입학상담실</td>
                    </tr>
                    </tbody>
                </table>
					</div>
					
					<div class="col-lg-4 col-md-4 col-sm-4">
						<div class="sidebar">
							<div class="widget_info">
								<div class="dividerHeading">
									<h4><span>사이트 관리자 연락처</span></h4>
									</div>
								<p>만약 사이트에 오류가 있을 경우, 이쪽으로 연락 주신다면 말씀하시는 사항에 대해 신속하게 대처해 드리겠습니다. 항상 좋은 하루 되시기 바랍니다. 감사합니다.</p>
								<ul class="widget_info_contact">
									<li><i class="fa fa-map-marker"></i> <p><strong>Address</strong>서울 강남구 테헤란로<br> 14길 6 남도빌딩 2F</p></li>
									<li><i class="fa fa-user"></i> <p><strong>Phone</strong>: T) 1544-9970 <br>&nbsp; F) 070-8290-2889</p></li>
									<li><i class="fa fa-envelope"></i> <p><strong>Email</strong>: <a href="#">firerain4@naver.com</a></p></li>
									<li><i class="fa fa-globe"></i> <p><strong>Web</strong>: <a href="http://tour.pcs21.net/main/main.kh" data-placement="bottom" data-toggle="tooltip" title="http://tour.pcs21.net/main/main.kh">tour.pcs21.net/main</a></p></li>
								</ul>
								
							</div>
							
							<div class="widget_social">
								<div class="dividerHeading">
									<h4><span>Get Social</span></h4>
								</div>
								<ul class="widget_social">
									<li><a class="fb" href="#." data-placement="bottom" data-toggle="tooltip" title="Facbook"><i class="fa fa-facebook"></i></a></li>
									<li><a class="twtr" href="#." data-placement="bottom" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
									<li><a class="gmail" href="#." data-placement="bottom" data-toggle="tooltip" title="Google"><i class="fa fa-google-plus"></i></a></li>
									<li><a class="dribbble" href="#." data-placement="bottom" data-toggle="tooltip" title="Dribbble"><i class="fa fa-dribbble"></i></a></li>
									<li><a class="skype" href="#." data-placement="bottom" data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
									<li><a class="pinterest" href="#." data-placement="bottom" data-toggle="tooltip" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
									<li><a class="instagram" href="#." data-placement="bottom" data-toggle="tooltip" title="Instagram"><i class="fa fa-instagram"></i></a></li>
									<li><a class="youtube" href="#." data-placement="bottom" data-toggle="tooltip" title="Youtube"><i class="fa fa-youtube"></i></a></li>
									<li><a class="linkedin" href="#." data-placement="bottom" data-toggle="tooltip" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
									<li><a class="flickrs" href="#." data-placement="bottom" data-toggle="tooltip" title="Flickr"><i class="fa fa-flickr"></i></a></li>
									<li><a class="rss" href="#." data-placement="bottom" data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</section>
	</section>
	<!--end wrapper-->

	
	<!--start footer-->
	<%@ include file="footer.jsp" %>
	<!--end footer-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPXDKKrkyHhw7wmbPImM12hy82oedNzlg&callback=initMap"
  async defer></script>
  <script>
function initMap() {
  var ourCompany = {lat: 37.498993, lng: 127.032909};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 18,
    center: ourCompany
  });
  var marker = new google.maps.Marker({
    position: ourCompany,
    map: map
  });
}

</script>
</body>
</html>