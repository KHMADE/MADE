<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="order.model.vo.*, member.model.vo.*, java.util.*"%>
<%
ArrayList<OrderStat> olist = (ArrayList<OrderStat>) request.getAttribute("olist");
ArrayList<OrderStat> toplist = (ArrayList<OrderStat>) request.getAttribute("toplist");
ArrayList<OrderStat> purlist = (ArrayList<OrderStat>) request.getAttribute("purlist");
ArrayList<OrderStat> yearProfit =  (ArrayList<OrderStat>) request.getAttribute("yearProfit");
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
<title>Profit View - MAːDÆ</title>
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
<link rel="stylesheet" type="text/css" href="/made/api/jquery.jqplot.1.0.9.d96a669/jquery.jqplot.css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
						<h2><%=m.getNickName() %>님의 수익 판매 분석</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li>마이페이지</li>
								<li>수익 분석 차트</li>
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
				<h4><span>올해 판매 실적</span></h4>
			</div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-10 col-xs-12">
			<table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>판매 월</th>
                        <th>주문 횟수</th>
                        <th>수익</th>
                    </tr>
                    </thead>
                    <tbody>
			<% if(yearProfit.size() != 0) { %>
			<% for(OrderStat o : yearProfit){ %>
			<tr>
				<td><%=o.getMonth() %></td>
				<td><%=o.getCnt() %> 회</td>
				<td>￦ <%=o.getPrice() %></td>
			</tr>
			<%} %>
			<%} else { %>
			<tr><td colspan="3">활동하신 내역이 없습니다.</td>
			</tr>
			<%} %>
			</tbody>
			</table>
		</div>
	</div>
		<div class="row sub_content">
		<% if(olist.size() != 0){ %>
					<div class="col-lg-12 col-md-12 col-sm-10 col-xs-12">
						<div class="dividerHeading">
						<% if(m.getClassCode().equals("D")){ %>
							<h4><span>최근 3개월 매출액 도표화</span></h4>
						<% } else { %>
							<h4><span>최근 3개월 매출액 도표화</span></h4>
						<% } %>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-10 col-xs-12">
						<div id="chart1" class="chart" style="width:'80%'; height:'80%'"></div>
					</div>
					<% } else {%>
							<h4><span>분석할 데이터가 없습니다.</span></h4>
						<% } %>
			</div>
	<div class="row sub_content">
	<% if(toplist.size() != 0){ %>
					<div class="col-lg-12 col-md-12 col-sm-10 col-xs-12">
						<div class="dividerHeading">
						<% if(m.getClassCode().equals("D")){ %>
							<h4><span>금년도 고객 선호 상품 TOP 7</span></h4>
						<% } else { %>
							<h4><span>금년도 인기 상품  TOP 7 판매 비율</span></h4>
						<% } %>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-10 col-xs-12">
						<div id="chart2" class="chart" style="width:'80%'; height:'80%'"></div>
					</div>
					<% } else {%>
							<h4><span>분석할 데이터가 없습니다.</span></h4>
						<% } %>
			</div>
			<div class="row sub_content">
			<% if(purlist.size() != 0){ %>
					<div class="col-lg-12 col-md-12 col-sm-10 col-xs-12">
						<div class="dividerHeading">
						<% if(m.getClassCode().equals("D")){ %>
							<h4><span>월 별 총 판매량 그래프</span></h4>
						<% } else { %>
							<h4><span>월 별 상품 판매 도표</span></h4>
						<% } %>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-10 col-xs-12">
						<div id="chart3" class="example-chart jqplot-target" style="width:'80%'; height:'80%'"></div>
					</div>
					<% } else {%>
							<h4><span>분석할 데이터가 없습니다.</span></h4>
				<% } %>
			</div>
		<p align="right" style="padding-right:120px;">[참고자료] : <a data-placement="top" data-toggle="tooltip" href="#" data-original-title="http://www.jqplot.com/examples/barLineAnimated.php">www.jqplot.com</a></p>
		</div>
	</section>
	<!--End wrapper-->

	<!--start footer-->
	<%@ include file="../../footer.jsp"%>
	<!--end footer-->

<script type="text/javascript" src="/made/api/jquery.jqplot.1.0.9.d96a669/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="/made/api/jquery.jqplot.1.0.9.d96a669/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript" src="/made/api/jquery.jqplot.1.0.9.d96a669/plugins/jqplot.highlighter.js"></script>
<script type="text/javascript" src="/made/api/jquery.jqplot.1.0.9.d96a669/plugins/jqplot.cursor.js"></script>
<script type="text/javascript" src="/made/api/jquery.jqplot.1.0.9.d96a669/plugins/jqplot.pointLabels.js"></script>
<script type="text/javascript" src="/made/api/jquery.jqplot.1.0.9.d96a669/plugins/jqplot.pieRenderer.js"></script>
<script type="text/javascript" src="/made/api/jquery.jqplot.1.0.9.d96a669/plugins/jqplot.donutRenderer.js"></script>
<script type="text/javascript" src="/made/api/jquery.jqplot.1.0.9.d96a669/plugins/jqplot.dateAxisRenderer.js"></script>
<script type="text/javascript" src="/made/api/jquery.jqplot.1.0.9.d96a669/plugins/jqplot.categoryAxisRenderer.js"></script>
<script>
$(function () {
	// 막대 그래프
    var line1=[<%if(olist.size() != 0){%>
	<%for(OrderStat o : olist) {%>
	<%if(o.getMonth() != olist.get(0).getMonth()){%>, <%}%>
	['<%=o.getMonth()%>',<%=o.getPrice()%>]
	<% } %>
<%} else{}%>];
    var plot1 = $.jqplot('chart1', [line1], {
        title:'마우스를 대시면 툴팁이 나와요 ^^',
        axes:{
          xaxis:{
            renderer:$.jqplot.DateAxisRenderer,
            tickOptions:{
              formatString:'%b&nbsp;%#d'
            } 
          },
          yaxis:{
            tickOptions:{
              formatString:"￦ %'d"
              }
          }
        },
        highlighter: {
          show: true,
          sizeAdjust: 7.5
        },
        cursor: {
          show: false
        }
    });
    
 // 퍼센트 원형 그래프
    var data = [
    	<%if(toplist.size() != 0){%>
    	<%for(OrderStat o : toplist) {%>
    	<%if(o.getMonth() != toplist.get(0).getMonth()){%>, <%}%>
    	['<%=o.getMonth()%>',<%=o.getPrice()%>]
    	<% } %>
	<%} else{}%>
	];
 // 원형 그래프
  var plot2 = $.jqplot ('chart2', [data], 
    {
	  seriesColors:['#85802b', '#00749F', '#73C774', '#C7754C', '#17BDB8', '#efBDB8'],
      seriesDefaults: {
        renderer: jQuery.jqplot.PieRenderer, 
        rendererOptions: {
          // Turn off filling of slices.
          fill: false,
          showDataLabels: true, 
          // Add a margin to seperate the slices.
          sliceMargin: 4, 
          // stroke the slices with a little thicker line.
          lineWidth: 5
        }
      }, 
      legend: { show:true, location: 'e' }
    }
  );
 //막대 그래프
    var line1 = [
    	<%if(purlist.size() != 0){%>
    	<%for(OrderStat o : purlist) {%>
    	<%if(o.getMonth() != purlist.get(0).getMonth()){%>, <%}%>
    	['<%=o.getMonth()%>',<%=o.getPrice()%>]
    	<% } %>
	<%} else{}%>
	];
 
    $('#chart3').jqplot([line1], {
        title:'Bar Chart with Purcheas Item QTY',
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            rendererOptions: {
                // Set the varyBarColor option to true to use different colors for each bar.
                // The default series colors are used.
                varyBarColor: true
            }
        },
        axes:{
            xaxis:{
                renderer: $.jqplot.CategoryAxisRenderer
            }
        }
    });
});
</script>
</body>
</html>