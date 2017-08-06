<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="design.model.vo.Design, part.model.vo.Part, java.util.ArrayList" %>
<%	
	Design d = (Design) request.getAttribute("degisn");
	ArrayList<Part> plist = (ArrayList<Part>)request.getAttribute("plist");
	ArrayList<Part> plist_all = (ArrayList<Part>)request.getAttribute("plist_all");
	int max = plist.size();
%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>디자인 상품 게시글 수정 페이지 - MAːDÆ</title>
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
    <style type="text/css">
        table td b{
            font-size: 15pt;
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
						<h2>디자인 상품 게시글 수정</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li><a href="/made/designitemlist?page=1">Design</a></li>
								<li>Design Item Update</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        <div class="container">
        <form id="update" method="post" action="/made/dupdate?id=<%=d.getDesignId() %>" enctype="multipart/form-data">
        <input type="number" name="partCnt" id="partCnt" style="display: none;">
        <table class="table table-bordered table-striped table-hover">
        <tr><td><b>상품명 : </b></td><td><input type="text" name="title" id="title" value="<%=d.getDesignName()%>"></td></tr>
        <tr><td><b>디자이너 명 : </b></td><td><%= d.getDesignerId() %></td></tr>
        <tr><td><b>카테고리 : </b></td><td>
        <select name="category" id="category" style="text-ailgn:center;">
        	<option value="">--- 선택 ---</option>
        	<option value="WOOD">목재</option>
        	<option value="STEEL">철재</option>
        	<option value="PLASTIC">플라스틱</option>
        	<option value="ETC">기타</option>
        </select></td></tr>
        <tr><td><b>완제품 가격 : </b></td><td><input type="number" name="price" id="price" min="0" value="<%=d.getDesignPrice()%>"> 원</td></tr>
        <tr><td><b>부품 사용 유무 </b></td><td>
        <% if (plist.size() < 1) { %>
        	<input class="btn-primary" type="checkbox" id="partSelect" name="partSelect">사용
        	&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" name="addPart" id="addPart" style="display: none;"><i class="fa fa-plus"></i></button>
        	&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" name="delPart" id="delPart" style="display: none;"><i class="fa fa-minus"></i></button>
        	<div id="partlist" class="partlist" style="margin-top:7px; display: none;">
        	<select name="part1" id="part1" style="text-ailgn:center;">
        	<option value="">--- 선택 ---</option>
        	<% for(Part p : plist_all){ %>
        	<option value="<%=p.getPartId()%>"><%=p.getPartName()%></option>
        	<% } %>
        	</select>&nbsp;&nbsp;&nbsp;<input type="number" id="partQuan1" name="partQuan1" min="1" max="50" size="3">&nbsp;SET
        	&nbsp;&nbsp;&nbsp;
        	</div>
 		<% } else { %>
 			<input class="btn-primary" type="checkbox" id="partSelect" name="partSelect" checked>사용
 			&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" name="addPart" id="addPart"><i class="fa fa-plus"></i></button>
        	&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default" name="delPart" id="delPart"><i class="fa fa-minus"></i></button>
        	<% for(int i = 0; i<plist.size(); i++){ %>
        	<div id="partlist" class="partlist" style="margin-top:7px;">
        	<select name="part<%= i+1 %>" id="part<%= i+1 %>" style="text-ailgn:center;">
        	<option value="">--- 선택 ---</option>
        	<% for(Part p : plist_all){ %>
        	<% if(p.getPartId().equals(plist.get(i).getPartId())) { %>
        	<option value="<%=p.getPartId()%>" selected><%=p.getPartName()%></option>
        	<% } else { %>
        	<option value="<%=p.getPartId()%>"><%=p.getPartName()%></option>
        	<% }} %>
        	</select>&nbsp;&nbsp;&nbsp;<input type="number" id="partQuan<%= i+1 %>" name="partQuan<%= i+1 %>" min="1" max="50" size="3" value="<%=plist.get(i).getQuantity()%>">&nbsp;SET
        	&nbsp;&nbsp;&nbsp;
        	</div>
        	<% } %>
 		<% } %>
        	</td></tr>
	    <tr><td><p><b>첨부된 이미지 파일 : </b></p></td><td>
        <img id="img_preview" style="width:100px; height:100px;" class="img-circle" src="/made/images/items/designed/<%=d.getDesignImg()%>"><br>
        <tr><td><p><b>수정할 이미지 파일 : </b></p></td><td>
        <img id="img_preview" class="img-circle"><br>
        <input type="file" id="input_file"></td></tr>
        <tr><td colspan="2"><p><b>상품 설명 :</b></p>
        <textarea id="content" name="content" class="summernote"><%=d.getDesignDesc()%></textarea></td></tr>
        <tr><td colspan="2" align="center">
        <button class="btn btn-default" type="submit">수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button class="btn btn-default" type="reset">취소하기</button></td></tr>
        </table></form>
        <p align="center"><button class="btn btn-default" type="button" onclick="javascript:history.go(-1);">이전 페이지로</button></p>
        </div>
    </section>
    
<!-- summernote apply -->
	<script type="text/javascript">
	var cnt = <%= plist.size()%>;
	
	$("#update").submit(function( event ) {
		if($("#title").val() == ""){
            alert("상품 명을 입력해주세요!");
            $("#title").focus();
            event.preventDefault();
        } else if($("#price").val() == 0) {
            alert("상품 가격은 0원이 될 수 없습니다.");
            $("#price").focus();
            event.preventDefault();
        } else if($('#category option:selected').val() == ""){
            alert("카테고리를 선택해 주세요!!");
            $("#category").focus();
            event.preventDefault();
        } else if($('#quan').val() == ""){
            alert("재고 수량을 적어 주세요!!");
            $("#quan").focus();
            event.preventDefault();
        } else {
            $(".partlist select").each(function(){
                 if($("#partSelect").is(":checked") && $(this).val() == ""){
                	alert("올바른 부품을 선택해주세요!");
                  	$(this).focus();
                   	event.preventDefault();
                 }
            });
    		$(".partlist input[type=number]").each(function(){
    			if($("#partSelect").is(":checked") && $(this).val() == ""){
    				alert("필요한 부품 수량을 적어 주셔야 합니다.");
    				$(this).focus();
    				event.preventDefault();
    			}
            });
    		$("#partCnt").val(cnt);
    		alert($("#title").val()+" 상품이 정상적으로 수정되었습니다!!!");
        	return;
       	}
	});
  $(function() {
	  //$("#partlist").hide();
	$("select option[value='<%= d.getDesignCategory()%>']").attr("selected", true);
	$("#partSelect").change(function(){
        if($("#partSelect").is(":checked")){
            cnt = 1;
            $(".partlist").toggle("slow");
            $("#addPart").toggle("fast");
            $("#delPart").toggle("fast");
        }else{
            cnt = 0;
        	//$("#partlist").hide(500);
            $(".partlist").not(":first").remove();
            $(".partlist").toggle("slow");
            $("#addPart").toggle("fast");
            $("#delPart").toggle("fast");
        }
    });
     
    $("#addPart").on("click",function(){
    	cnt++;
    	$(".partlist:first").clone().insertAfter(".partlist:last");
        $(".partlist:last select").attr({
            name : 'part'+cnt,
            id : 'part'+cnt
        });
        $(".partlist:last input[type=number]").attr({
            name : 'partQuan'+cnt,
            id : 'partQuan'+cnt
        });
        //alert(cnt);
    });
    $("#delPart").on("click",function(){
    	if(cnt <= 1){
            alert("더 이상 부품을 제거할 수 없습니다.\n부품을 사용하지 않으신다면\n사용 체크를 해제하세요!");
        } else {
            $(".partlist:last").remove();
    		cnt--;
        	//alert(cnt);
    	}
    });
      
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
			url : '/made/designUploadImg', // servlet url
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
	}
      }
    });
  });
</script>
	<!-- summernote apply -->
	
	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
	<script type="text/javascript" src="/made/views/user/project(sk).js"></script>
</body>
</html>