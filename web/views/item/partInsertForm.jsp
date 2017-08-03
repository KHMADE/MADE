<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>부품 등록 페이지 - MAːDÆ</title>
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
    <style rel="stylesheet" type="text/css">
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
						<h2>부품 등록</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li><a href="/made/partitemlist?page=1">Part</a></li>
								<li>Parts Item</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        <div class="container">
        <form id="insert" method="post" action="/made/pinsert" enctype="multipart/form-data">
        <table class="table table-bordered table-striped table-hover">
        <tr><td><b>상품명 : </b></td><td><input type="text" name="title" id="title"></td></tr>
        <tr><td><b>가격 : </b></td><td><input type="number" name="price" id="price" min="0"> 원</td></tr>
        <tr><td><b>매입재고 : </b></td><td><input type="number" name="quan" id="quan" min="1"> 개</td></tr>
        <tr><td><b>카테고리 : </b></td><td>
        <select name="category" id="category" style="text-ailgn:center;">
        	<option value="">--- 선택 ---</option>
        	<option value="WOOD">목재</option>
        	<option value="STEEL">철재</option>
        	<option value="PLASTIC">플라스틱</option>
        	<option value="ETC">기타</option>
        </select></td></tr>
        <tr><td><p><b>첨부 이미지 파일 : </b></p></td><td>
        <img id="img_preview" class="img-circle"><br>
        <input type="file" id="input_file"></td></tr>
        <tr><td colspan="2"><p><b>상품 설명 :</b></p>
        <textarea id="content" name="content" class="summernote"></textarea></td></tr>
        <tr><td colspan="2" align="center">
        <button class="btn btn-default" type="submit">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button class="btn btn-default" type="reset">취소하기</button></td></tr>
        </table></form>
        <p align="center"><button class="btn btn-default" type="button" onclick="javascript:history.go(-1);">이전 페이지로</button></p>
        </div>
    </section>
    
<!-- summernote apply -->
	<script type="text/javascript">
	$("#insert").submit(function( event ) {
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
            alert($("#title").val()+" 상품, "+$("#quan").val()+"개가 등록되었습니다!!!");
            return;
        }
});
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
			url : '/made/partUpload', // servlet url
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
	<script type="text/javascript" src="../user/project(sk).js"></script>
</body>
</html>