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

 	input[type="text"] {
 		border: none;
 		height: 100%;
 		width: 100%;
 	}
 	input[type="password"] {
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
		display:none;
	}
	#birth-form select{
		font-size:13pt;
	}
 	
 </style>
 <script type="text/javascript">
	var bDisplay = true;
	function memberDisplay(){
    var con = document.getElementById("content-form");
    var con2 = document.getElementById("content-form2");
    
    if(con.style.display=='none'){
        con.style.display='block';
        con2.style.display='none';
        
       
    }else{
        con.style.display='none';
     
    	}
   
	}
	
	var bDisplay = true;
	function designerDisplay(){
    var con2 = document.getElementById("content-form2");
    var con = document.getElementById("content-form");
    if(con2.style.display=='none'){
        con2.style.display='block';
       	con.style.display='none';
    }else{
        con2.style.display='none';
     
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
  if (WhichMonth == "2" && (WhichYear/4) != Math.floor(WhichYear/4)) DaysInMonth = 28;
  if (WhichMonth == "2" && (WhichYear/4) == Math.floor(WhichYear/4)) DaysInMonth = 29;
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
						<h2>회원가입 창</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="/made/index.jsp">Home</a></li>
								<li>SignUp</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        <div class="container" id="content">
        
         <div class="row">
  <div class="col-xs-6 col-md-4">왼쪽 여백</div>
 
  	
  	
	
	 <div class="col-xs-6 col-md-4" id="center-form">
	 <table id="button"><!-- 가입회원구분  -->
  	<tr>
  		<td>
  			<a href="javascript:memberDisplay();"><button class="btn btn-primary btn-block" type="button" id="member-btn"> <i class="fa fa-bookmark"></i>일반회원</button></a> 
  		</td>
		<td>
			<a href="javascript:designerDisplay();"><button class="btn btn-primary btn-block" type="button" id="designer-btn"> <i class="fa fa-bookmark"></i>디자이너</button></a> 
		</td>
	</tr>
	</table>
	<br>
	<div id="content-form">
<table id="member-form" class="table table-striped">
 <tr><td colspan="4" align="center">회원 대표 이미지<br>
 
	<img id="img_preview" class="img-circle"><br>

	<input type="file" id="input_file" ></td></tr>
	
 <tr><td colspan=2 align="left"><input type="text" placeholder="아이디"></td><td colspan="2" align="right"><input type="button" value="중복체크">아이디는 영문+숫자만 입력해주세요.</td></tr>
 <tr><td colspan=2><input type="password" placeholder="비밀번호"></td><td colspan=2>비밀번호는 문자+숫자8자리</td></tr>
 <tr><td colspan=2><input type="text" placeholder="비밀번호확인"></td><td colspan=2>비밀번호 확인</td></tr>
   
 </table>

 <br>
 <br>

 
 <table id="member-form" class="table">
 <tr><td colspan=2><input type="text" placeholder="이름"></td><td colspan=2>이름에 숫자나 특수문자는 사용하실수 없습니다.</td></tr>
 <tr>
 <td>생년월일<br></td>
	 <td colspan=3>
<FORM name="Form1">
<SELECT name="FirstSelectYear" onchange="ChangeOptionDays('FirstSelect')">
        <SCRIPT language="JavaScript">
                document.write(WriteYearOptions(50));
        </SCRIPT>
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
</FORM>

	 </td>
	 
	
	 </tr>
	 <tr><td>성별</td><td><input type="radio" name="gender">남</td><td><input type="radio" name="gender">여</td><td></td></tr>
 <tr><td>	<select name="phone" selected>
 			<option value="010">010
			<option value="011">011
			<option value="016">016
			<option value="017">017
			<option value="018">018
		</select>
 		</td><td colspan="2"><input type="text" placeholder="'-'을 빼고 입력"></td><td></td></tr>
 <tr><td colspan=2><input type="text" placeholder="이메일"></td><td><input type="text"></td><td><select name="email" selected>
 			<option value="naver">naver.com
			<option value="gmail">gmail.com
			<option value="hanmail">hanmail.net
			<option value="daum">daum.net
			<option value="nate">nate.com
			<option value="self">직접입력
			
		</select></td></tr>
		




 <tr>
 <td colspan="2"><input type="text" id="sample4_postcode" placeholder="우편번호"></td>
 <td colspan="2"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></td>
</tr>

<tr>
<td colspan="4"><input type="text" id="sample4_roadAddress" placeholder="도로명주소"></td>
</tr>
<tr>
<td colspan="4"><input type="text" id="sample4_jibunAddress" placeholder="지번주소"><span id="guide" style="color:#999"></span></td>


 
</tr>
    
 </table>
  </div>
 
 <div id="content-form2">
<table id="member-form" class="table">
 <tr><td colspan="4">디자이너 대표 이미지<br>
 
	<img id="img_preview2" class="img-circle"><br>

	<input type="file" id="input_file2" ></td></tr>
	
 <tr><td colspan=2><input type="text" placeholder="아이디"></td><td>아이디는 영문+숫자만 입력해주세요.</td><td><input type="button" value="중복체크"></td></tr>
 <tr><td colspan=2><input type="text" placeholder="비밀번호"></td><td colspan=2>비밀번호는 문자+숫자8자리</td></tr>
 <tr><td colspan=2><input type="text" placeholder="비밀번호확인"></td><td colspan=2>비밀번호 확인</td></tr>
   
 </table>
 
 <table id="member-form" class="table">
 <tr><td colspan=2><input type="text" placeholder="이름"></td><td colspan=2>이름에 숫자나 특수문자는 사용하실수 없습니다.</td></tr>
 <tr><td><input type="text" placeholder="생년"></td><td><input type="text" placeholder="월"></td><td><input type="text" placeholder="일"></td><td></td></tr>
 <tr><td>성별</td><td><input type="radio" name="gender">남</td><td><input type="radio" name="gender">여</td><td></td></tr>
 <tr><td>	<select name="phone" selected>
 			<option value="010">010
			<option value="011">011
			<option value="016">016
			<option value="017">017
			<option value="018">018
		</select>
 		</td><td colspan="2"><input type="text" placeholder="'-'을 빼고 입력"></td><td></td></tr>
 <tr><td colspan=2><input type="text" placeholder="이메일"></td><td><input type="text"></td><td><select name="email" selected>
 			<option value="naver">naver.com
			<option value="gmail">gmail.com
			<option value="hanmail">hanmail.net
			<option value="daum">daum.net
			<option value="nate">nate.com
			<option value="self">직접입력
			
		</select></td></tr>
 <tr><td colspan="3"><input type="text" placeholder="주소입력"></td><td><input type="button" value="주소찾기"></td></tr>
    
 </table>
   <div align="center">
 	<button type="button" class="btn btn-primary btn-lg">가입하기</button>
 	</div>

 
  </div>


</div>
  <div class="col-xs-6 col-md-4">오른쪽 여백</div>
</div>
 
 <div>
 
</div>
</div>
    </section>

	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
<script src="project(sk).js"></script>
</body>
</html>