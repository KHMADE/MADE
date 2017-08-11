<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.Notice,noticereply.model.vo.NoticeReply, java.util.*, java.sql.Date" %>
<%	
	ArrayList<NoticeReply> list = (ArrayList<NoticeReply>)request.getAttribute("list");
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
   
  <!--  <script>
		$(function(){
			$("#replywrite").click(function(){
				$.ajax({
					url : "/made/nrinsert",
					data : 'member',member,
					dataType : "text",
					type : "post",
					success : function(value){
						
					},
					error : function(value){
						alert("답글을 입력해주세요.");
					}
				});
				return false;
			}); //click
		}); //ready
	</script> -->
</head>
<body>

<!--Start Header-->
	<%@ include file="../../header.jsp" %>
	<!--End Header-->
<section class="wrapper">
        <div class="container">
	<div class="page-header">
		<h1>공지사항</h1>
	</div>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading hide"></div>

			<form action="/made/qaupdate" method="post">
				<div class="panel-body article">
					<h4>
						<%=n.getNoticeTitle() %>
					</h4>
					
					<div class="panel panel-default">
						<div class="panel-heading">
							<span class="label label-info">
								작성 날짜
							</span>&nbsp;
                            <%=n.getNoticeDate() %>
						</div>
						<div class="panel-body content">
						<%=n.getNoticeContents() %>
						</div>
					</div>
				<ul class="pager">
						<%if(m!=null){ %>
						<%if(m.getClassCode().charAt(0)=='A'){ %>
						<li>
							<button type="button" class="btn btn-default" onclick="top.location.href='/made/ndelete?nnum=<%= n.getNoticeCode() %>'">
								삭제하기
							</button>
						</li>
						
						<li>
							<button type="button" class="btn btn-default" onclick="top.location.href='/made/nupview?nnum=<%= n.getNoticeCode() %>&page=<%= currentPage %>'">
								수정하기
							</button>
						</li>
						<%}} %>
					</ul>
				</form>
				
				<form action="/made/nrinsert" method="post">
				<%if(m!=null){ %>
				<input type="hidden" value="<%=m.getId()%>" name="id">
				<input type="hidden" value="<%=m.getProfileImg()%>" name="img">
				<%} %>
				<input type="hidden" value="<%=n.getNoticeCode()%>" name="nnum">
				<input type="hidden" value="<%=currentPage%>" name="page">
				<div class="news_comments">
                            <div class="dividerHeading">
                                <h4><span>댓글 (<%=list.size()%>)</span></h4>
                            </div>
                            <% for(NoticeReply r:list){ %>
                            <div id="comment">
                            <input type="hidden" id="replyCode" class="replyCode" name="replyCode" value="<%=r.getReplyCode()%>">
                                <ul class="comment-list">                              
                                    <li class="comment">
                                        <div class="avatar"><img alt="" src="/made/images/userimage/<%=r.getMemberImg() %>" class="avatar"></div>
                                        <div class="comment-container">
                                            <h4 class="comment-author" ><a href="#"><%=r.getMemberId() %></a></span></h4>
                                            <div class="comment-meta"><a href="#" class="comment-date link-style1"><%=r.getReplyDate() %></a></div>
                                            <div class="comment-body replyContents">
                                                <p><%=r.getReplyContent() %></p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <%if(m!=null){ %>
                                <% if( r.getMemberId().equals(m.getId())){ %>
										<p align="right">
										<button type="button" class="btn btn-default btn-xs updateConfirm1" name="updateConfirm1" id="updateConfirm1" style="display: none;">수정완료</button>
										&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs update1" name="update1" id="update1">수정하기</button>
										&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs delete1" name="delete1" id="delete1">삭제하기</button></p>
                            <%}} %>
                            </div>
                            <%} %>
							<%if(m!=null){%>
                            <div class="comment-box row">
                                <div class="col-sm-12">
                                    <p>
                                        <textarea name="content" class="form-control" rows="6" cols="40" onfocus="if(this.value == 'Message') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Message'; }" placeholder="Message"></textarea>
                                    </p>
                                </div>
                            </div>
                            <p align="center"><input type="submit" class="btn btn-default" value="댓글쓰기">
         					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         					<button type="button" class="btn btn-default" onclick="top.location.href='/made/nlist?page=1'">
								목록보기
							</button></p>
         					<%}else{ %>
         					<div class="comment-box row">
                                <div class="col-sm-12">
                                    <p align="center">
							<button type="button" class="btn btn-default" onclick="top.location.href='/made/nlist?page=1'">
								목록보기
							</button></p>
							<%} %>
                        </div>
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
			url : '/made/noticeUpload', // servlet url
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
<script>
<%if (m!=null){%>
								$(function(){
                                    $(".updateConfirm1").on('click',function(){
                                    	var parentP = $(this).parent();
                                        var parentDiv = parentP.parent();
                                        var siblingUl = parentDiv.children('ul.comment-list');
                                        var replyCode = parentDiv.children('input').val();
                                        var updtContent = parentP.children(".updateContent").val();
                                        console.log(updtContent);
                                        
                                        $.ajax({
                                            url : "/made/nrupdate",
                                            type : "post",
                                            data: {
                                            	nnum : "<%=n.getNoticeCode()%>",
                                            	id : "<%=m.getId()%>",
                                                reviewCode : replyCode,
                                                updtContent : updtContent
                                            },
                                            success : function(data) {
                                            	alert(data);
                                            }, error : function(request,status,error) {
                                               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                            }
                                        });
                                        
                                        parentDiv.find(".replyContents").html(updtContent);
                                        parentP.children(".updateContent").remove();
                                        parentP.children(".updateConfirm1").toggle("fast");
                                        parentP.children('.update1').text("수정하기");
									});
                                    
									$(".update1").on('click',function(){
										var parentP = $(this).parent();
                                        var parentDiv = parentP.parent();
                                        var siblingUl = parentDiv.children('ul.comment-list');
										var content = siblingUl.find('div.replyContents p').text().trim();
										
										if($(this).text() == "수정하기"){
											parentP.append('<textarea style="margin-top:7px;" class="updateContent" name="updateContent" id="updateContent">'+content+'</textarea>');
											parentP.children(".updateConfirm1").toggle("fast");
											$(this).text("수정취소");
										} else {
											parentP.children(".updateContent").remove();
											$(this).text("수정하기");
											parentP.children(".updateConfirm1").toggle("fast");
										}
									});
									
									$(".delete1").on('click',function(){
										var parentP = $(this).parent();
                                        var parentDiv = parentP.parent();
                                        var replyCode = parentDiv.children('input').val();
                                        
										$.ajax({
                                            url : "/made/nrdelete",
                                            type : "post",
                                            data: {
                                            	replyCode : parentDiv.children($("input[type=hidden]")).val(),
                                            	id : "<%=m.getId()%>",
                                            	reviewCode : replyCode
                                            },
                                            success : function(data) {
                                                alert(data);
                                                parentDiv.remove();
                                            }, error : function(request,status,error) {
                                               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                            }
                                    });
                                });     
                             });
		<%}%>
	</script>
  <!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
</body>
</html>