<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="message.model.vo.*, java.util.ArrayList, java.sql.Date" %>    
<%
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>My info - MAːDÆ</title>
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
    
    
    
    
    
    
    
    <script type="text/javascript">
    	var request = new XMLHttpRequest();
    	function searchFunction() {
    		request.open("Post", "./UserSearchServlet?messageCode=" + encodeURIComponent(document.getElementById("messageCode").value),true)
    		request.onreadysataechange = searchProcess;
    		request.send(null);
    	}
    	function searchProcess() {
    		var table = document.getElementById("ajaxTable");
    		table.innerHTML = "";
    		if(request.readyState == 4 && request.status == 200) {
    			var object = eval( '(' + request.responseText + ')');
    			var result = object.result;
    			for(var i = 0; i < result.length; i++){
    				var row table.insertRow(0);
    				for(var j = 0; j < result[i].length; j++) {
    					var cell = row.innerCell(j);
    					cell.innerHTML = result[i][j].value;
    				}
    			}
    		}
    	}
    	
    </script>
    
    
    
    
    
    
</head>
<body>
<!--Start Header-->
	<%@ include file="../../header.jsp" %>
<!--End Header-->
	<!-- Start MSG MENU -->
	<section class="page_head">
          <!-- 메일검색어 -->
            <div class="content_header" align="center">

							<div class="msearch">
								<label for="searchKeyWord" class="blind">쪽지 검색어</label>
								<input type="search" class="search" id="messageCode" onkeyup="searchFunction()" placeholder="쪽지검색" 
								style="ime-mode:active" id="searchKeyWord" maxlength="100" 
								name="" autocomplete="off" 
								onClick="mySimpleSearch.showHistory();">
								&nbsp;&nbsp;<button type="button" class="btn btn-default active" onclick="searchFunction();" id="searchBtn" name="">
								<i class="fa fa-search">
								</i></button>

							</div>
							
							
							
							
							
							
							<tbody id="ajaxTable">
								<tr>
									<td>정진모</td>
									<td>25</td>
									<td>남자</td>
									<td>jjm@naver.com</td>
								</tr>
							</tbody>
							
							
							
							
							
							
							
            <!-- 메일검색어 -->
            
            <div id="cont_flex_area" class="list_normal">
						<div id="sendresultDivContent" class="divWriteOk" style="display:none;"></div>
						
						<div id="writeWrap" style="display:none; position:relative"></div>
						
						<div class="divList unselectable" onclick="mUtil.addHotkey('list');">
							<div id="list_for_view" class="listWrap">
								<h4 class="blind">받은 메일함 목록</h4>
								<ol class="mailList single" style="min-width:600px">
								</ol>
							</div>
			<div class="container">
			
			
			<!-- 메인 쪽지함 view 부분 -->
			
			
				<div class="row">
					<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <!-- <li class="active"><a href="#">아이야 <span class="sr-only">(current)</span></a></li> -->
<h2 style="font-size: 15pt; font-familly:'area';" align="center">&nbsp;&nbsp;&nbsp;&nbsp;NOTE </h2>
          </ul>
						<nav id="breadcrumbs">
						
							<ul>
								<li> My Note</li><br><hr>
								
								
								
								
								<!-- 메인 쪽지함 view 부분 끝-->
								
								
								
								<!-- 메일쓰기 내게쓰기 부분 -->
								
							<div class="btn_workset">
				<a href="#" class="active">
					<strong class="active"><span>쪽지 쓰기</span></strong>
				</a> &nbsp;&nbsp;&nbsp;
				<a href="#" class="active">
					<strong class="active"><span>내게쓰기</span></strong>
				</a>
			</div>
			<br><br>
			
			<div>
			<ul>
			<li class="active"><a href="/made/acheck?page=1">전체쪽지함 <span class="sr-only">(current)</span></a></li><br><br>
					<li><a href="/made/recipient?page=1&mid=<%= m.getId() %>">받은 쪽지함</a></li><br><br>
            		<li><a href="/made/----------?page=1&mid=<%= m.getId() %>">내게쓴쪽지함</a></li><br><br>
           	 		<li><a href="/made/----------?page=1&mid=<%= m.getId() %>">보관함</a></li>
           	 		
           	 		</ul>
			</div>
			</ul>
				</nav>
				</div>
				</div>
				</div>
			</section>
	<!-- End MSG MENU -->
	<!--start wrapper-->
	<section class="wrapper">
	
			<section class="content typography">
				<div class="container">
				<div class="row sub_content">
				<div class="active">
					<div class="dividerHeading">
							
							
	
	
	<!--                전체쪽지함    					-->							
	
	
	
	<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
        <!--     <li class="active"><a href="/made/acheck?page=1">전체쪽지함 <span class="sr-only">(current)</span></a></li>
            		<li><a href="#">받은 쪽지함</a></li>
            		<li><a href="#">내게 쓴 쪽지함</a></li>
           	 		<li><a href="#">쪽지 보관함</a></li> -->
          </ul>
          <h3>Note : Mail : Message</h3>
		</section>
	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
</body>
</html>