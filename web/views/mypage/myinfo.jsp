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
    		border-right:2px solid grey;
    		
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
    	
    		align:center;
    	}

    	#inputPassword{
    		witdh:100px;
    	}
    
    </style>
    
    <script type="text/javascript">
    
    var reg_upw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;//6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용
    var s_default = {"border":"1px solid #ccc", "background-color":"#fff"}; //기본
    var s_fail = {"font-size":"8pt", "color":"red","text-align":"center"}; //실패
    var s_success = {"font-size":"8pt", "color":"green","text-align":"center"}; //성공
    function passcheck(){
    	

    	if( reg_upw.test( $('#inputPassword').val())){
    		$('#passcheckLayer').text("안전한 비밀번호입니다.").css(s_success);
    	}else{
    		$('#passcheckLayer').text("6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용하세요").css(s_fail);
    	}

    }
    
    function passcheck2(){

    	if( $('#inputPassword').val() != $('#inputPassword2').val()){
    		$('#passcheckLayer2').text("비밀번호가 일치하지 않습니다.").css(s_fail);;
    	}else{
    		$('#passcheckLayer2').text("비밀번호 확인").css(s_success);;
    	}

    }
    </script>
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
     
		<div class="row" id="row">
	  		<div id="profile-info-form">
			  	<div class="col-md-9 col-md-push-3">
				<form class="form-horizontal" name="Form1" action="/made/mupdate" method="post" enctype="multipart/form-data">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">아이디</label>
				    <div class="col-sm-10">
				      <p class="form-control-static"><%= m.getId() %></p>
				    </div>
			 </div>
			<div class="form-group form-group-sm">
		    		<label class="col-sm-2 control-label " for="inputPassword">변경할 비밀번호</label>
		    		
		    	<div class="col-sm-10  col-xs-3">
		    	  	<input class="form-control" type="text" id="inputPassword" placeholder="변경할 비밀번호" onkeyup="passcheck()">
		    		 <span id="passcheckLayer"></span>	
		    	</div>	
			</div>
			
				<div class="form-group form-group-sm">
			    		<label class="col-sm-2 control-label" for="inputPassword2">비밀번호 확인</label>
			    		
			    	<div class="col-sm-10  col-xs-3">
			    	  	<input class="form-control" type="text" id="inputPassword2" placeholder="비밀번호 재입력" name="userpwd" onkeyup="passcheck2()">
			    		 <span id="passcheckLayer2"></span>	
			    	</div>	
				</div>
				    
				  
				 <table id="member-change-table">
		  	
		  		<tr colspan="2">
		  	
		  		<td><div class="col-sm-20"><label class="col-sm-15 control-label">휴대폰&nbsp; &nbsp;</label></div></td>
		  		<td colspan="2">
		  		<input type="hidden" name="">
		  		<select class="form-control" id="phone1" style="width:100px;" name="phone1">
		  		<option selected>010</option>
		  		<option>011</option>
		  		<option>017</option>
		  		<option>016</option>
		  		
		  		</select>
		  		</td> 
		  		<td margin="15px">
		  		<input type="text" value="<%= m.getPhone().substring(4,8) %>" class="col-xs-2 form-control " id="exampleInputName2" name="phone2" placeholder="번호입력">
		  		<td>
		  		<font size="15pt">&nbsp;&nbsp;</font>
		  		</td>
		  		</td> 
		  		<td margin="15px">
		  		<input type="text"  value="<%= m.getPhone().substring(9,13) %>" class="form-control col-xs-2" id="exampleInputName2" name="phone3" placeholder="번호입력">
		  		
		  		
		  		</td>
		  		
		  		</tr>
		  	</table>
		  		<div align="center">
		  		<input type="submit" class="btn btn-primary btn-lg" id="btn-join" value="수정하기"></button>
		  		</div>
				  </div>
				  
				  
			
			 
		  	</div>
			  <div class="col-md-3 col-md-pull-9" id="profile-img-form">
			  <h3 id="member-left-title">프로필이미지 변경</h3>
			  	<img id="img_preview" class="img-circle"; style="display:none;"><br>

				<input type="file" id="input_file" name="img" >
			  
		  	</div>
			</div>
		  	
		  </div>
					</form>
			 		
			 	

    </section>

	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
<script type="text/javascript">
	$('#btn-join').on('click', function(){
	 if($('#inputPassword').val()== ""|| $('#inputPassword2').val()== "" || $('#inputPassword').val() != $('#inputPassword2').val()){
			alert("변경할 비밀번호를 입력해주세요");
			return false;	
		}

	})
</script>
</body>
</html>