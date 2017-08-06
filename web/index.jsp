<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="description" content="">
<title>MAːDÆ - The unique what you made</title>

<link rel="shortcut icon" href="images/icon.ico">
<!-- CSS FILES -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" data-name="skins">
<link type="text/css" rel="stylesheet" href="css/layout/wide.css" data-name="layout">

<link type="text/css" rel="stylesheet" href="css/fractionslider.css" />
<link type="text/css" rel="stylesheet" href="css/style-fraction.css" />

<link rel="stylesheet" type="text/css" href="css/switcher.css" media="screen" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<!--Start Header-->
	<%@ include file="header.jsp" %>
	<!--End Header-->
	
<script type="text/javascript">
		function top5(){
			$.ajax({
				url : "/made/toplist",
				type : "post",
				dataType : "json",
				success : function(data) {
					//console.log(data);
					var jsonStr = JSON.stringify(data); //객체를 문자열로 변환
					//console.log(jsonStr);
					var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈

					var values = $("#top5").html();

					for ( var i in json.list) {
						//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
						values += '<li class="col-sm-3 col-md-3 col-lg-3">'
							+' <div class="recent-item">'
							+' <figure> <div class="touching medium">'
							+' <img src="/made/images/items/designed/'+json.list[i].image+'" style="width:200px;height:170px;" alt="" />'
							+' </div> <div class="option">'
							+' <a href="javascript:CaricaFoto(\'/made/images/items/designed/'+json.list[i].image+'\')"'
							+' class="hover-zoom mfg-image trigger"> <i class="fa fa-search" ></i> </a>'
							<% if( m!= null) {%>
							+' <a href="dDetail?id='+json.list[i].designCode+'" class="hover-link"><i class="fa fa-link"></i></a>'
							<% } %>
							+' </div> <figcaption class="item-description">'
							+' <h5>'+json.list[i].category+'</h5>'
							+' <span>'+decodeURIComponent(json.list[i].title)+'</span>'
							+' </figcaption> </figure> </div> </li>'
						}
					$("#top5").html(values);
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		};
		function drecent10(){
			$.ajax({
				url : "/made/drecentlist",
				type : "post",
				dataType : "json",
				success : function(data) {
					//console.log(data);
					var jsonStr = JSON.stringify(data); //객체를 문자열로 변환
					//console.log(jsonStr);
					var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈

					var values = $("#r10").html();

					for ( var i in json.list) {
						//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
						values += '<li class="col-sm-3 col-md-3 col-lg-3">'
							+' <div class="recent-item">'
							+' <figure> <div class="touching medium">'
							+' <img src="/made/images/items/designed/'+json.list[i].image+'" style="width:200px;height:170px;" alt="" />'
							+' </div> <div class="option">'
							+' <a href="javascript:CaricaFoto(\'/made/images/items/designed/'+json.list[i].image+'\')"'
							+' class="hover-zoom mfg-image trigger"> <i class="fa fa-search" ></i> </a>'
							<% if( m!= null) {%>
							+' <a href="dDetail?id='+json.list[i].designCode+'" class="hover-link"><i class="fa fa-link"></i></a>'
							<% } %>
							+' </div> <figcaption class="item-description">'
							+' <h5>'+json.list[i].category+'</h5>'
							+' <span>'+decodeURIComponent(json.list[i].title)+'</span>'
							+' </figcaption> </figure> </div> </li>'
						}
					$("#r10").html(values);
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		};
		$(function() {
			top5();
			drecent10();
			// 새로고침 1회
			if (location.href.indexOf('#reload') == -1) 
				  location.href += '#reload';
		});
		
		function CaricaFoto(img){ 
			foto1= new Image(); 
			foto1.src=(img); 
			Controlla(img); 
		}; 
		function Controlla(img){ 
			if((foto1.width!=0)&&(foto1.height!=0)){ 
				viewFoto(img); 
			} else{ 
				funzione="Controlla('"+img+"')"; 
				intervallo=setTimeout(funzione,20); 
			} 
		}; 

		function viewFoto(img){ 
				largh=foto1.width+20; 
				altez=foto1.height+20; 
				stringa="width="+largh+",height="+altez; 
				finestra=window.open(img,"",stringa); 
		};
</script>

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
						data-out="right" data-delay="3000">디자이너와 자재를 Join, 누구나 저렴한
						가격으로 원하는 제품을 만들 수 있고 자신만의 창의적 제품 제작이 가능하며, 디자이너와의	1:1 소통도 지원합니다.</div>
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
<!--Start Top 5-->
		<section class="latest_work">
			<div class="container">
				<div class="row sub_content">
					<div class="carousel-intro">
						<div class="col-md-12">
							<div class="dividerHeading">
								<h4>
									<span>Top 5 Item</span>
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
						<ul class="jcarousel-list" id="top5">
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!--Start Top 5-->
		<!--Start Recent 10-->
		<section class="latest_work">
			<div class="container">
				<div class="row sub_content">
					<div class="carousel-intro">
						<div class="col-md-12">
							<div class="dividerHeading">
								<h4>
									<span>Recently Designed Item</span>
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
						<ul class="jcarousel-list" id="r10">
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!--End Recent 10-->

		<!--start info service-->
		<section class="info_service">
			<div class="container">
				<div class="row sub_content">
				<div class="dividerHeading">
							<h4>
								<span>MAːDÆ - The unique what you made</span>
							</h4>
						</div>
					<div class="rs_box">
						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-laptop"></i>
									<h3>재활용? DIY!</h3>
								</div>
								<div class="fr_content">
									<p>본 사이트를 이용하시면 단순히 재활용품으로 생각했던 물품들을 제안된 디자인을 보며 직접 만들어 볼 수 있습니다. 지금 바로 함께하세요!!</p>

								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-heart"></i>
									<h3>디자인 &amp; 부품재료</h3>
								</div>
								<div class="fr_content">
									<p>디자인을 보는데, 만들 부품이 없으시다구요?&nbsp;&nbsp;&nbsp;만들 부품은 있는데 디자인이 생각나지 않는다구요?&nbsp;&nbsp;&nbsp;걱정 마세요!!&nbsp;&nbsp;저희는 그 두마리 토끼를 다 잡아드릴 수 있습니다!</p>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-trophy"></i>
									<h3>가성비甲 상품</h3>
								</div>
								<div class="fr_content">
									<p>디자이너와 직접 링크를 유지하여 누구나 저렴한 가격으로 완제품을 받아볼 수 있습니다!&nbsp;&nbsp;&nbsp;&nbsp;당신 만이 갖는 특별함, 지금 바로 주문하세요!</p>
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
									<h3>제작이 쉽다?!</h3>
								</div>
								<div class="fr_content">
									<p>저희는 주문하신 상품에 대해 직접 제작하실 수 있도록 동영상, 설계도등을 첨부하여 보내드립니다. 
									마이너스 손이시라구요? 걱정 마세요! 제작은 누구나 할 수 있으니까요!!</p>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-volume-off"></i>
									<h3>고객의 소리</h3>
								</div>
								<div class="fr_content">
									<p>1:1문의 상담 / 디자이너의 디자인 의뢰 등을 통해 고객들의 의견을 적극 수렴하고 있습니다!
									이용하시는데 불편한 점이 있으시다면 과감하게 말씀해주세요!!</p>
								</div>
							</div>
						</div>

						<div class="col-sm-4 col-md-4 col-lg-4">
							<div class="serviceBox_1">
								<div class="icon_service">
									<i class="fa fa-suitcase"></i>
									<h3>수익 보고서</h3>
								</div>
								<div class="fr_content">
									<p>사이트를 이용하시는 디자이너 분들께 수익 도표 페이지를 제공하고 있습니다. 왕창 버시게 되면 저희한테 기부 조오~금 부탁 드릴게요!!</p>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
		<!--end info service-->

		<section class="fetaure_bottom">
			<div class="container">
				<div class="row sub_content">
					<!-- TESTIMONIALS -->
					<div class="col-lg-6 ">
						<div class="dividerHeading">
							<h4>
								<span>What Customer's Say</span>
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
											<p>사이트를 이용하면서 일반 대량 구매 사이트와는 다른 순이익 도표화가 <br>너무 맘에 들어 계속 관계를 맺고 있습니다.<br>여러분 design11의 작품, 많이 이용해 주세요!!!</p>
										</blockquote>
										<div class="testimonial-review">
											<img src="images/userimage/default_image.png" alt="testimoni">
											<h1>
												유OO 사장님<small>Team. 형설지공 대표</small>
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
											<p>평소 버리던 물품들을 이용해 직접 아이템을 만들 수 있다니!!! 한국에도 인건비라는 개념을 도입하여
											<br>가격의 합려성을 고려한 점, 개인적으로 너무 마음에 듭니다!!
											<br>흥미로운 아이디어 사이트군요. 번창하시길!!!</p>
										</blockquote>
										<div class="testimonial-review">
											<img src="images/userimage/default_image1.jpg" alt="testimoni">
											<h1>
												Jonathan Dower<small>Leopard 社 대표</small>
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
											<p>제가 평소 손으로 만드는 핸드메이드 상품을 무척 좋아하는데, <br>사이트를 이용하면서 정말 많은 상품들을 알아가요 ㅎㅎ.<br>
											이 사이트 만들어 주신 분들 정말 감사드립니다, 사랑해요~~♥♥♥</p>
										</blockquote>
										<div class="testimonial-review">
											<img src="images/userimage/default_image2.jpg" alt="testimoni">
											<h1>
												Hashimoto Kanna<small>Discovery Next 社</small>
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
	</section>
		<!--end wrapper-->

	<!--start footer-->
	<%@ include file="footer.jsp" %>
	<!--end footer-->

</body>
</html>