<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*"%>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="ko"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="ko">
<!--<![endif]-->
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>FAQ - MAːDÆ</title>
    <meta name="description" content="">
    <link rel="shortcut icon" href="../../images/icon.ico">
    <!-- CSS FILES -->
    <link rel="stylesheet" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" type="text/css" href="../../css/style.css" media="screen" data-name="skins">
    <link rel="stylesheet" href="../../css/layout/wide.css" data-name="layout">
    <link rel="stylesheet" href="../../css/fractionslider.css" />
    <link rel="stylesheet" href="../../css/style-fraction.css" />
    <link rel="stylesheet" type="text/css" href="../../css/switcher.css" media="screen" />
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
						<h2>FAQ : 자주하는 질문</h2>
						<nav id="breadcrumbs">
							<ul>
								<li>You are here:</li>
								<li><a href="../../index.jsp">Home</a></li>
                                <li>FAQ</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
        <div class="container">
	<div class="row sub_content">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="dividerHeading">
                    <h4><span>FAQ - 자주하는 질문</span></h4>
                </div>
            </div>
            <div class="col-md-6 col-xs-12">
                <div id="accordion" class="panel-group accordion"><!-- Accordians -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <span class="accordian-icon">
                                    <i class="switch fa fa-plus-circle"></i>
                                </span>
                                <a href="#collapseOne" data-parent="#accordion" data-toggle="collapse">
                                   Q: 디자인은 직접 하시는 건가요?
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapse" id="collapseOne">
                            <div class="panel-body"><b>A:</b>&nbsp;디자인은 저희에게 의뢰하신 디자이너분께서 직접 작업하여 보내드리는 것입니다.</div>
                            <div class="panel-body"> &nbsp;&nbsp;양질의 서비스를 제공할 수 있도록 항상 노력 하겠습니다.</div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <span class="accordian-icon">
                                    <i class="switch fa fa-plus-circle"></i>
                                </span>
                                <a href="#collapseTwo" data-parent="#accordion" data-toggle="collapse">
                                    Q: 제가 직접 디자인한 상품을 올릴 수 있나요?
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapse" id="collapseTwo">
                            <div class="panel-body"><b>A:</b>&nbsp;네, 디자이너로 회원가입하신 후, 해당 디자인과 관련된 사진, 설계도를 첨부하시어 디자인 의뢰를 해주시면 관리자 검토 후 해당 디자인 상품을 올려드릴 것 입니다.</div>
                            <div class="panel-body"> &nbsp;&nbsp;양질의 서비스를 제공할 수 있도록 항상 노력 하겠습니다.</div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <span class="accordian-icon">
                                    <i class="switch fa fa-plus-circle"></i>
                                </span>
                                <a href="#collapseThree" data-parent="#accordion" data-toggle="collapse">
                                    Q: 배송은 어떡하죠?
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapse" id="collapseThree">
                            <div class="panel-body"><b>A:</b>&nbsp;배송은 해당하는 택배회사로 저희가 의로 후 운송장 번호를 받아 주문 상태에 띄워 드릴 것입니다. 후에 그 정보를 보시고 확인하시면 됩니다 ^^.</div>
                            <div class="panel-body"> &nbsp;&nbsp;양질의 서비스를 제공할 수 있도록 항상 노력 하겠습니다.</div>
                        </div>
                    </div>
                </div>
            </div><!-- /Accordians -->
            <div class="col-md-6 col-xs-12">
                <div id="toggle" class="panel-group toggle"><!-- Toggle -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <span class="accordian-icon">
                                    <i class="switch fa fa-plus-circle"></i>
                                </span>
                                <a href="#collapseFour" data-parent="#toggle" data-toggle="collapse">
                                    Q: 1:1 문의를 드리고 싶은데 이미지 첨부 가능한가요?
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapse" id="collapseFour">
                            <div class="panel-body"><b>A:</b>&nbsp;넵, 가능합니다! 문의하고자 하는 사진을 올려주신 후 문의해주시면 관리자가 확인 후 순차적으로 답변해드리고 있습니다.</div>
                            <div class="panel-body"> &nbsp;&nbsp;양질의 서비스를 제공할 수 있도록 항상 노력 하겠습니다.</div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <span class="accordian-icon">
                                    <i class="switch fa fa-plus-circle"></i>
                                </span>
                                <a href="#collapseFive" data-parent="#toggle" data-toggle="collapse">
                                     Q: 배송 시에 배송지는 안정하나요?
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapse" id="collapseFive">
                            <div class="panel-body"><b>A:</b>&nbsp;네... 그 부분은 아직 수정 중에 있습니다. 잠시만 기다려 주세요 ㅠㅜ.</div>
                            <div class="panel-body"> &nbsp;&nbsp;양질의 서비스를 제공할 수 있도록 항상 노력 하겠습니다.</div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <span class="accordian-icon">
                                    <i class="switch fa fa-plus-circle"></i>
                                </span>
                                <a href="#collapseSix" data-parent="#toggle" data-toggle="collapse">
                                     Q: 디자이너와 일반 구매자의 차이가 뭔가요?
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapse" id="collapseSix">
                            <div class="panel-body"><b>A:</b>&nbsp;디자이너분들은 디자인된 아이템을 등록요청 하는 것 외에도 자신의 아이템이 얼마나 팔렸는지 확인 하실 수 있는 기능이 있습니다. 바로 수익 확인 게시글 부분이죠, 일반 사용자분들은 보실 수 없는 화면을 디자이너분들은 확인이 가능하도록 차별화를 두었습니다.</div>
                            <div class="panel-body"> &nbsp;&nbsp;양질의 서비스를 제공할 수 있도록 항상 노력 하겠습니다.</div>
                        </div>
                    </div>
                </div><!-- /Toggle -->
            </div>
        </div><!--./row-->
    </section>
    <!--End wrapper-->
    
	<!--start footer-->
	<%@ include file="../../footer.jsp" %>
	<!--end footer-->
</body>
</html>