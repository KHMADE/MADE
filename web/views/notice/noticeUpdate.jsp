<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.Notice, java.util.*, java.sql.Date" %>
<%	
	Notice n = (Notice)request.getAttribute("notice");	
	int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();	
%> 
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title> QA - MAːDÆ</title>
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
						<h2>공지사항</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li>NOTICE</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
		<br>
        <div class="container">
        <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading hide"></div>
                <form method="POST" action="/made/nupdate" >
                <input type="hidden" name="nnum" value="<%=n.getNoticeCode()%>">
                <input type="hidden" name="page" value="<%= currentPage %>">
                    <div class="panel-body article">
                        <h4>1대1문의</h4>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 >제목 : &nbsp;<input type="text" name="title" style="width:50%;" value="<%=n.getNoticeTitle()%>"></h4> </div>
                               <textarea name="content" class="summernote"><%=n.getNoticeContents() %></textarea>
                        </div>
                        <ul class="pager">
                            <li>
                                <input type="submit" class="btn btn-default" value="수정하기">
                            </li>
                            </form>
                            <li>
                               <button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">취소하기</button>
                            </li>
                        </ul>
                    </div>
            </div>
</div>
    </section>
	<!-- summernote apply -->
	<script type="text/javascript">
  $(function() {
    $('.summernote').summernote({
      width: '100%',	    
      height: 300,          // 기본 높이값
      minHeight: null,      // 최소 높이값(null은 제한 없음)
      maxHeight: null,      // 최대 높이값(null은 제한 없음)
      focus: true,          // 페이지가 열릴때 포커스를 지정함
      lang: "ko-KR",         // 한국어 지정(기본값은 en-US)
      callbacks: {
      onImageUpload: function(files, editor, welEditorble) {
    	  console.log(files);
    	  console.log(files[0]);
		data = new FormData();
		data.append("file",files[0]);
		var $note = $(this);
		$.ajax({
			data : data,
			type : "post",
			url : '/made/nUpload', // servlet url
			cache : false,
			contentType : false,
			processData : false,
			success : function(url){
				//alert(url);
				$note.summernote('insertImage',url);
			}, error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}}
    });
  });
</script>
	<!-- summernote apply -->
	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->

</body>
</html>