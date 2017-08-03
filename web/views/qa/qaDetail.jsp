<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="qa.model.vo.Qa, java.util.*, java.sql.Date" %>
<%	
	Qa q = (Qa)request.getAttribute("qa");	
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
<section class="wrapper">
        <div class="container">
	<div class="page-header">
		<h1>1대1 문의</h1>
	</div>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading hide"></div>

			<form action="/made/qaupdate" method="post">
			<input name="qnum"  type="hidden" value="<%=q.getQaCode()%>">
				<div class="panel-body article">
					<h4>
						<%=q.getQaTitle() %>
					</h4>
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<span class="label label-info">보낸 아이디 </span>&nbsp;
                            <%=q.getMemberId() %>
							<span class="label label-info">
								보낸 날짜
							</span>&nbsp;
                            <%=q.getQaDate() %>
						</div>
						<div class="panel-body content">
						<%=q.getQaContents() %>
						</div>
					</div>
					<%if(q.getQaAnswer()==null){ %>
					<% if(m.getClassCode().charAt(0) == 'A'){ %>
					<h4>
						<%=q.getMemberId() %>님 에게 보낼 답장 메세지
					</h4>
					<div class="panel panel-default">
					<div class="">
					<textarea name="answer" class="summernote"></textarea>
					</div>
					<ul class="pager">
							<li>
							<input type="submit" class="btn btn-default" value="답장">
							</li>
						<li>
							<button type="button" class="btn btn-default" onclick="top.location.href='/made/qlist?page=1'">
								목록보기
							</button>
						</li>
					</ul>
				</div>
				<%}else{ %>
				<h4> 관리자가 문의를 확인중입니다..		</h4>
				<ul class="pager">
						<li>
							<button type="button" class="btn btn-default" onclick="top.location.href='/made/qlist?page=1'">
								목록보기
							</button>
						</li>
					</ul>
				<%} %>
				<%}else{ %>
					
					<h4>
						관리자의 답변
					</h4>
					<div class="panel panel-default">
					<br>
					<div class="panel-heading">
							<span class="label label-info">보낸 아이디 </span>&nbsp;
                            관리자
						</div>
						<div class="panel-body content">
						<%=q.getQaAnswer() %>
						</div>
				</div>
				<ul class="pager">
						<li>
							<button type="button" class="btn btn-default" onclick="top.location.href='/made/qlist?page=1'">
								목록보기
							</button>
						</li>
					</ul>
				<%} %>
				</form>
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
			url : '/made/qaUpload', // servlet url
			cache : false,
			contentType : false,
			processData : false,
			success : function(url){
				alert(url);
				$note.summernote('insertImage',url);
			}, error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
      }
    });
  });
</script>
	<!-- summernote apply -->
	
  <!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
</body>
</html>