<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/made/404-page.jsp" %>
<%@ page import="message.model.vo.*, java.util.ArrayList, java.sql.Date" %>    
<%
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list");
	String msgTitle = (String)request.getAttribute("msgTitle");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>MessageListView - MAːDÆ</title>
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
    		sindow.onload = function() {
    			searchFunction();    	
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
								<input type="search" class="search" 
								id="messageCode" onkeyup="searchFunction()" placeholder="쪽지검색" 
								id="searchKeyWord"><a href="">
								&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default active" onclick="searchFunction();" id="searchBtn" name="">
								<i class="fa fa-search">
								</i></button>

							</div>
								
							
							
							
					<!-- 		
							
							<tbody id="ajaxTable">
								<tr>
									<td>정진모</td>
									<td>25</td>
									<td>남자</td>
									<td>jjm@naver.com</td>
								</tr>
							</tbody>
							
							
							 -->
							
							
							
							
							
            <!-- 메일검색어 -->
			
			
			
			<!-- 메인 쪽지함 view 부분 -->
			
			<div class="container">
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
				<h1 align="center"><%= msgTitle %> 목록</h1>
<h3 align="center">총 게시글 갯수 : <%= list.size() %> 개
<%-- <%@ include file="note.jsp" %> --%>



<%-- 

<% if(member != null){ %>
&nbsp; &nbsp; &nbsp; <button onclick="showInsertForm();">글쓰기</button>
<%  } %></h3> 

--%>







<table align="center" border="1" cellspacing="0" width="700">
<tr><th>보낸이</th><th>받는이</th><th>제목</th><th>날짜</th></tr>






<%
	for(Message msg : list){
%>
	<%-- <td>
		<% if(b.getBoardLevel() == 1){  //원글의 답글일 때 %>
		 &nbsp; &nbsp; ▶ 
		<% }else if(b.getBoardLevel() == 2){ //답글의 답글일 때 %>
		 &nbsp; &nbsp; &nbsp; &nbsp; ▶▶ 
		<% } %>
		로그인한 사용자만 상세보기할 수 있게 처리함
		<% if(member != null){ %>
			<a href="/first/bdetail?bnum=<%= b.getBoardNum() %>&page=<%= currentPage %>"><%= b.getBoardTitle() %></a>
		<% }else{ %>
			<%= b.getBoardTitle() %>
		<% } %>
	</td> --%>

<td align="center"><%= msg.getMessageSenderId() %></td>
<td align="center"><%= msg.getMessageRecipientId() %></td>
<td align="center"><a href="/made/mdetail?mcode=<%=msg.getMessageCode()%>"><%= msg.getMessageTitle() %></a></td>
<td align="center"><%= msg.getMessageDate() %></td>
<%-- <td align="center">
	<% if(b.getBoardOriginalFileName() != null){  //원글의 답글일 때 %>
		 ◎
	<% }else{ %>
		&nbsp;
	<% } %>	 
</td> --%></tr>
<%  } //for close  %> 









<%-- 페이지 번호 처리 --%>
<tr align="center" height="20">
<td colspan="6">
	<%  if(currentPage <= 1){	%>
		[이전] &nbsp;
	<%  }else{ %>
		<a href="/made/acheck?page=<%= currentPage - 1 %>">[이전]</a> &nbsp;
	<%  } %>
	<%-- 페이지 숫자 보여주기 --%>
	<%  for(int p = startPage; p <= endPage; p++){ 
			if(p == currentPage){
	%><font color="skyblue" size="4"><b>(<%= p %>)</b></font>
	<%     }else{ %>
		<a href="/made/acheck?page=<%= p %>"><%= p %></a>
	<%  }} //else and for close %>
	<% if(currentPage >= maxPage){ %>
		[다음]
	<% }else{ %>
		<a href="/made/acheck?page=<%= currentPage + 1 %>">[다음]</a>
	<% } %>
</td>
</tr>
</table>
<br><br>
				</div>
				</div>
			</section>
	<!-- End MSG MENU -->

	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
</body>
</html>





