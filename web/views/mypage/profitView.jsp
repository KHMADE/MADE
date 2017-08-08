<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="part.model.vo.Part, member.model.vo.*, java.util.*"%>
<%

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
	<h3>월 별 매출액 도표화</h3>
		<div id="chart1" style="width:700px; height:300px"></div>
	<h3>금년도 인기상품 판매 퍼센트</h3>
		<div id="chart2" style="width:700px; height:300px"></div>
	<h3>금년도 상위 5개 상품 판매 누계</h3>
		<div id="chart3" style="width:700px; height:300px"></div>
		http://www.jqplot.com/examples/barLineAnimated.php
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
<script>
$(document).ready(function () {
	// 막대 그래프
    var s1 = [[2002, 112000], [2003, 122000], [2004, 104000], [2005, 99000], [2006, 121000], 
    [2007, 148000], [2008, 114000], [2009, 133000], [2010, 161000], [2011, 173000]];
    var s2 = [[2002, 10200], [2003, 10800], [2004, 11200], [2005, 11800], [2006, 12400], 
    [2007, 12800], [2008, 13200], [2009, 12600], [2010, 13100]];
 
    plot1 = $.jqplot("chart1", [s2, s1], {
        // Turns on animatino for all series in this plot.
        animate: true,
        // Will animate plot on calls to plot1.replot({resetAxes:true})
        animateReplot: true,
        cursor: {
            show: true,
            zoom: true,
            looseZoom: true,
            showTooltip: false
        },
        series:[
            {
                pointLabels: {
                    show: true
                },
                renderer: $.jqplot.BarRenderer,
                showHighlight: false,
                yaxis: 'y2axis',
                rendererOptions: {
                    // Speed up the animation a little bit.
                    // This is a number of milliseconds.  
                    // Default for bar series is 3000.  
                    animation: {
                        speed: 2500
                    },
                    barWidth: 15,
                    barPadding: -15,
                    barMargin: 0,
                    highlightMouseOver: false
                }
            }, 
            {
                rendererOptions: {
                    // speed up the animation a little bit.
                    // This is a number of milliseconds.
                    // Default for a line series is 2500.
                    animation: {
                        speed: 2000
                    }
                }
            }
        ],
        axesDefaults: {
            pad: 0
        },
        axes: {
            // These options will set up the x axis like a category axis.
            xaxis: {
                tickInterval: 1,
                drawMajorGridlines: false,
                drawMinorGridlines: true,
                drawMajorTickMarks: false,
                rendererOptions: {
                tickInset: 0.5,
                minorTicks: 1
            }
            },
            yaxis: {
                tickOptions: {
                    formatString: "$%'d"
                },
                rendererOptions: {
                    forceTickAt0: true
                }
            },
            y2axis: {
                tickOptions: {
                    formatString: "$%'d"
                },
                rendererOptions: {
                    // align the ticks on the y2 axis with the y axis.
                    alignTicks: true,
                    forceTickAt0: true
                }
            }
        },
        highlighter: {
            show: true, 
            showLabel: true, 
            tooltipAxes: 'y',
            sizeAdjust: 7.5 , tooltipLocation : 'ne'
        }
    });
    // 퍼센트 원형 그래프
    var data = [
    ['Heavy Industry', 12],['Retail', 9], ['Light Industry', 14], 
    ['Out of home', 16],['Commuting', 7], ['Orientation', 9]
  ];
  var plot1 = jQuery.jqplot ('chart2', [data], 
    { 
      seriesDefaults: {
        // Make this a pie chart.
        renderer: jQuery.jqplot.PieRenderer, 
        rendererOptions: {
          // Put data labels on the pie slices.
          // By default, labels show the percentage of the slice.
          showDataLabels: true
        }
      }, 
      legend: { show:true, location: 'e' }
    }
  );
  
    // 도넛 그래프
    var data = [
        ['Heavy Industry', 12],['Retail', 9], ['Light Industry', 14], 
        ['Out of home', 16],['Commuting', 7], ['Orientation', 9]
      ];
       
      var plot3 = $.jqplot('chart3', [data], {
        seriesDefaults: {
          // make this a donut chart.
          renderer:$.jqplot.DonutRenderer,
          rendererOptions:{
            // Donut's can be cut into slices like pies.
            sliceMargin: 3,
            // Pies and donuts can start at any arbitrary angle.
            startAngle: -90,
            showDataLabels: true,
            // By default, data labels show the percentage of the donut/pie.
            // You can show the data 'value' or data 'label' instead.
            dataLabels: 'value',
            // "totalLabel=true" uses the centre of the donut for the total amount
            totalLabel: true
          }
        }
      });
});
</script>
</body>
</html>