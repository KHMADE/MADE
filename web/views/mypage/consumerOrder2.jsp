<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*"%>
<%
	Member m = (Member) session.getAttribute("member");
	String loginout;
	if (m == null) {
		loginout = "<a href='../../loginout.jsp'>&nbsp;Login&nbsp;</a>";
	} else {
		loginout = "&nbsp;<b>"+m.getNickName()+"</b>님 환영합니다!&nbsp;&nbsp;<a href='/made/logout'>&nbsp;Logout&nbsp;</a>";
	}
%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="ko"> <!--<![endif]-->
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
</head>
<body>

	<!--start wrapper-->
	<section class="wrapper">
       <section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h2>주문/배송 조회</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<!-- ■ ■ ■ ■ ■ 수정하기 ■ ■ ■ ■ ■ -->
								<li><a href="../../index.jsp">Home</a></li>
								<li><a href="default_page.html">Shortcodes</a></li>
								<li>Typography</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        <div class="container">
        
        <!--- 여기에 내용을 작성해주세요~ --->
       
        <div class="container" style="border:1px dashed blue;">

        		<div class="panel panel-default">
					<!-- ■ ■ ■ ■ ■ 자리 옮기기 ■ ■ ■ ■ ■ -->
					<style>
						table * {
							text-align : center;
						}
						button {
							border : none;
							padding-top : 2px;
							padding-bottom : 2px;
							margin : 2px;
							background : gray;
							/* #e74c3c */
							color : white;
						}
						button:hover {
							background : #e74c3c;
						}
						table span {
							font-weight: bold;
						}

						.c_product {
							border:1px dashed blue;
							height : 100px;
						}
						.c_product_description {
							border:1px dashed red;
							clear : both; 
							display: table-cell;
  							vertical-align: middle;
						}
						img {
							float : left;
							width: 100px;
							height: 100%;
						}
					</style>
				
					<table class=table>
				  		<thead>
				  			<tr><th>주문일자/주문번호</th><th>상품정보</th><th>금액/수량</th><th>주문상태</th><th>관리</th></tr>
				  		</thead>
				  		<tbody>
					  		<tr><td scope=row>2017-07-01<br>(221053968031)<br><button>영수증출력</button></td><td><div class="c_product"><img alt="상품이미지" src="#"><div class="c_product_description"><a href="#">[삼성]상품 이름 01<br>100*200*300(mm)</a></div></div></td><td>50,000<br>(1개)</td><td><span>구매확정</span><br><button>상품리뷰</button><br>한진택배<br>121053968031<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-02<br>(221053968032)<br><button>영수증출력</button></td><td>■</td><td>51,000<br>(2개)</td><td><span>배송중</span><br>한진택배<br>121053968032<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-03<br>(221053968033)<br><button>영수증출력</button></td><td>■</td><td>52,000<br>(3개)</td><td><span>배송중</span><br>한진택배<br>121053968033<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-04<br>(221053968034)<br><button>영수증출력</button></td><td>■</td><td>53,000<br>(4개)</td><td><span>배송중</span><br>한진택배<br>121053968034<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-05<br>(221053968035)<br><button>영수증출력</button></td><td>■</td><td>54,000<br>(5개)</td><td><span>배송중</span><br>한진택배<br>121053968035<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-06<br>(221053968036)<br><button>영수증출력</button></td><td>■</td><td>55,000<br>(6개)</td><td><span>배송중</span><br>한진택배<br>121053968036<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-07<br>(221053968037)<br><button>영수증출력</button></td><td>■</td><td>56,000<br>(7개)</td><td><span>배송중</span><br>한진택배<br>121053968037<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-08<br>(221053968038)<br><button>영수증출력</button></td><td>■</td><td>57,000<br>(8개)</td><td><span>배송중</span><br>한진택배<br>121053968038<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-09<br>(221053968039)<br><button>영수증출력</button></td><td>■</td><td>58,000<br>(9개)</td><td><span>배송중</span><br>한진택배<br>121053968039<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
						  	<tr><td scope=row>2017-07-10<br>(221053968040)<br><button>영수증출력</button></td><td>■</td><td>59,000<br>(10개)</td><td><span>배송중</span><br>한진택배<br>121053968030<br><button>배송추적</button></td><td><button>반품요청</button><br><button>교환요청</button></td></tr>
					  	</tbody>
					</table>
				</div>

				<nav aria-label="Page navigation" style="text-align:center;">
				  <ul class="pagination pagination-sm">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="active"><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li><a href="#">6</a></li>
				    <li><a href="#">7</a></li>
				    <li><a href="#">8</a></li>
				    <li><a href="#">9</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>

        	</div>
        </div>
        
    </section>
	
</body>
</html>