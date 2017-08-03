<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Dafault_page - MAːDÆ</title>
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
    	#profile-img-form {
    		height : 500px;
    		border-right:1px solid grey;
    		border-left:1px solid grey;
    	}
    	#member-left-title {
    		text-align: center;
    	}
    	#member-change-table {
  
    		margin-left: 75px;
	    	width: 800px;
	    	height: 100px;
	    	
	    }

    	#profile-info-form {
    		
    	}
    
    </style>
    <link href="/made/css/project2.css" rel="stylesheet">
   


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
						<h2>회원정보 수정</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li><a href="default_page.html">Shortcodes</a></li>
								<li>Typography</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        <div class="container">
     
		<div class="row">
	  
			  <div class="col-md-9 col-md-push-3" id="profile-info-form">
			  <p>개인정보 수정</p>
				<form class="form-horizontal">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">아이디</label>
				    <div class="col-sm-10">
				      <p class="form-control-static">회원아이디@example.com</p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword" class="col-sm-2 control-label">변경할 비밀번호</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" id="inputPassword" placeholder="Password">
				      
				    </div>
				     <table id="member-change-table">
		  	
		  		<tr colspan="2">
		  	
		  		<td><div class="col-sm-20"><label class="col-sm-15 control-label">생년월일&nbsp; &nbsp;</label></div></td>
		  		<td colspan="2">
		  		<input type="hidden" name="memBirth">
		  		<select class="form-control" id="year" style="width:100px;">
		  		<option>선택</option>
		  		
		  		</select>
		  		</td> 
		  		<td>
		  		<select class="form-control" id="month" style="width:70px;">
		  		<option>선택</option>
		  		
		  		</select>
		  		</td> 
		  		<td>
		  		<select class="form-control" id="day" style="width:70px;">
		  		<option>선택</option>
		  		
		  		</select>
		  		</td>
		  		
		  		</tr>
		  		<tr>
		  
		  		<td>휴대폰번호 </td> <td></td> <td>갓 </td> <td>뎀 </td> <td>뎀 </td>
		  		
		  		</tr>
		  		
		  	</table>
				  </div>
				  
				  
				</form>
			 
		  	</div>
			  <div class="col-md-3 col-md-pull-9" id="profile-img-form">
			  <h3 id="member-left-title">프로필이미지 변경</h3>
			  	<img id="img_preview" style="display:none;"><br>

				<input type="file" id="input_file" >
			  
		  	</div>
			</div>
		  	
		  </div>

    </section>

	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->

</body>
</html>