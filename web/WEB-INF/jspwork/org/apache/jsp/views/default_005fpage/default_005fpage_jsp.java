/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.45
 * Generated at: 2017-08-08 12:29:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.default_005fpage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import member.model.vo.*;

public final class default_005fpage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/views/default_page/../../footer.jsp", Long.valueOf(1502193200665L));
    _jspx_dependants.put("/views/default_page/../../header.jsp", Long.valueOf(1502194587759L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_packages.add("member.model.vo");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<!--[if IE 8 ]><html class=\"ie ie8\" class=\"no-js\" lang=\"ko\"> <![endif]-->\r\n");
      out.write("<!--[if (gte IE 9)|!(IE)]><!--><html class=\"no-js\" lang=\"ko\"> <!--<![endif]-->\r\n");
      out.write("<head>\r\n");
      out.write("\t<meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\r\n");
      out.write("\t<title>Dafault_page - MAːDÆ</title>\r\n");
      out.write("\t<meta name=\"description\" content=\"\">\r\n");
      out.write("\t<link rel=\"shortcut icon\" href=\"/made/images/icon.ico\">\r\n");
      out.write("\t<!-- CSS FILES -->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/made/css/bootstrap.min.css\"/>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/made/css/style.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/made/css/style.css\" media=\"screen\" data-name=\"skins\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/made/css/layout/wide.css\" data-name=\"layout\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/made/css/fractionslider.css\"/>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"/made/css/style-fraction.css\"/>\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/made/css/switcher.css\" media=\"screen\" />\r\n");
      out.write("    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\r\n");
      out.write("    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\r\n");
      out.write("    <!--[if lt IE 9]>\r\n");
      out.write("    <script src=\"https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js\"></script>\r\n");
      out.write("    <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\r\n");
      out.write("    <![endif]-->\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t\r\n");
      out.write("\t<!--Start Header-->\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("\r\n");

	Member m = (Member) session.getAttribute("member");
	String loginout;
	String[] addr = new String[3];
	
	if (m == null) {
		loginout = "<a href='#login-modal' data-toggle='modal' data-target='#login-modal'>&nbsp;Login&nbsp;</a>";
		//loginout = "<a href='/made/loginout.jsp'>&nbsp;Login&nbsp;</a>";
	} else {
		loginout = "&nbsp;<b>" + m.getNickName()
				+ "</b>님 환영합니다!&nbsp;&nbsp;<a href='/made/logout'>&nbsp;Logout&nbsp;</a>";
		addr = m.getAddress().split(",");
	}

      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"/made/js/jquery-1.10.2.min.js\"></script>\r\n");
      out.write("<script src=\"/made/js/bootstrap.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!-- 서브메뉴 색상 변경 jQuery -->\r\n");
      out.write("<script>\r\n");
      out.write("\t/* $(function() {\r\n");
      out.write("\t\t//console.log(\"현 경로 : \"+currentPath);\r\n");
      out.write("\t\t$(\".navbar-nav > li\").each(\r\n");
      out.write("\t\t\t\tfunction() {\r\n");
      out.write("\t\t\t\t\t$(this).on('click',function(){\r\n");
      out.write("\t\t\t\t\t\t$(\".navbar-nav > li\").not($(this)).removeClass('active');\r\n");
      out.write("\t\t\t        \t$(this).addClass('active');\r\n");
      out.write("\t\t\t\t\t});\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t}); */\r\n");
      out.write("\t var currentPath = window.location.pathname.substr(window.location.pathname.lastIndexOf(\"/\")+1);\r\n");
      out.write("\t//console.log(currentPath);\r\n");
      out.write("\t//console.log(window.location.pathname);\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\t//console.log(\"현 경로 : \"+currentPath);\r\n");
      out.write("\t\t$(\".navbar-nav > li\").each(function(){\r\n");
      out.write("\t        var usePage = $(this).children('a').attr('href').substr($(this).children('a').attr('href').lastIndexOf(\"/\")+1);\r\n");
      out.write("\t        //console.log(usePage);\r\n");
      out.write("\t        if(currentPath == usePage){\r\n");
      out.write("\t        \t$(\".navbar-nav > li\").not($(this)).removeClass('active');\r\n");
      out.write("\t        \t$(this).addClass('active');\r\n");
      out.write("\t        } else if(currentPath.indexOf(\"item\") != -1 \r\n");
      out.write("\t        \t\t|| currentPath.indexOf(\"part\") != -1\r\n");
      out.write("\t        \t\t|| currentPath.indexOf(\"design\") != -1\r\n");
      out.write("\t        \t\t|| currentPath.indexOf(\"dDetail\") != -1 \r\n");
      out.write("\t        \t\t|| currentPath.indexOf(\"pDetail\") != -1\r\n");
      out.write("\t        \t\t|| currentPath.indexOf(\"pup\") != -1\r\n");
      out.write("\t        \t\t|| currentPath.indexOf(\"dup\") != -1){\r\n");
      out.write("                $(\".navbar-nav > li\").removeClass('active');\r\n");
      out.write("\t        \t$(\"li#item\").addClass('active');\r\n");
      out.write("\t        } else if(currentPath.indexOf(\"notice\") != -1 || currentPath.indexOf(\"nlist\") != -1 || currentPath.indexOf(\"ndetail\") != -1){\r\n");
      out.write("                $(\".navbar-nav > li\").removeClass('active');\r\n");
      out.write("\t        \t$(\"li#notice\").addClass('active');\r\n");
      out.write("            } else if (currentPath.indexOf(\"mypage\") != -1 || currentPath.indexOf(\"order\") != -1 || currentPath.indexOf(\"qlist\") != -1  || currentPath.indexOf(\"qa\") != -1 || currentPath.indexOf(\"qdetail\") != -1 || currentPath.indexOf(\"qmlist\") != -1){\r\n");
      out.write("            \t$(\".navbar-nav > li\").removeClass('active');\r\n");
      out.write("\t        \t$(\"li#mypage\").addClass('active');\r\n");
      out.write("            } else {\r\n");
      out.write("            \t$(\".navbar-nav > li\").removeClass('active');\r\n");
      out.write("            \t$(\".navbar-nav > li\").eq(0).addClass('active');\r\n");
      out.write("            }\r\n");
      out.write("\t        //console.log(\"참조할 경로 : \"+$(this).children('a').attr('href').substr($(this).children('a').attr('href').lastIndexOf(\"/\")+1));\r\n");
      out.write("\t    });\r\n");
      out.write("\t}); \r\n");
      out.write("</script>\r\n");
      out.write("<!-- 서브메뉴 색상 변경 End -->\r\n");
      out.write("<!-- Modal Start -->\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".modal-dialog {\r\n");
      out.write("    width: 300px;\r\n");
      out.write("}\r\n");
      out.write(".modal-footer {\r\n");
      out.write("    height: 70px;\r\n");
      out.write("    margin: 0;\r\n");
      out.write("}\r\n");
      out.write(".modal-footer .btn {\r\n");
      out.write("    font-weight: bold;\r\n");
      out.write("}\r\n");
      out.write(".input-group-addon {\r\n");
      out.write("    color: #fff;\r\n");
      out.write("    background: #3276B1;\r\n");
      out.write("}\r\n");
      out.write(".prettyline {\r\n");
      out.write("  height: 5px;\r\n");
      out.write("  border-top: 0;\r\n");
      out.write("  background: #c4e17f;\r\n");
      out.write("  border-radius: 5px;\r\n");
      out.write("  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);\r\n");
      out.write("  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);\r\n");
      out.write("  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);\r\n");
      out.write("  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("    $('.modal-footer > button').click(function(){\r\n");
      out.write("    \t$.ajax({\r\n");
      out.write("\t\t\turl : \"/made/login\",\r\n");
      out.write("\t\t\tdata : {id : $('#uLogin').val(), pwd : $('#uPassword').val()},\r\n");
      out.write("\t\t\ttype : \"post\",\r\n");
      out.write("\t\t\tsuccess : function(result){\r\n");
      out.write("\t\t\t\tif(result == \"ok\"){\r\n");
      out.write("\t\t\t\t\talert(\"로그인 성공!\");\r\n");
      out.write("\t\t\t\t\tlocation.href = \"/made/index.jsp\";\r\n");
      out.write("\t\t\t\t} else {\r\n");
      out.write("\t\t\t\t\talert(\"로그인 실패!! 입력값을 재확인 하세요!\");\r\n");
      out.write("\t\t\t\t\tlocation.href = \"/made/index.jsp\";\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}, error : function(request,status,error) {\r\n");
      out.write("\t\t\t\talert(\"ERROR code:\"+request.status+\"\\n\"+\"message:\"+request.responseText+\"\\n\"+\"error:\"+error);\r\n");
      out.write("\t\t\t\tlocation.href = \"/made/404-page.jsp?message='로그인 서비스 실패'\";\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("    \t$('#login-modal').modal('hide');\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write(" <div class=\"modal fade\" id=\"login-modal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("\t<div class=\"modal-dialog\">\r\n");
      out.write("\t\t<div class=\"modal-content\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"modal-header\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\r\n");
      out.write("\t\t\t\t<p class=\"modal-title\" id=\"myModalLabel\" align=\"center\">\r\n");
      out.write("\t\t\t\t<img src=\"/made/images/logo.png\" style=\"height:30px; width:auto; margin-top: -6px;\">\r\n");
      out.write("\t\t\t\t&nbsp;&nbsp;<b style=\"font-size: 16pt;\">Log in</b></p>\r\n");
      out.write("\t\t\t</div> <!-- /.modal-header -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"modal-body\">\r\n");
      out.write("\t\t\t\t<form role=\"form\" id=\"loginform\">\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group\">\r\n");
      out.write("\t\t\t\t\t\t\t<label for=\"uLogin\" class=\"input-group-addon glyphicon glyphicon-user\"></label>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"uLogin\" placeholder=\"Login\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div> <!-- /.form-group -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"input-group\">\r\n");
      out.write("\t\t\t\t\t\t\t<label for=\"uPassword\" class=\"input-group-addon glyphicon glyphicon-lock\"></label>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"password\" class=\"form-control\" id=\"uPassword\" placeholder=\"Password\">\r\n");
      out.write("\t\t\t\t\t\t</div> <!-- /.input-group -->\r\n");
      out.write("\t\t\t\t\t</div> <!-- /.form-group -->\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\r\n");
      out.write("\t\t\t</div> <!-- /.modal-body -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"modal-footer\">\r\n");
      out.write("\t\t\t\t<button class=\"form-control btn btn-default btn-block\">Ok</button>\r\n");
      out.write("\t\t\t</div> <!-- /.modal-footer -->\r\n");
      out.write("\r\n");
      out.write("\t\t</div><!-- /.modal-content -->\r\n");
      out.write("\t</div><!-- /.modal-dialog -->\r\n");
      out.write("</div><!-- /.modal -->\r\n");
      out.write("<!-- Modal End -->\r\n");
      out.write("\r\n");
      out.write("<!-- 로그인 여부를 확인하고 로그인 모달 창 호출 -->\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\t$('#mypage ul li a').on(\"click\", function(){\r\n");
      out.write("\t\t\tif($('a').first().text().trim() == \"Login\"){\r\n");
      out.write("\t\t\t\t$(\"#login-modal\").modal();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<header id=\"header\" class=\"clearfix\">\r\n");
      out.write("\t<div id=\"top-bar\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-7 hidden-xs top-info\">\r\n");
      out.write("\t\t\t\t\t<!--                        <span><i class=\"fa fa-phone\"></i>Phone: (123) 456-7890</span>\r\n");
      out.write("                        <span><i class=\"fa fa-envelope\"></i>Email: firerain4@naver.com</span>-->\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-5 top-info\">\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<!-- <li>");
      out.print(request.getRequestURL());
      out.write("</li> -->\r\n");
      out.write("\t\t\t\t\t\t<li style=\"width: auto;\">");
      out.print(loginout);
      out.write("</li>\r\n");
      out.write("\t\t\t\t\t\t");

							if (m == null) {
						
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<li><a\r\n");
      out.write("\t\t\t\t\t\t\thref=\"/made/views/user/signup.jsp\">&nbsp;회원가입&nbsp;</a></li>\r\n");
      out.write("\t\t\t\t\t\t");

							}
						
      out.write("\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- LOGO bar -->\r\n");
      out.write("\t<div id=\"logo-bar\" class=\"clearfix\">\r\n");
      out.write("\t\t<!-- Container -->\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<!-- Logo / Mobile Menu -->\r\n");
      out.write("\t\t\t\t<div class=\"col-xs-12\">\r\n");
      out.write("\t\t\t\t\t<div id=\"logo\" style=\"width: 170px;\">\r\n");
      out.write("\t\t\t\t\t\t<h1>\r\n");
      out.write("\t\t\t\t\t\t\t<a href=\"/made/index.jsp\"><img src=\"/made/images/logo.png\"\r\n");
      out.write("\t\t\t\t\t\t\t\talt=\"Made\" /></a>\r\n");
      out.write("\t\t\t\t\t\t</h1>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- Container / End -->\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!--LOGO bar / End-->\r\n");
      out.write("\r\n");
      out.write("\t<!-- Navigation\r\n");
      out.write("================================================== -->\r\n");
      out.write("\t<div class=\"navbar navbar-default navbar-static-top\" role=\"navigation\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\"\r\n");
      out.write("\t\t\t\t\t\tdata-target=\".navbar-collapse\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"sr-only\">Toggle navigation</span> <span\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"navbar-collapse collapse\">\r\n");
      out.write("\t\t\t\t\t<ul class=\"nav navbar-nav\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"/made/index.jsp\">Home</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li id=\"notice\"><a href=\"/made/nilst?page=1\">공지사항</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li id=\"item\"><a href=\"#\">DIY 상품</a>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"dropdown-menu\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"/made/designitemlist?page=1\">Designed</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"/made/partitemlist?page=1\">Parts</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul></li>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<li id=\"mypage\"><a href=\"/made/views/mypage/order_page.html\">마이페이지</a>\r\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"dropdown-menu\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"/made/views/mypage/myinfo.html\">My page</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"/made/corderlist\">주문내역</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"/made/views/mypage/myinfo.html\">회원정보수정</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"/made/views/mypage/myinfo.html\">쪽지함</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
 if(m != null && m.getClassCode().charAt(0) == 'A'){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"/made/qlist?page=1\">1:1문의확인</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");
}else{ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><a href=\"/made/qmlist?page=1\">1:1문의</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</ul></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"/made/views/faq/faq.jsp\">FAQ</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"/made/views/default_page/default_page.jsp\">Default</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"/made/contact.html\">Contact</a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!--/.row -->\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!--/.container -->\r\n");
      out.write("\t</div>\r\n");
      out.write("</header>");
      out.write("\r\n");
      out.write("\t<!--End Header-->\r\n");
      out.write("\r\n");
      out.write("\t<!--start wrapper-->\r\n");
      out.write("\t<section class=\"wrapper\">\r\n");
      out.write("       <section class=\"page_head\">\r\n");
      out.write("\t\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-lg-12 col-md-12 col-sm-12\">\r\n");
      out.write("\t\t\t\t\t\t<h2>게시글 제목</h2>\r\n");
      out.write("\t\t\t\t\t\t<nav id=\"breadcrumbs\">\r\n");
      out.write("\t\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>You are here:</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"/made/index.jsp\">Home</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href=\"default_page.html\">Shortcodes</a></li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<li>Typography</li>\r\n");
      out.write("\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t</nav>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</section>\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("        <h1> 내용 작성 부 </h1>\r\n");
      out.write("        <!--- 여기에 내용을 작성해주세요~ --->\r\n");
      out.write("</div>\r\n");
      out.write("    </section>\r\n");
      out.write("\r\n");
      out.write("\t<!--start footer-->\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("<!-- <meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("<meta name=\"viewport\"\r\n");
      out.write("\tcontent=\"width=device-width, initial-scale=1, maximum-scale=1\">\r\n");
      out.write("<meta name=\"description\" content=\"\"> -->\r\n");
      out.write("\t<footer class=\"footer\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-6 col-md-3 col-lg-3\">\r\n");
      out.write("\t\t\t\t\t<div class=\"widget_title\">\r\n");
      out.write("\t\t\t\t\t\t<h4>\r\n");
      out.write("\t\t\t\t\t\t\t<span>About Us</span>\r\n");
      out.write("\t\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"widget_content\">\r\n");
      out.write("\t\t\t\t\t\t<p>본 프로젝트는 KH정보교육원 [NCS]웹 개발 응용SW엔지니어 양성과정_2주차 오후반 3조에서 만든\r\n");
      out.write("\t\t\t\t\t\t\tSemi 프로젝트입니다.</p>\r\n");
      out.write("\t\t\t\t\t\t<ul class=\"contact-details-alt\">\r\n");
      out.write("\t\t\t\t\t\t\t<li><i class=\"fa fa-map-marker\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<strong>Address</strong>: 서울시 강남구 역삼동\r\n");
      out.write("\t\t\t\t\t\t\t\t</p></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><i class=\"fa fa-user\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<strong>Phone</strong>: 010-5688-2293\r\n");
      out.write("\t\t\t\t\t\t\t\t</p></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><i class=\"fa fa-envelope\"></i>\r\n");
      out.write("\t\t\t\t\t\t\t\t<p>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<strong>Email</strong>: <a href=\"#\">firerain4@naver.com</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</p></li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-6 col-md-3 col-lg-3\">\r\n");
      out.write("\t\t\t\t\t<div class=\"widget_title\">\r\n");
      out.write("\t\t\t\t\t\t<h4>\r\n");
      out.write("\t\t\t\t\t\t\t<span>Flickr Gallery</span>\r\n");
      out.write("\t\t\t\t\t\t</h4>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"widget_content\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"flickr\">\r\n");
      out.write("\t\t\t\t\t\t\t<ul id=\"flickrFeed\" class=\"flickr-feed\"></ul>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</footer>\r\n");
      out.write("\r\n");
      out.write("\t<section class=\"footer_bottom\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"col-lg-6 \">\r\n");
      out.write("\t\t\t\t\t<p class=\"copyright\">\r\n");
      out.write("\t\t\t\t\t\t&copy; Copyright 2017 MAːDÆ | Powered by <a\r\n");
      out.write("\t\t\t\t\t\t\thref=\"http://www.jqueryrain.com/\">jQuery Rain</a>\r\n");
      out.write("\t\t\t\t\t</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<div class=\"col-lg-6 \">\r\n");
      out.write("\t\t\t\t\t<div class=\"footer_social\">\r\n");
      out.write("\t\t\t\t\t\t<ul class=\"footbot_social\">\r\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"fb\" href=\"#.\" data-placement=\"top\"\r\n");
      out.write("\t\t\t\t\t\t\t\tdata-toggle=\"tooltip\" title=\"Facbook\"><i\r\n");
      out.write("\t\t\t\t\t\t\t\t\tclass=\"fa fa-facebook\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"twtr\" href=\"#.\" data-placement=\"top\"\r\n");
      out.write("\t\t\t\t\t\t\t\tdata-toggle=\"tooltip\" title=\"Twitter\"><i\r\n");
      out.write("\t\t\t\t\t\t\t\t\tclass=\"fa fa-twitter\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"dribbble\" href=\"#.\" data-placement=\"top\"\r\n");
      out.write("\t\t\t\t\t\t\t\tdata-toggle=\"tooltip\" title=\"Dribbble\"><i\r\n");
      out.write("\t\t\t\t\t\t\t\t\tclass=\"fa fa-dribbble\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"skype\" href=\"#.\" data-placement=\"top\"\r\n");
      out.write("\t\t\t\t\t\t\t\tdata-toggle=\"tooltip\" title=\"Skype\"><i class=\"fa fa-skype\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t\t<li><a class=\"rss\" href=\"#.\" data-placement=\"top\"\r\n");
      out.write("\t\t\t\t\t\t\t\tdata-toggle=\"tooltip\" title=\"RSS\"><i class=\"fa fa-rss\"></i></a></li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</section>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t<script src=\"/made/js/jquery.easing.1.3.js\"></script>\r\n");
      out.write("\t<script src=\"/made/js/retina-1.1.0.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/made/js/jquery.cookie.js\"></script>\r\n");
      out.write("\t<!-- jQuery cookie -->\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/made/js/styleswitch.js?var=1\"></script>\r\n");
      out.write("\t<!-- Style Colors Switcher -->\r\n");
      out.write("\t<!-- ?ver=1 값은 브라우저 확인 시 기존 캐시값이 아닌 변경된 파일을 읽어 오라는 뜻  -->\r\n");
      out.write("\t<script src=\"/made/js/jquery.fractionslider.js\" type=\"text/javascript\"\r\n");
      out.write("\t\tcharset=\"utf-8\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/made/js/jquery.smartmenus.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\"\r\n");
      out.write("\t\tsrc=\"/made/js/jquery.smartmenus.bootstrap.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/made/js/jquery.jcarousel.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/made/js/jflickrfeed.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/made/js/jquery.magnific-popup.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/made/js/jquery.isotope.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/made/js/swipe.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/made/js/jquery-scrolltofixed-min.js\"></script>\r\n");
      out.write("\t<!-- include summernote css/js-->\r\n");
      out.write("\t<link href=\"/made/api/summernote/dist/summernote.css\" rel=\"stylesheet\">\r\n");
      out.write("\t<script src=\"/made/api/summernote/dist/summernote.js\"></script>\r\n");
      out.write("\t<!-- summer note korean language pack -->\r\n");
      out.write("\t<script src=\"/made/api/summernote/dist/lang/summernote-ko-KR.js\"></script>\r\n");
      out.write("\t<script src=\"http://dmaps.daum.net/map_js_init/postcode.v2.js\"></script>\r\n");
      out.write("\t\r\n");
      out.write("\t<script src=\"/made/js/main.js\"></script>\r\n");
      out.write("\t<!-- Start Style Switcher -->\r\n");
      out.write("\t<div class=\"switcher\"></div>\r\n");
      out.write("\t<!-- End Style Switcher -->\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Slider Setting -->\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\t$(window).load(function() {\r\n");
      out.write("\t\t\t$('.slider').fractionSlider({\r\n");
      out.write("\t\t\t\t'fullWidth' : true,\r\n");
      out.write("\t\t\t\t'controls' : true,\r\n");
      out.write("\t\t\t\t'responsive' : true,\r\n");
      out.write("\t\t\t\t'dimensions' : \"1920,450\",\r\n");
      out.write("\t\t\t\t'increase' : true,\r\n");
      out.write("\t\t\t\t'pauseOnHover' : true,\r\n");
      out.write("\t\t\t\t'slideEndAnimation' : true,\r\n");
      out.write("\t\t\t\t'autoChange' : true\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t});\r\n");
      out.write("\t</script>\r\n");
      out.write("\t<!-- Slider Setting -->");
      out.write("\r\n");
      out.write("\t<!--end footer-->\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
