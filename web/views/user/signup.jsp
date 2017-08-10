<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Sign Up - MAːDÆ</title>
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
 	#content {
 		background-color:#F6F6F6;
 		height:100%;
 	}

 	#userid{
 		border: none;
 		height: 100%;
 		width: 200px;
 	}
 	#userpwd {
 		border: none;
 		height: 100%;
 		width: 200px;
 	}
 	#userpwd2{
 		border: none;
 		height: 100%;
 		width: 200px;
 	}
 	
 	input[type="text"] {
 		border: none;
 		height: 100%;
 		width: 100%;
 	}
 	td{
 		border: none;
 		
 		height: 60px;
 		padding: 5px; 
 	}
 	#member-form{
 		position:relative;
		left: -130px;
 		width : 500px;
 		background-color:white;
 		border:1px solid #D5D5D5;		
 	}
 	#member-form tr td{
 		
 	}
	#designer-btn{
		font-weight:bold;
		font-size:large;
		border:1px solid #6799FF;
		background-color:white;
		color:#6799FF;
	}
	#designer-btn:hover{
		background-color:#6799FF;
		color:white;
	}
	#member-btn{
		font-weight:bold;
		font-size:large;
		border:1px solid #6799FF;
		background-color:white;
		color:#6799FF;
	}
	#member-btn:hover{
		background-color:#6799FF;
		color:white;
	}
	.center-form{
		width:150px; height:50px; position:relative;
		
	}
	.button{
		align:center;
	}
	#content-form{
	display:none;
	}
	#content-form2{
	}
	#birth-form select{
		font-size:13pt;
	}
	
 	
 </style>
 <script type="text/javascript">
 

 
	function memberDisplay(){
		$('#classCode').val('C');
		$('#img-title').text('회원 대표 이미지');
	   if($('#content-form').css('display')=='none'){
		   $('#content-form').css('display','block');
	    }else{
	    	$('#content-form').css('display','none');
	    }

 
	}
	

	function designerDisplay(){	
		$('#classCode').val('D');
		$('#img-title').text('디자이너 대표 이미지');
		
		if($('#content-form').css('display')=='none'){
			   $('#content-form').css('display','block');
		    }else{
		    	$('#content-form').css('display','none');
		    }
	}
	//윤달계산한 생년월일
	
Now = new Date();
NowDay = Now.getDate();
NowMonth = Now.getMonth();
NowYear = Now.getYear();
if (NowYear < 2000) NowYear += 1850; 
function DaysInMonth(WhichMonth, WhichYear)
{
  var DaysInMonth = 31;
  if (WhichMonth == "4" || WhichMonth == "6" || WhichMonth == "9" || WhichMonth == "11") DaysInMonth = 30;
  if (WhichMonth == "2" && (WhichYear/4) != Math.floor(WhichYear/4))        DaysInMonth = 28;
  if (WhichMonth == "2" && (WhichYear/4) == Math.floor(WhichYear/4))        DaysInMonth = 29;
  return DaysInMonth;
}

function ChangeOptionDays(Which)
{
  DaysObject = eval("document.Form1." + Which + "Day");
  MonthObject = eval("document.Form1." + Which + "Month");
  YearObject = eval("document.Form1." + Which + "Year");

  Month = MonthObject[MonthObject.selectedIndex].text;
  Year = YearObject[YearObject.selectedIndex].text;

  DaysForThisSelection = DaysInMonth(Month, Year);
  CurrentDaysInSelection = DaysObject.length;
  if (CurrentDaysInSelection > DaysForThisSelection)
  {
    for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
    {
      DaysObject.options[DaysObject.options.length - 1] = null
    }
  }
  if (DaysForThisSelection > CurrentDaysInSelection)
  {
    for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
    {
      NewOption = new Option(DaysObject.options.length + 1);
      DaysObject.add(NewOption);
    }
  }
    if (DaysObject.selectedIndex < 0) DaysObject.selectedIndex == 0;
}

function SetToToday(Which)
{
  DaysObject = eval("document.Form1." + Which + "Day");
  MonthObject = eval("document.Form1." + Which + "Month");
  YearObject = eval("document.Form1." + Which + "Year");

  YearObject[0].selected = true;
  MonthObject[NowMonth].selected = true;

  ChangeOptionDays(Which);

  DaysObject[NowDay-1].selected = true;
}

function WriteYearOptions(YearsAhead)
{
  line = "";
  for (i=0; i<YearsAhead; i++)
  {
    line += "<OPTION>";
    line += NowYear + i;
  }
  return line;
}
	

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}	

function email_change(){
	if(document.Form1.email.options[document.Form1.email.selectedIndex].value == '0'){
	 document.Form1.email2.disabled = true;
	 document.Form1.email2.value = "";
	}
	if(document.Form1.email.options[document.Form1.email.selectedIndex].value == '9'){
	 document.Form1.email2.disabled = false;
	 document.Form1.email2.value = "";
	 document.Form1.email2.focus();
	} else{
	 document.Form1.email2.disabled = true;
	 document.Form1.email2.value = document.Form1.email.options[document.Form1.email.selectedIndex].value;
	}
	}

var xhr;
function createXhr(){
    if(window.ActiveXObject){   // IE 이전버전
        xhr = new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        xhr = new XMLHttpRequest();
    }
}
 
function idcheck(){
    var id = document.getElementById("userid").value;
    var queryString = "command=idcheck&id="+id;
    console.log(queryString);
    if(id.length<6){
        document.getElementById("idcheckLayer").innerHTML = "<font color=red>6자리 이상 입력하세요.</font>";    
    }else{
        // 1. XMLHttpReqeust 객체 생성
        createXhr();
        // 2. 이벤트 핸들러 등록
        xhr.onreadystatechange = callback;  // callback 함수를 등록
        // 3. open()를 통해 요청관련 설정을 설정
        xhr.open("POST", "/made/icheck", true);
        // 4. Header에 contentType 지정 - post
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        // 5. send()를 통해 요청
        xhr.send(queryString);  // 요청 쿼리를 보내준다.
    }
}
function callback(){
    if(xhr.readyState==4){      // 응답을 다 받은 경우
        if(xhr.status == 200){  // 응답코드가 200인 경우 - 정상인 경우
            var resTxt = xhr.responseText;  // 서버가 보낸 응답 text
            //alert(resTxt);
            document.getElementById("idcheckLayer").innerHTML = resTxt;        
        }else{
            alert("요청 처리가 정상적으로 되지 않았습니다.\n"+xhr.status);
        }
    }
}


var reg_upw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;//6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용
var s_default = {"border":"1px solid #ccc", "background-color":"#fff"}; //기본
var s_fail = {"font-size":"8pt", "color":"red","text-align":"center"}; //실패
var s_success = {"font-size":"8pt", "color":"green","text-align":"center"}; //성공
function passcheck(){
	

	if( reg_upw.test( $('#userpwd').val())){
		$('#passcheckLayer').text("안전한 비밀번호입니다.").css(s_success);
	}else{
		$('#passcheckLayer').text("6~16자 영문대소문자, 숫자, 특수문자 혼합하여 사용하세요").css(s_fail);
	}

}

function passcheck2(){

	if( $('#userpwd').val() != $('#userpwd2').val()){
		$('#passcheckLayer2').text("비밀번호가 일치하지 않습니다.").css(s_fail);;
	}else{
		$('#passcheckLayer2').text("비밀번호 확인").css(s_success);;
	}

}
	


function nickcheck(){
	var reg_nickname = /^[0-9a-zA-Z가-힣]{4,20}$/; //한글10자, 영문20자, 한글,영문,숫자 사용가능
}



</script>

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
						<h2>게시글 제목</h2>
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
        <div class="container" id="content">
        
         <div class="row">
  <div class="col-xs-6 col-md-4"></div>
 
  	
  	
	
	 <div class="col-xs-6 col-md-4" id="center-form">
	 <table id="button"><!-- 가입회원구분  -->
  	<tr>
  		<td>
  			<a href="javascript:memberDisplay();"><button class="btn btn-primary btn-block" type="button" id="member-btn"> 
  			<i class="fa fa-bookmark"></i>일반회원</button></a> 
  		</td>
		<td>
			<a href="javascript:designerDisplay();"><button class="btn btn-primary btn-block" type="button" id="designer-btn">
			 <i class="fa fa-bookmark"></i>디자이너</button></a> 
		</td>
	</tr>
	</table>
	<br>
	
	<div id="content-form">
	<FORM name="Form1" action="/made/minsert" method="post" enctype="multipart/form-data">
	<input type="hidden" name="classCode" id="classCode" value="C">
<table id="member-form" class="table table-striped">
 <tr><td colspan="4" align="center"><span id="img-title">회원 대표 이미지</span><br>
 <!-- 이미지 미리보기 이벤트 발생 -->
	<img id="img_preview" class="img-circle"><br>

	<input type="file" id="input_file" name="img"></td></tr>

 <tr><td colspan=2 align="left"><input type="text" placeholder="닉네임" name="nickname" id="nickname" ></td>
 <td colspan="2"><span></span></td></tr>
 <tr><td colspan=2 align="left"><input type="text" placeholder="아이디" name="userid" id="userid" onkeyup="idcheck()"></td>
 <td colspan="2"><span id = "idcheckLayer"></span></td></tr>
 <tr><td colspan=2><input type="password" placeholder="비밀번호" id="userpwd" name="userpwd" onkeyup="passcheck()"></td>
 <td colspan=2><span id="passcheckLayer"></span></td></tr>
 <tr><td colspan=2><input type="password" placeholder="비밀번호확인" id="userpwd2" name="userpwd2" onkeyup="passcheck2()"></td>
 <td colspan=2><span id="passcheckLayer2"></span></td></tr>
   
 </table>

 <br>
 <br>

 
 <table id="member-form" class="table">
 <tr><td colspan=2><input type="text" placeholder="이름" name="name"></td><td colspan=2></td></tr>
 <tr>
 <td>생년월일<br></td>
	 <td colspan=3>

<SELECT name="FirstSelectYear" onchange="ChangeOptionDays('FirstSelect')">
       <script type="text/javascript">
                document.write(WriteYearOptions(50));
        </script>
</SELECT>

<SELECT name="FirstSelectMonth" onchange="ChangeOptionDays('FirstSelect')">
<!------ 필요하면 아래 월 표시를 한글로 바꾸어 주세요 ------->
        <OPTION>1
        <OPTION>2
        <OPTION>3
        <OPTION>4
        <OPTION>5
        <OPTION>6
        <OPTION>7
        <OPTION>8
        <OPTION>9
        <OPTION>10
        <OPTION>11
        <OPTION>12
</SELECT>
<SELECT name="FirstSelectDay">
        <OPTION>1
        <OPTION>2
        <OPTION>3
        <OPTION>4
        <OPTION>5
        <OPTION>6
        <OPTION>7
        <OPTION>8
        <OPTION>9
        <OPTION>10
        <OPTION>11
        <OPTION>12
        <OPTION>13
        <OPTION>14
        <OPTION>15
        <OPTION>16
        <OPTION>17
        <OPTION>18
        <OPTION>19
        <OPTION>20
        <OPTION>21
        <OPTION>22
        <OPTION>23
        <OPTION>24
        <OPTION>25
        <OPTION>26
        <OPTION>27
        <OPTION>28
        <OPTION>29
        <OPTION>30
        <OPTION>31
</SELECT>

	 </td>
	 
	
	 </tr>
	 <tr><td>성별</td><td><input type="radio" name="gender" value="남">남</td>
	 <td><input type="radio" name="gender" value="여">여</td><td></td></tr>
 <tr><td>	<select name="phone1" selected>
 			<option value="010">010
			<option value="011">011
			<option value="016">016
			<option value="017">017
			<option value="018">018
		</select>
 		</td><td><input type="text" name="phone2"></td><td><input type="text"  name="phone3"></td></tr>
 <tr>
 <td><input type="text" name="email1" value="이메일" onfocus="this.value='';" style="width:100px"></td>
 <td>&nbsp;@&nbsp;</td>
 <td><input type="text" name="email2" value="" style="width:120px" disabled ></td>
 <td>
<select name="email" onchange="email_change()">
    <option value="0" >선택하세요</option>
    <option value="9">직접입력</option>
    <option value="naver.com">naver.com</option>
    <option value="nate.com">nate.com</option>
    <option value="hanmail.net">hanmail.net</option>
     <option value="hotmail.com">hotmail.com</option>
     <option value="nate.com">nate.com</option>
     <option value="yahoo.co.kr">yahoo.co.kr</option>
     <option value="gmail.com">gmail.com</option>
   </select>
</td>
</tr>
		




 <tr>
 <td colspan="2"><input type="text" id="sample4_postcode" placeholder="우편번호" name="post_num"></td>
 <td colspan="2"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></td>
</tr>

<tr>
<td colspan="4"><input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address1"></td>
</tr>
<tr>
<td colspan="4"><input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address2"><span id="guide" style="color:#999"></span></td>


 
</tr>
    
 </table>
 <div align="center">
 	<input type="submit" class="btn btn-primary btn-lg" id="btn-join" value="가입하기" >
 	</div>
 	</FORM>
  </div>
  
  

<!-- 디자이너 가입폼 -->
 
 <!-- <div id="content-form2">
<FORM name="Form2" action="/made/deinsert" method="post" enctype="multipart/form-data">
	<input type="hidden" name="classCode2" value="D">
<table id="member-form" class="table">
 
 <tr><td colspan="4" align="center">디자이너 대표 이미지<br>
 
	<img id="img_preview2" class="img-circle"><br>

	<input type="file" id="input_file2" name="img2"></td></tr>

 <tr><td colspan=2 align="left"><input type="text" placeholder="닉네임" name="nickname2" id="nickname2"></td>
 <td colspan="2"></td></tr>
 <tr><td colspan=2 align="left"><input type="text" placeholder="아이디" name="userid2" id="userid2" onkeyup="idcheck2()"></td>
 <td colspan="2"><span id="idcheckLayer2"></span></td></tr>
 <tr><td colspan=2><input type="password" placeholder="비밀번호" name="userpwd2"></td><td colspan=2>비밀번호는 문자+숫자8자리</td></tr>
 <tr><td colspan=2><input type="password" placeholder="비밀번호확인" name="userpwd22"></td><td colspan=2>비밀번호 확인</td></tr>
   
 </table>

 <br>
 <br>

 
 <table id="member-form" class="table">
 <tr><td colspan=2><input type="text" placeholder="이름" name="name2"></td><td colspan=2>이름에 숫자나 특수문자는 사용하실수 없습니다.</td></tr>
 <tr>
 <td>생년월일<br></td>
	 <td colspan=3>

<SELECT name="FirstSelectYear2" onchange="ChangeOptionDays2('FirstSelect')">
        <SCRIPT type="text/javascript">
                document.write(WriteYearOptions(50));
        </SCRIPT>
</SELECT>

<SELECT name="FirstSelectMonth2" onchange="ChangeOptionDays2('FirstSelect')">
---- 필요하면 아래 월 표시를 한글로 바꾸어 주세요 -----
        <OPTION>1
        <OPTION>2
        <OPTION>3
        <OPTION>4
        <OPTION>5
        <OPTION>6
        <OPTION>7
        <OPTION>8
        <OPTION>9
        <OPTION>10
        <OPTION>11
        <OPTION>12
</SELECT>
<SELECT name="FirstSelectDay2">
        <OPTION>1
        <OPTION>2
        <OPTION>3
        <OPTION>4
        <OPTION>5
        <OPTION>6
        <OPTION>7
        <OPTION>8
        <OPTION>9
        <OPTION>10
        <OPTION>11
        <OPTION>12
        <OPTION>13
        <OPTION>14
        <OPTION>15
        <OPTION>16
        <OPTION>17
        <OPTION>18
        <OPTION>19
        <OPTION>20
        <OPTION>21
        <OPTION>22
        <OPTION>23
        <OPTION>24
        <OPTION>25
        <OPTION>26
        <OPTION>27
        <OPTION>28
        <OPTION>29
        <OPTION>30
        <OPTION>31
</SELECT>
	 </td>
	 </tr>
	 <tr><td>성별</td><td><input type="radio" name="gender" value="남">남</td>
	 <td><input type="radio" name="gender" value="여">여</td><td></td></tr>
 <tr><td>	<select name="phone1">
 			<option value="010" selected>010
			<option value="011">011
			<option value="016">016
			<option value="017">017
			<option value="018">018
		</select>
 		</td><td><input type="text" name="phone2"></td><td><input type="text"  name="phone3"></td></tr>
 <tr>
 <td><input type="text" name="email1" value="이메일" onfocus="this.value='';" style="width:100px"></td>
 <td>&nbsp;@&nbsp;</td>
 <td><input type="text" name="email2" value="" style="width:120px" disabled ></td>
 <td>
<select name="email" onchange="email_change2()">
    <option value="0" >선택하세요</option>
    <option value="9">직접입력</option>
    <option value="naver.com">naver.com</option>
    <option value="nate.com">nate.com</option>
    <option value="hanmail.net">hanmail.net</option>
     <option value="hotmail.com">hotmail.com</option>
     <option value="nate.com">nate.com</option>
     <option value="yahoo.co.kr">yahoo.co.kr</option>
     <option value="gmail.com">gmail.com</option>
   </select>
</td>
</tr>
		




 <tr>
 <td colspan="2"><input type="text" id="sample4_postcode2" placeholder="우편번호" name="post_num"></td>
 <td colspan="2"><input type="button" onclick="sample4_execDaumPostcode2()" value="우편번호 찾기"><br></td>
</tr>

<tr>
<td colspan="4"><input type="text" id="sample4_roadAddress2" placeholder="도로명주소" name="address1"></td>
</tr>
<tr>
<td colspan="4"><input type="text" id="sample4_jibunAddress2" placeholder="지번주소" name="address2"><span id="guide" style="color:#999"></span></td>


 
</tr>
 </table>
 <div align="center">
  <input type="submit" class="btn btn-primary btn-lg" id="btn-join" value="가입하기" >
  </div>
</FORM>
 
  </div> -->


</div>
  <div class="col-xs-6 col-md-4"></div>
</div>
 
 <div>
 
</div>
</div>
    </section>
	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	
	<!--end footer-->
<script>

</script>
</body>
</html>