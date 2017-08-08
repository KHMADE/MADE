<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="part.model.vo.Part, member.model.vo.* , java.sql.*, java.util.ArrayList"%>
<%	
	Part p = (Part) request.getAttribute("part");
	int likechk = ((Integer)request.getAttribute("like")).intValue();
	ArrayList<ItemReview> reviewList = (ArrayList<ItemReview>) request.getAttribute("review");
%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="ko">
<!--<![endif]-->

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title><%=p.getPartName()%> Detail - MAːDÆ</title>
<meta name="description" content="">
<link rel="shortcut icon" href="/made/images/icon.ico">
<!-- CSS FILES -->
<link rel="stylesheet" href="/made/css/bootstrap.min.css" />
<link rel="stylesheet" href="/made/css/style.css">
<link rel="stylesheet" type="text/css" href="/made/css/style.css"
	media="screen" data-name="skins">
<link rel="stylesheet" href="/made/css/layout/wide.css"
	data-name="layout">
<link rel="stylesheet" href="/made/css/fractionslider.css" />
<link rel="stylesheet" href="/made/css/style-fraction.css" />
<link rel="stylesheet" type="text/css" href="/made/css/switcher.css"
	media="screen" />
<style>
button.like {
	background: #fcabdd;
	color: black;
}

button.unlike {
	background: #efdee9;
	color: black;
}

button#like:hover {
	background: black;
	color: #fcabdd;
}
</style>
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

	<!--start wrapper-->
	<section class="wrapper">
		<section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
					<% if (m != null && m.getClassCode().equals("A")) { %>
						<h2>Item <%=p.getPartName()%>&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-default" onclick="location.href='/made/pupdateView?code=<%=p.getPartId()%>';">수정하기</button>&nbsp;&nbsp;&nbsp;
						<button class="btn btn-default" onclick="location.href='/made/pdelete?id=<%=p.getPartId()%>';">삭제하기</button></h2>
						<% } else { %>
						<h2>Item <%=p.getPartName()%></h2>
						<% } %>
					</div>
				</div>
			</div>
		</section>
		<section class="content portfolio_single">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-7 col-md-7 col-sm-7">
						<!--Project Details Page-->
						<div class="porDetCarousel">
							<div class="carousel-content">
								<img class="carousel-item active"
									style="width: 500px; height: 400px;"
									src="/made/images/items/parts/<%=p.getPartCategory().toLowerCase()+"/"+p.getPartImg()%>" alt="">
							</div>
						</div>
					</div>
					<div class="col-lg-5 col-md-5 col-sm-5">
						<div class="project_details">
							<div class="widget_title">
								<h4>
									<span>Item Purchase</span>
								</h4>
							</div>
							<ul class="details">
								<li><span>재질:</span><%=p.getPartCategory()%></li>
								<li><span>가격:</span><%=p.getPrice()%>원</li>
								<li><span>구매수량 :</span><input type="number" name="quan"
									min="1" max="99" value="1" id="quan"></li>
								<li><span>총 가격 :</span><input type="number" id="price" 
								name="price" size="8" lang="en" readonly>원</li>
							</ul>
							<br>
							<p align="center">
								<% if(m != null){ %>
								<% if(likechk != 0) { %>
								<button class="btn btn-default like" id="like">♥ 찜 취소</button>
								<% } else { %>
								<button class="btn btn-default unlike" id="like">♥ 찜하기</button>
								<% } %>
								&nbsp;&nbsp;
								<button class="btn btn-default" onclick="pay_test();">구매하기</button>
								<% } %>
							</p>
						</div>
					</div>
				</div>
				<div class="row sub_content">
					<div class="col-lg-12">
						<div class="dividerHeading">
							<h4>
								<span>Item Descriptions</span>
							</h4>
						</div>
						<ul class="nav nav-tabs" id="myTab">
							<li class="active"><a data-toggle="tab" href="#Popular">상품설명 &amp; 상품 설계</a></li>
							<li class=""><a data-toggle="tab" href="#Recent-Comment">Comment</a></li>
						</ul>
						<div class="tab-content clearfix" id="myTabContent">
							<div id="Popular" class="tab-pane fade active in">
								상품 설명
								<%=p.getPartDesc()%></div>
							<div id="Recent-Comment" class="tab-pane fade">
								<ul class="comments">
								<% if(reviewList.size() != 0) { %>
								<% for(ItemReview rv : reviewList) {%>
								<li class="comments_list clearfix">
									<input type="hidden" id="reviewCode" class="reviewCode" name="reviewCode" value="<%=rv.getReviewCode()%>">
									<a href="#" class="post-thumbnail">
									<img width="60" height="60" alt="#" src="/made/images/userimage/<%=rv.getMemberImg()%>"></a>
										<strong style="font-size:14pt;"><a href="#"><%=rv.getMemberId()%></a> <i style="font-size:10pt;">says: <%=rv.getReviewDate()%></i><br><br></strong>
											<div class="reviewContents" id="reviewContents" style="margin-top:-15px; padding-left: 71px; font-size:11pt; color:black;"><%=rv.getReviewContent()%></div>

										<% if( rv.getMemberId().equals(m.getId())){ %>
										<p align="right">
										<button type="button" class="btn btn-default btn-xs updateConfirm" name="updateConfirm" id="updateConfirm" style="display: none;">수정완료</button>
										&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs update" name="update" id="update">수정하기</button>
										&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default btn-xs delete" name="delete" id="delete">삭제하기</button></p></li>
								<% }}} else { %>
									<li class="comments_list clearfix"> <h3>현재 등록된 후기가 없습니다.</h3> </li>
								<% } %>
										<li>
										<div id="writeReview">
											<div class="dividerHeading">
                               				 <h4><span>후기 작성하기</span></h4>
                               				 </div>
                               <form action="/made/previewinsert" method="post">
                               	<input type="hidden" id="mid" name="mid" value="<%=m.getId()%>">
                               	<input type="hidden" id="pid" name="pid" value="<%=p.getPartId()%>">
								<textarea id="content" name="content" class="summernote"></textarea>
								<p align="center">
								<button type="submit" class="btn btn-default" id="reviewSubmit">등록하기</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="btn btn-default" id="reviewReset">취소하기</button></p>
								</form>
								<script>
								$(function(){
                                    $(".updateConfirm").on('click',function(){
                                        var parentP = $(this).parent();
                                        var parentLi = parentP.parent();
                                        var siblingP = parentLi.children('p:eq(0)');
                                        var reviewCode = parentLi.children('input').val();
                                        var updtContent = parentP.children(".updateContent").val();
                                        //console.log(updtContent);
                                        $.ajax({
                                            url : "/made/pupReview",
                                            type : "post",
                                            data: {
                                            	partCode : "<%=p.getPartId()%>",
                                            	mid : "<%=m.getId()%>",
                                                reviewCode : reviewCode,
                                                updtContent : updtContent
                                            },
                                            success : function(data) {
                                            	alert(data);
                                            }, error : function(request,status,error) {
                                               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                            }
                                        });
                                        
                                        parentLi.find(".reviewContents").html(updtContent);
                                        parentP.children(".updateContent").remove();
                                        parentP.children(".updateConfirm").toggle("fast");
                                        parentP.children('.update').text("수정하기");
									});
									$(".update").on('click',function(){
										var parentP = $(this).parent();
                                        var parentLi = parentP.parent();
                                        var siblingP = parentLi.children('p:eq(0)');
										var content = parentLi.children('.reviewContents').text();
										
										if($(this).text() == "수정하기"){
											parentP.append('<textarea style="margin-top:7px;" class="updateContent" name="updateContent" id="updateContent">'+content+'</textarea>');
											parentP.children(".updateConfirm").toggle("fast");
											$(this).text("수정취소");
											//alert("수정 합니다~");
										} else {
											parentP.children(".updateContent").remove();
											$(this).text("수정하기");
											parentP.children(".updateConfirm").toggle("fast");
											//alert("수정 취소합니다~");
										}
									});
									
									$(".delete").on('click',function(){
                                        var parentP = $(this).parent();
                                        var parentLi = parentP.parent();
										var reviewCode = parentLi.children('input').val();
                                        
										$.ajax({
                                            url : "/made/pDelReview",
                                            type : "post",
                                            data: {
                                            	partCode : "<%=p.getPartId()%>",
                                            	mid : "<%=m.getId()%>",
                                            	reviewCode : reviewCode
                                            },
                                            success : function(data) {
                                                alert(data);
                                                parentLi.remove();
                                            }, error : function(request,status,error) {
                                               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                            }
                                    });
                                });
                                    summernote();
                                    $('#reviewReset').submit(function(){
                                		$('.summernote').summernote('reset');
                                		summernote();
                                	});
                                    $('#reviewSubmit').on('submit',function(event){
                                    	if ($('#summernote').summernote('isEmpty')) {
                                      	  alert('후기 란이 비어 있습니다.');
                                      	  event.preventDefault();
                                      } else {
                                    	  return;
                                      }
                                	});
                                });
                                    
                                    function summernote(){
                                        $('.summernote').summernote({
									      width: '100%',	    
									      height: 100,          // 기본 높이값
									      minHeight: null,      // 최소 높이값(null은 제한 없음)
									      maxHeight: null,      // 최대 높이값(null은 제한 없음)
									      focus: true,          // 페이지가 열릴때 포커스를 지정함
									      lang: "ko-KR",         // 한국어 지정(기본값은 en-US)
									      placeholder: '여기에 후기를 작성해주세요~!!',
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
												url : '/made/partUploadImg', // servlet url
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
								};
								</script>
								</div>
										</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row sub_content">
					<div class="carousel-intro">
						<div class="col-md-12">
							<div class="dividerHeading">
								<h4>
									<span>Recently Parts Item</span>
								</h4>
							</div>
							<div class="carousel-navi">
								<div id="work-prev" class="arrow-left jcarousel-prev">
									<i class="fa fa-angle-left"></i>
								</div>
								<div id="work-next" class="arrow-right jcarousel-next">
									<i class="fa fa-angle-right"></i>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<div class="jcarousel recent-work-jc">
						<ul class="jcarousel-list">
						</ul>
					</div>
				</div>
			</div>
		</section>
	</section>
	<!--End wrapper-->
	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
	<script>
		var price = <%=p.getPrice()%>;
		var likechk = <%= likechk %>;
		$(function(){
			
			precent10();
		
			//Number("12345").toLocaleString('en');
			$("#price").val(price);
			$("#quan").on("change",function(){
				$("#price").val($("#quan").val()*price);
			});
			<%-- 
			$("#price").val(<%=p.getPrice()%>);
			
			$("#quan").on("change",function(){
				$("#price").val($("#quan").val()*price);
			}); --%>
			
			$("#like").on('click',function(){
				$.ajax({
					url : "/made/partLike",
					type : "post",
					data : {
						like : likechk,
						mid : "<%=m.getId()%>",
						pid : "<%=p.getPartId()%>"
					},
					success : function(data) {
						if(data != 0){
							likechk = data;
							$("#like").removeClass('unlike');
							$("#like").addClass('like');
							$("#like").text("♥ 찜 취소");
							alert("찜하기 되었습니다.");
						} else {
							likechk = data;
							$("#like").removeClass('like');
							$("#like").addClass('unlike');
							$("#like").text("♥ 찜 하기");
							alert("찜하기가 해제 되었습니다.");	
						}
					},
					error : function(request,status,error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
			
			function CaricaFoto(img){ 
				foto1= new Image(); 
				foto1.src=(img); 
				Controlla(img); 
			}; 
			function Controlla(img){ 
				if((foto1.width!=0)&&(foto1.height!=0)){ 
					viewFoto(img); 
				} else{ 
					funzione="Controlla('"+img+"')"; 
					intervallo=setTimeout(funzione,20); 
				} 
			}; 

			function viewFoto(img){ 
					largh=foto1.width+20; 
					altez=foto1.height+20; 
					stringa="width="+largh+",height="+altez; 
					finestra=window.open(img,"",stringa); 
			};
		});
		
		function precent10(){
			$.ajax({
				url : "/made/precentlist",
				type : "post",
				dataType : "json",
				success : function(data) {
					//console.log(data);
					var jsonStr = JSON.stringify(data); //객체를 문자열로 변환
					//console.log(jsonStr);
					var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈

					var values = $(".jcarousel-list").html();

					for ( var i in json.list) {
						//한글 깨짐을 막기 위해 문자 인코딩 처리한 json 객체의 값은 decodeURIComponent() 로 디코딩 처리함
						values += '<li class="col-sm-3 col-md-3 col-lg-3">'
							+' <div class="recent-item">'
							+' <figure> <div class="touching medium">'
							+' <img src="/made/images/items/parts/'+json.list[i].category+'/'+json.list[i].image+'" style="width:200px;height:170px;" alt="" />'
							+' </div> <div class="option">'
							+' <a href="javascript:CaricaFoto(\'/made/images/items/parts/'+json.list[i].category+'/'+json.list[i].image+'\')"'
							+' class="hover-zoom mfg-image trigger"> <i class="fa fa-search" ></i> </a>'
							<% if( m!= null) {%>
							+' <a href="pDetail?id='+json.list[i].partCode+'" class="hover-link"><i class="fa fa-link"></i></a>'
							<% } %>
							+' </div> <figcaption class="item-description">'
							+' <h5>'+json.list[i].category+'</h5>'
							+' <span>'+decodeURIComponent(json.list[i].title)+'</span>'
							+' </figcaption> </figure> </div> </li>'
						}
					$(".jcarousel-list").html(values);
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		};
	</script>
	<!-- I'm Port 전자결제 -->
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
	<script>
		var IMP = window.IMP; // 생략가능
		$(function() {
			IMP.init('imp99940489');
		}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// 문서 로딩될 때 바로 호출
		function pay_test() {
			IMP.request_pay({
				pg : 'kakao',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:<%=p.getPartName() %>',
				amount : Number($('#price').val()),
				buyer_email : '<%=m.getEmail()%>',
				buyer_name : '<%=m.getName()%>',
				buyer_tel : '<%=m.getPhone()%>',
				buyer_addr : '<%=addr[1]+" "+addr[2]%>',
				buyer_postcode : '<%=addr[0]%>',
			    kakaoOpenApp : true
			}, function(rsp) {
				if (rsp.success) {
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						url : "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
						type : 'POST',
						dataType : 'json',
						data : {
							imp_uid : rsp.imp_uid
						//기타 필요한 데이터가 있으면 추가 전달
						}
					}).done(function(data) {
						//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if (everythings_fine) {
							var msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
							alert(msg);
						} else {
							//[3] 아직 제대로 결제가 되지 않았습니다.
							//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
		};
	</script>
	<!--------------------->
</body>
</html>