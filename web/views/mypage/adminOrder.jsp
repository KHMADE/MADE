<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="admin.model.vo.*, java.sql.Date, java.util.ArrayList" %>    

<%
	ArrayList<AdminOrder> list = (ArrayList<AdminOrder>) request.getAttribute("list");
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
	<title>Admin Order - MAːDÆ</title>
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
		height : 100px;
	}
	.c_product_description {
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
						<h2>주문/배송 조회</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li>마이페이지</li>
								<li>주문/배송조회</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        
        <!--- 여기에 내용을 작성해주세요~ --->
        
		<div class="container">
        		<div class="panel panel-default">

					<table class=table>
				  		<thead>
				  			<tr><th>주문일자/주문번호</th><th>상품정보</th><th>금액/수량</th><th>주문상태</th><th>관리</th></tr>
				  		</thead>
				  		<tbody>
				  		<% for(AdminOrder e : list) { %>
					  		<tr><td scope=row><%= e.getOrderDate() %><br>(<%= e.getOrderCode() %>)<br>
					  		
					  		<% if(e.getDesignCode() != null ) { %>
					  		<button type="button" onclick="openWin('<%= e.getOrderCode() %>', '<%= e.getDesignCode() %>');">영수증출력</button></td>
					  		<td><div class="c_product"><img alt="상품이미지" src="/made/images/items/designed/<%= e.getDesignImg() %>">
					  		<div class="c_product_description"><a href="/made/dDetail?id=<%= e.getDesignCode() %>"><%= e.getDesignTitle() %></a></div></div></td><td><%= e.getDesignprice() * e.getOrderCount() %><br>(<%= e.getOrderCount() %>개)</td>
					  		
					  		<% if(e.getShipCompanyName() == null) {%>
					  			<%-- <td><span><%= e.getOrderStateName() %></span><br><br> --%>
					  			<td><span>결제 완료</span><br><br>
					  		<% } else { %>
					  			<td><span>배송 중</span><br><br>
					  		<% } %>
					  		<% if(e.getShipCompanyName() != null) {%>
					  			<%= e.getShipCompanyName() %><br><%= e.getOrderShipCode() %><br><button onclick="check_ship('<%= e.getShipCompanyName() %>', <%= e.getOrderShipCode() %>)">배송추적</button>
					  		<% } %>
					  		</td><td><button type="button" class="popbutton_d" id="<%= e.getOrderCode() %>">송장번호 입력</button></td></tr>
							
							<% } else { %>
							<button type="button" onclick="openWin('<%= e.getOrderCode() %>', '<%= e.getPartCode() %>');">영수증출력</button></td>
							<td><div class="c_product">
								<% if(e.getPartCategory().equals("WOOD")){ %>
								<img alt="상품이미지" src="/made/images/items/parts/wood/<%= e.getPartImg() %>">
								<% } else if(e.getPartCategory().equals("STEEL")){ %>
								<img alt="상품이미지" src="/made/images/items/parts/steel/<%= e.getPartImg() %>">
								<% } else if(e.getPartCategory().equals("PLASTIC")){ %>
								<img alt="상품이미지" src="/made/images/items/parts/plastic/<%= e.getPartImg() %>">
								<% } %>
							<div class="c_product_description"><a href="/made/pDetail?id=<%= e.getPartCode() %>"><%= e.getPartTitle() %></a></div></div></td><td><%= e.getPartPrice() * e.getOrderCount() %><br>(<%= e.getOrderCount() %>개)</td>
							<td><span><%= e.getOrderStateName() %></span><br><br>
							<% if(e.getShipCompanyName() != null) {%>
								<%= e.getShipCompanyName() %><br><%= e.getOrderShipCode() %><br><button onclick="check_ship('<%= e.getShipCompanyName() %>', <%= e.getOrderShipCode() %>)">배송추적</button>
							<% } %>
							</td><td><button type="button" class="popbutton_d" id="<%= e.getOrderCode() %>">송장번호 입력</button></td></tr>
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


<div class="modal fade modal_d" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">운송장 번호 입력</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      	<form name="door_to_door_frm"
			onSubmit="doorToDoorSearch();return false;">
			<select name="dtd_select" id="dtd_select">
				<option value="경동택배" selected>경동택배</option>
				<option value="대신택배">대신택배</option>
				<option value="대한통운">대한통운</option>
				<option value="동부익스프레스">동부익스프레스</option>
				<option value="로젠택배">로젠택배</option>
				<option value="우체국택배">우체국택배</option>
				<option value="이노지스택배">이노지스택배</option>
				<option value="일양로지스택배">일양로지스택배</option>
				<option value="하나로택배">하나로택배</option>
				<option value="한덱스">한덱스</option>
				<option value="한진택배">한진택배</option>
				<option value="현대택배">현대택배</option>
				<option value="CJ GLS">CJ GLS</option>
				<option value="CVSnet 편의점택배">CVSnet 편의점택배</option>
				<option value="DHL">DHL</option>
				<option value="EMS">EMS</option>
				<option value="FedEx">FedEx</option>
				<option value="GTX">GTX</option>
				<option value="HB한방택배">HB한방택배</option>
				<option value="KG옐로우캡택배">KG옐로우캡택배</option>
				<option value="KGB택배">KGB택배</option>
				<option value="TNT Express">TNT Express</option>
				<option value="UPS">UPS</option>
			</select>
			<br><br>
			<input type="text" style="width: 201px;" class="input_off"
				name="dtd_number_query" id="dtd_number_query"
				value="'-'를 제외하고 입력하세요." onClick="this.value=''"> <input
				type="submit" value="등록">
		</form>
	
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <div><button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">  
function openWin(order_code, productCode){  
    window.open("/made/receipt?order_code="+order_code+"&productCode="+productCode, "영수증", "width=650, height=650, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  
var orderCode = 0;
$(".popbutton_d").click(function(){
	orderCode = $(this).attr("id");
    $('div.modal_d').modal();
})

</script>
<script type="text/javascript">

var dtd_companys = new Array();
dtd_companys["우체국택배"] = new Array(
		13,
		"http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=",
		"1234567890123 (13자리)", "1588-1300",
		"http://parcel.epost.go.kr");
dtd_companys["대한통운"] = new Array(
		10,
		"http://www.doortodoor.co.kr/servlets/cmnChnnel?tc=dtd.cmn.command.c03condiCrg01Cmd&invc_no=",
		"1234567890 (10자리)", "1588-1255", "http://www.doortodoor.co.kr");
dtd_companys["한진택배"] = new Array(
		12,
		"http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=",
		"1234567890 (10,12자리)", "1588-0011",
		"http://hanex.hanjin.co.kr");
dtd_companys["로젠택배"] = new Array(
		11,
		"http://www.ilogen.com/iLOGEN.Web.New/TRACE/TraceView.aspx?gubun=slipno&slipno=",
		"12345678901 (11자리)", "1588-9988", "http://www.ilogen.com");
dtd_companys["현대택배"] = new Array(
		12,
		"http://www.hlc.co.kr/hydex/jsp/tracking/trackingViewCus.jsp?InvNo=",
		"1234567890 (10,12자리)", "1588-2121", "http://www.hlc.co.kr");
dtd_companys["KG옐로우캡택배"] = new Array(
		11,
		"http://www.yellowcap.co.kr/custom/inquiry_result.asp?invoice_no=",
		"12345678901 (11자리)", "1588-0123", "http://www.yellowcap.co.kr");
dtd_companys["KGB택배"] = new Array(10,
		"http://www.kgbls.co.kr/sub5/trace.asp?f_slipno=",
		"1234567890 (10자리)", "1577-4577", "http://www.kgbls.co.kr");
dtd_companys["EMS"] = new Array(
		13,
		"http://service.epost.go.kr/trace.RetrieveEmsTrace.postal?ems_gubun=E&POST_CODE=",
		"EE123456789KR (13자리)", "1588-1300",
		"http://service.epost.go.kr");
dtd_companys["DHL"] = new Array(
		0,
		"http://www.dhl.co.kr/publish/kr/ko/eshipping/track.high.html?pageToInclude=RESULTS&type=fasttrack&AWB=",
		"1234567890 (10자리)", "1588-0001", "http://www.dhl.co.kr");
dtd_companys["한덱스"] = new Array(
		10,
		"http://btob.sedex.co.kr/work/app/tm/tmtr01/tmtr01_s4.jsp?IC_INV_NO=",
		"1234567890 (10자리)", "1588-9040", "http://www.e-handex.co.kr");
dtd_companys["FedEx"] = new Array(
		12,
		"http://www.fedex.com/Tracking?ascend_header=1&clienttype=dotcomreg&cntry_code=kr&language=korean&tracknumbers=",
		"123456789012 (12자리)", "080-023-8000",
		"http://www.fedex.com/kr");
dtd_companys["동부익스프레스"] = new Array(
		12,
		"http://www.dongbuexpress.co.kr/Html/Delivery/DeliveryCheckView.jsp?item_no=",
		"123456789012 (12자리)", "1588-8848",
		"http://www.dongbuexpress.co.kr");
dtd_companys["CJ GLS"] = new Array(12,
		"http://nexs.cjgls.com/web/service02_01.jsp?slipno=",
		"123456789012 (12자리)", "1588-5353", "http://www.cjgls.co.kr");
dtd_companys["UPS"] = new Array(
		25,
		"http://www.ups.com/WebTracking/track?loc=ko_KR&InquiryNumber1=",
		"M1234567890 (최대 25자리)", "1588-6886",
		"http://www.ups.com/content/kr/ko/index.jsx");
dtd_companys["하나로택배"] = new Array(
		10,
		"http://www.hanarologis.com/branch/chase/listbody.html?a_gb=center&a_cd=4&a_item=0&fr_slipno=",
		"1234567890 (최대 10자리)", "1577-2828",
		"http://www.hanarologis.com");
dtd_companys["대신택배"] = new Array(
		13,
		"http://home.daesinlogistics.co.kr/daesin/jsp/d_freight_chase/d_general_process2.jsp?",
		"1234567890123 (13자리)", "043-222-4582",
		"http://apps.ds3211.co.kr");
dtd_companys["경동택배"] = new Array(11,
		"http://www.kdexp.com/sub4_1.asp?stype=1&p_item=",
		"12345678901 (최대11자리)", "031-460-2400", "http://www.kdexp.com/");
dtd_companys["이노지스택배"] = new Array(13,
		"http://www.innogis.net/trace02.asp?invoice=",
		"1234567890123 (최대13자리)", "1566-4082",
		"http://www.innogis.net/");
dtd_companys["일양로지스택배"] = new Array(
		9,
		"http://www.ilyanglogis.com/functionality/tracking_result.asp?hawb_no=",
		"123456789 (9자리)", "1588-0002", "http://www.ilyanglogis.com/");
dtd_companys["CVSnet 편의점택배"] = new Array(10,
		"http://was.cvsnet.co.kr/src/ctod_status.jsp?invoice_no=",
		"1234567890 (10자리)", "1566-1025", "http://www.cvsnet.co.kr/");
dtd_companys["TNT Express"] = new Array(
		13,
		"http://www.tnt.com/webtracker/tracking.do?respCountry=kr&respLang=ko&searchType=CON&cons=",
		"GE123456789WW (9,13자리)", "1588-0588",
		"http://www.tnt.com/express/ko_kr/site/home.html");
dtd_companys["HB한방택배"] = new Array(12,
		"http://www.hbtb.co.kr/search/s_search.asp?f_slipno=",
		"123456789012 (12자리)", "1588-1059", "http://www.hbtb.co.kr/");
dtd_companys["GTX"] = new Array(
		12,
		"http://www.gtx2010.co.kr/del_inquiry_result.html?s_gbn=1&awblno=",
		"123456789012 (12자리)", "1588-1756", "http://www.gtx2010.co.kr");

var dtd_select_obj = $("#dtd_select");

function doorToDoorSearch() {
	var company = $("#dtd_select option:selected").val();
	if (company == "")
		company = "우체국택배";
	
	var query_obj = $('#dtd_number_query');
	var query = query_obj.val();
	query = query.replace(' ', '');
	var url = "";

	/* 운송장 번호 값 확인 */
	if (company == "UPS") {
		var pattern1 = /^[0-9a-zA-Z]{9,12}$/i;
		var pattern2 = /^[0-9a-zA-Z]{18}$/i;
		var pattern3 = /^[0-9a-zA-Z]{25}$/i;
		if (query.search(pattern1) == -1
				&& query.search(pattern2) == -1
				&& query.search(pattern3) == -1) {
			alert(company + "의 운송장 번호 패턴에 맞지 않습니다.");
			query_obj.focus();
			return false;
		}
	} else if (company == "EMS") {
		var pattern = /^[a-zA-Z]{2}[0-9]{9}[a-zA-Z]{2}$/;
		if (query.search(pattern) == -1) {
			alert(company + "의 운송장 번호 패턴에 맞지 않습니다.");
			query_obj.focus();
			return false;
		}
	} else if (company == "한진택배" || company == "현대택배") {
		if (!isNumeric(query)) {
			alert("운송장 번호는 숫자만 입력해주세요.");
			query_obj.focus();
			return false;
		} else if (query.length != 10 && query.length != 12) {
			alert(company + "의 운송장 번호는 10자리 또는 12자리의 숫자로 입력해주세요.");
			query_obj.focus();
			return false;
		}
	} else if (company == "경동택배") {
		if (!isNumeric(query)) {
			alert("운송장 번호는 숫자만 입력해주세요.");
			query_obj.focus();
			return false;
		} else if (query.length != 9 && query.length != 10
				&& query.length != 11) {
			alert(company
					+ "의 운송장 번호는 9자리 또는 10자리 또는 11자리의 숫자로 입력해주세요.");
			query_obj.focus();
			return false;
		}
	} else if (company == "이노지스택배") {
		if (!isNumeric(query)) {
			alert("운송장 번호는 숫자만 입력해주세요.");
			query_obj.focus();
			return false;
		} else if (query.length > 13) {
			alert(company + "의 운송장 번호는 최대 13자리의 숫자로 입력해주세요.");
			query_obj.focus();
			return false;
		}
	} else if (company == "TNT Express") {
		var pattern1 = /^[a-zA-Z]{2}[0-9]{9}[a-zA-Z]{2}$/;
		var pattern2 = /^[0-9]{9}$/;
		if (query.search(pattern1) == -1
				&& query.search(pattern2) == -1) {
			alert(company + "의 운송장 번호 패턴에 맞지 않습니다.");
			query_obj.focus();
			return false;
		}
	} else {
		if (!isNumeric(query)) {
			alert("운송장 번호는 숫자만 입력해 주세요.");
			query_obj.focus();
			return false;
		} else if (dtd_companys[company][0] > 0
				&& dtd_companys[company][0] != query.length) {
			alert(company + "의 운송장 번호는 " + dtd_companys[company][0]
					+ "자리의 숫자로 입력해 주세요.");
			query_obj.focus();
			return false;
		}
	}
	/* 링크만들기 */
	if (company == "대신택배") {
		url = dtd_companys[company][1];
		url += "billno1=" + query.substring(0, 4);
		url += "&billno2=" + query.substring(4, 7);
		url += "&billno3=" + query.substring(7, 13);
	} else if (dtd_companys[company][1]) {
		url = dtd_companys[company][1] + query;
	}
	$.ajax({
		url : "/made/scinsert",
		data : {company : company, shipCode : query, orderCode : orderCode},
		type : "get",
		success : function(data){
			if(data == "true"){
				alert("등록됐습니다.");
				window.open(url, "_blank");
				location.reload();
			}
			else{
				alert("등록에 실패했습니다.");
			}
		}
	});
	
}

function isNumeric(s) {
	var count = 0;
	for (i = 0; i < s.length; i++) {
		if (s.charAt(i) < '0' || s.charAt(i) > '9') {
			count++;
		}
	}
	if (count > 0) {
		return 0;
	} else {
		return 1;
	}
}
function check_ship(company, query){
	/* 링크만들기 */
	if (company == "대신택배") {
		url = dtd_companys[company][1];
		url += "billno1=" + query.substring(0, 4);
		url += "&billno2=" + query.substring(4, 7);
		url += "&billno3=" + query.substring(7, 13);
	} else if (dtd_companys[company][1]) {
		url = dtd_companys[company][1] + query;
	}
	window.open(url, "_blank");
}
</script>  
</body>
</html>