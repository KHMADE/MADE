<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="receipt.model.vo.*, java.sql.Date"%>
<%
	Receipt receipt = (Receipt) request.getAttribute("receipt");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영수증</title>
<style type="text/css">
	*:not(table):not(div):not(tr):not(td):not(button):not(h4) {
		margin: 0px; 
		padding: 0px;
	}
	p {
		font-size: 10pt;
	}
	h4 {
		margin:10px 0px 5px 0px;
	}
	table tr td {
		border-top: 1px solid #4C4C4C;
		border-bottom: 1px solid #4C4C4C;
	}
	table {
		margin: auto;
		width: 90%;
		border-collapse: collapse;
	}
	td:first {
		background: gray;
	}
	.c_top {
		background-color: #E74C3C;
		padding:5px;
		color: white;
	}
	.c_contents {
		margin: 15px;
		width: 600px;
	}
	.c_center {
		text-align: center;
	}
</style>
</head>
<body>
	
	<div class="c_top">
		<h3>결제 영수증</h3>
	</div>
	
	<div class="c_contents">	
		<p>1. 결제영수증은 소득공제용 영수증 및 매입 세금계산서로 활용할 수 없으며,</p>
		<p>   결제가 완료되었음을 증명하는 용도로만 활용가능합니다.</p>
		<p>   결제영수증은 세무상의 지출증빙 효력이 없습니다.</p>
		<p>2. 결제영수증은 선결제 배송비를 포함하여 실제 결제액에 대하여 발급됩니다.</p>
		<p>3. 전세계배송 주문의 경우 예상해외배송비까지 추가된 금액입니다. </p>
		<p>   단, 추가해외배송비는 '나의11번가 > 증빙서류 발급 > 배송비 탭' 에서 확인하실 수 있습니다.</p>
		
		<h4>주문정보</h4>
		<table>
			<tr><td style="background-color:#ccc;">주문일</td><td><%= receipt.getOrderDate() %></td><td style="background-color:#ccc;">주문번호</td><td><%= receipt.getOrderCode() %></td></tr>
			<tr><td style="background-color:#ccc;">주문인</td><td colspan="3"><%= receipt.getMemberName() %></td></tr>
		</table>
		
		<h4>구매상품</h4>
		<table>
			<tr><td style="background-color:#ccc;">상품/옵션정보</td><td style="background-color:#ccc;">수량</td><td style="background-color:#ccc;">결제금액</td></tr>
			<tr><td><%= receipt.getTitle() %></td><td><%= receipt.getOrderCount() %></td><td><%= receipt.getPrice() %></td></tr>
		</table>
		<br>
		<div style="background:#EAEAEA;">
			<div>
				<img alt="" src="/made/images/logo.png" style="margin:15px; width:163x; height:50px;">
			</div>
			<div>
				<p>상호명 : MADE</p>
				<p>사업자등록번호 : 000-00-00000</p>
				<p>소재지 : 서울특별시 강남구 역삼1동</p>
				<p>대표자 : 유○○</p>
			</div>
		</div>
		<p style="color:#E74C3C;">정상적으로 출력되지 않는다면 도구 인터넷옵션 고급탭에서 인쇄메뉴 중 '배경색 및 이미지 인쇄'를 체크하시기 바랍니다.</p>
		<br>
		<div class="c_center" style="clear:left; display:block">
			<button type="button" onclick="javascript:print();">인쇄하기</button>&nbsp;&nbsp;&nbsp;<button type="button" onclick="javascript:window.close();">닫기</button>
		</div>
		
	</div>
</body>
</html>