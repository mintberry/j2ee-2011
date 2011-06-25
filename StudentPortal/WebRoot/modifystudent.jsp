<%@ page language="java" import="java.util.*" import="model.Studentinfo"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@page import="model.Studentinfo" import="model.Teacherinfo"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>

		<title>修改个人信息</title>

		<meta http-equiv="content-type" content="text/html;charset=utf-8" />

		<meta name="description"
			content="GuruDigger is a tailor-made community only for web engineers." />

		<meta name="keywords" content="Gurudigger" />

		<link href="imgs/c1.jpg" rel="shortcut icon" type="image/x-icon" />

		<link href="css/core.css" rel="stylesheet" type="text/css" />

		<%--script src="http://res.gurudigger.com/js/jquery-1.4.2.min.js"
			type="text/javascript">
		
</script--%>

		<!--script src="http://res.gurudigger.com/jsware.package.js"
			type="text/javascript">
</script-->



		<link href="css/home.css" rel="stylesheet" type="text/css" />

		<link href="css/home1.css" rel="stylesheet" type="text/css" />

		<!--[if IE ]><link href="http://res.gurudigger.com/css/ie.css" rel="stylesheet" type="text/css"/><![endif]-->

		<script src="http://res.gurudigger.com/js/main.js"
			type="text/javascript">
</script>

		<script src="http://res.gurudigger.com/js/gd.home.js"
			type="text/javascript">
</script>

		<script src="http://res.gurudigger.com/js/gd.page.js"
			type="text/javascript">
</script>

		<!--link media="only screen and (max-device-width: 480px)"
			href="http://res.gurudigger.com/css/iphone.css" type="text/css"
			rel="stylesheet" /-->
	</head>

	<body>

		<div id="mn">

			<div id="home">

				<div id="acc-apply" class="block">

					<div id="acc-apply-logo" class="logo">
						<img src="imgs/sse.png" alt="Tongji SSE" title="GuruDigger" />
					</div>

					<div id="acc-apply-mn" class="clearfix">

						<div id="app-apply-c-wrapper" class="ly-m clearfix">

							<div id="app-apply-c" class="ly-m-inner">
								<br />
								<br />
								<br />
								<br />
								<div align="center">
									用户基本信息
									<br>
								</div>
								<div align="center">
									<div align="center">
										<%
										    HttpSession hs = request.getSession();
										    Object inf = hs.getAttribute("user");
										    if(inf instanceof Studentinfo){
										    Studentinfo si = (Studentinfo)inf;%>
										    <br>
										学号：<%=si.getSId()%>&nbsp; &nbsp;&nbsp;姓名：<%=si.getName()%><br>
										性别：<%=si.getSex()%>
										    <%}else{
										    Teacherinfo ti = (Teacherinfo)inf;
										    %>
										    <br>
										工号：<%=ti.getTId()%>&nbsp; &nbsp;&nbsp;姓名：<%=ti.getName()%><br>
										性别：<%=ti.getSex()%>
										    <%}%>
											    
											
											
									<jsp:useBean id="si1" scope="page" class="model.Studentinfo"></jsp:useBean>
										
									</div>
								</div>

							</div>
						</div>
						<div id="acc-apply-l" class="ly-l">

							<div id="slogan"> 
								修改邮箱地址 
							</div>

							<div id="acc-form">
								<form name="mailform"
									action="/StudentPortal/CheckMailAddrServlet" method="post">

									<div id="row-email" class="row clearfix">

										<div class="clearfix">

											<div class="row-l">
												邮箱地址:
											</div>
											<span id="error1" style="display: none"
												style="font-size:10px"><font color=red>请输入正确的邮箱地址</font>
											</span>
										</div>

										<div class="row-c bd">
											<input id="acc-email" type="text" class="text" name="email1"
												maxlength="200" />
										</div>



									</div>

									<div id="row-blog" class="row clearfix">

										<div class="clearfix">

											<div class="row-l">
												验证邮箱地址:
											</div>
											<span id="error2" style="display: none"
												style="font-size:10px"><font color=red>两次输入不一致，请再试一次</font>
											</span>
										</div>

										<div class="row-c bd">
											<input id="acc-blog" type="text" class="text" maxlength="500"
												name="email2" />
										</div>



									</div>

									<div id="row-submit" class="row clearfix">
									</div>
									<%--input type="image" alt="提交" src="imgs/login.png"
										onclick="submit()" /--%>
									<img alt="提交" src="imgs/login.png" class="submitbtn"
										style="cursor: pointer;"
										onclick="validateForm(document.mailform)" width="128" height="35"/>
								</form>
							</div>



						</div>

						<div id="acc-apply-r" class="ly-r">





						</div>

					</div>

				</div>

				<div id="acc-info" class="block">

					<div class="logo">
						<img src="http://res.gurudigger.com/img/home.logo.gif"
							alt="GuruDigger" title="GuruDigger" />
					</div>

					<h1>
						Thanks for your interest in Gurudigger!
					</h1>

					<p>
						<p>
							If you haven't received our email yet in a few hours, please
							check the "
							<span class="fn-b">Spam</span>" or "
							<span class="fn-b">Junk Mail</span>" folder, as your confirmation
							email might have tragically been redirected.
						</p>
						<p>
							Any questions or suggestions feel free to
							<a href="#contact" class="do-contact">contact us</a>.
							<br />

							We look forward to making a perfect work for you.
						</p>
					</p>

				</div>

			</div>

			<div id="hm-foot" style="top: 640px; left: 2px;">

				<div id="link">

					<a id="lnk-blog" title="Project" target="_blank"
						href="http://code.google.com/p/j2ee-2011/">Project Home</a>

				</div>


			</div>

			<script type="text/javascript">

var Register = {

	PostURL : "/account/preregister",

	WarnEmailEmpty : "请输入邮箱地址",

	WarnEmailNotValid : "请输入合法的邮箱地址"

};

var ContactInfo = {

	PostURL : "/support/feedback",

	WarnFieldsEmpty : "You miss some fields.",

	WarnEmailNotValid : "Please enter a valid email address.",

	MaskName : "Name",

	MaskEmail : "Email",

	MaskDescription : "Description"

};
</script>









			<div id="ct">

				<div id="ct-form">



					<div id="ct-content">

						<div id="ct-pop-row-fst" class="ct-pop-row clearfix">

							<div class="ct-pop-row-l">
								<input id="ct-name" type="text" class="ct-text" maxlength="200" />
							</div>

							<div class="ct-pop-row-r">
								<input id="ct-email" type="text" class="ct-text" maxlength="200" />
							</div>

						</div>

						<div id="ct-pop-row-cate" class="ct-pop-row clearfix">

							<div class="ct-pop-row-l">
								Category:
							</div>

							<div class="ct-pop-row-r">

								<select id="ct-category" name="Category">
									<option value="Suggestion">
										Suggestion
									</option>
									<option value="WebError">
										Website Errors
									</option>
									<option value="Others">
										Others
									</option>
								</select>

							</div>

						</div>

						<div class="ct-pop-row clearfix">

							<textarea id="ct-desc" class="ct-text" rows="10" cols="20"></textarea>

						</div>

						<div class="ct-pop-row clearfix">



						</div>

					</div>

					<div id="ct-info">

						<h1>
							Thanks for contacting us
						</h1>

						<p>
							Your message has been received!
							<br />
							We will respond to you as soon as possible.
						</p>



					</div>

				</div>

			</div>





			<script type="text/javascript">

var ContactInfo = {

	PostURL : "{0}Support/Feedback".Format(CF.Package.Configuration.SiteRoot),

	WarnFieldsEmpty : "You miss some fields.",

	WarnEmailNotValid : "Please enter a valid email address.",

	MaskName : "Name",

	MaskEmail : "Email",

	MaskDescription : "Description"

};
</script>



			<script type="text/javascript">

$(function() {

	var isWorking = false;

	var isOpen = false;

	var ctName, ctEmail, ctDesc, ctCategory;

	var maskTip = [ ContactInfo.MaskName, ContactInfo.MaskEmail,
			ContactInfo.MaskDescription ];

	var ctForm = $("#ct-form");

	var ctTexts = $("#ct-form .ct-text");

	var ctPop = $("#mn-pop");

	$(".do-contact").each(function(i, o) {

		$(this).click(function() {

			if (!isOpen) {

				openContact();

			}

		});

	});

	ctTexts.each(function(i, o) {

		$(o).addClass("ct-mask");

		$(o).val(maskTip[i]);

		$(o).focus(function() {

			if ($(o).hasClass("ct-mask")) {

				$(o).val("");

				$(o).removeClass("ct-mask");

			}

		}).blur(function() {

			if ($(o).val() == "") {

				$(o).addClass("ct-mask");

				$(o).val(maskTip[i]);

			}

		});

	});

	$("#ct-btn").click(function() {

		if (isOpen) {

			closeContact();

		} else {

			openContact();

		}

	});

	ctPop.click(function() {

		if (isOpen) {

			closeContact();

		}

	});

	$("#ct-close").click(function() {

		if (isOpen) {

			closeContact();

		}

	});

	$("#ct-submit").click(function() {

		if (isWorking)
			return;

		if (!valid())
			return;

		enterMode();

		var url = ContactInfo.PostURL;

		$.post(url, {
			Email : ctEmail,
			Name : ctName,
			Category : ctCategory,
			Description : ctDesc
		}, function(json) {

			leaveMode();

			if (json.Status == "True") {

				$("#ct-content").hide();

				$("#ct-info").show();

			} else {

				alert(json);

			}

		}, "json");

	});

	function init() {

		$("#ct-content").show();

		$("#ct-info").hide();

	}
	;

	function openContact() {

		init();

		var _h = $(window).height();

		//var height = $("#mn").height();

		//height = _h > height ? _h : height;

		var dis = parseInt(($(window).width() - 500) / 2) + 500;

		ctPop.show();

		//ctPop.height(height);

		//$("#ct-form").animate({ "left": "+=" + dis + "px" }, "normal");

		var left = -500 + dis;

		var ctTop = (_h - 300) / 2;

		ctTop = ctTop < 10 ? 10 : ctTop;

		ctForm.css( {
			"left" : left + "px",
			"top" : ctTop + "px"
		});

		//$("#ct-btn").removeClass("ct-open").addClass("ct-close");

		isOpen = true;

	}
	;

	function closeContact() {

		ctForm.css( {
			"left" : "-5000px"
		});

		//ctForm.animate({ "left": "-500px" }, "normal", function () {

		ctPop.hide();

		//$("#ct-btn").removeClass("ct-close").addClass("ct-open");

		isOpen = false;

		//});

	}
	;

	function leaveMode() {

		$("#ct-submit").removeClass("btn-disabled");

		ctTexts.enabled();

		$("#ct-category").enabled();

		isWorking = false;

	}
	;

	function enterMode() {

		$("#ct-submit").addClass("btn-disabled")

		ctTexts.disabled();

		$("#ct-category").disabled();

		isWorking = true;

	}
	;

	function valid() {

		clearWarn();

		var obj_name = $("#ct-name");

		var obj_email = $("#ct-email");

		var obj_desc = $("#ct-desc");

		ctName = $.trim(obj_name.val());

		ctEmail = $.trim(obj_email.val());

		ctDesc = $.trim(obj_desc.val());

		ctCategory = $("#ct-category").val();

		var nullName = (ctName == "" || obj_name.hasClass("ct-mask"));

		var nullEmail = (ctEmail == "" || obj_email.hasClass("ct-mask"));

		var nullDesc = (ctDesc == "" || obj_desc.hasClass("ct-mask"));

		if (nullName && !obj_name.hasClass("ct-warn-bd"))

			obj_name.addClass("ct-warn-bd");

		if (nullEmail && !obj_email.hasClass("ct-warn-bd"))

			obj_email.addClass("ct-warn-bd");

		if (nullDesc && !obj_desc.hasClass("ct-warn-bd"))

			obj_desc.addClass("ct-warn-bd");

		if (nullName || nullEmail || nullDesc) {

			$("#ct-warn").text(ContactInfo.WarnFieldsEmpty);

			return false;

		}

		if (!$.isEmail(ctEmail)) {

			obj_email.addClass("ct-warn-bd");

			$("#ct-warn").text(ContactInfo.WarnEmailNotValid);

			return false;

		}

		$("#ct-warn").text("");

		return true;

	}
	;

	function clearWarn() {

		$("#ct-warn").text("");

		$("#ct-form .ct-warn-bd").removeClass("ct-warn-bd");

	}
	;

});
</script>

		</div>

		<script type="text/javascript">
function validateForm(form) {
	document.getElementById("error1").style.display = "none";
	document.getElementById("error2").style.display = "none";
	//alert(form.elements.length);
	//form.submit();
	var valid = true;

	var reMail = /^(?:\w+\.?)*\w+@(?:\w+\.)+\w+$/;

	var firstMail = form.elements[0].value;
	var secondMail = form.elements[1].value;
	//alert(firstMail + ":" + secondMail);
	if (!reMail.exec(firstMail)) {
		//alert("IDerror");
		document.getElementById("error1").style.display = "inline";

		valid = false;
		return valid;
	}
	if (secondMail != firstMail) {
		//alert("pwerror");
		document.getElementById("error2").style.display = "inline";

		valid = false;
	}

	if (valid) {
		form.submit();
	}
	return valid;

}
</script>

		<script type="text/javascript">

var _gaq = _gaq || [];

_gaq.push( [ '_setAccount', 'UA-17826227-1' ]);

_gaq.push( [ '_trackPageview' ]);

(function() {

	var ga = document.createElement('script');
	ga.type = 'text/javascript';
	ga.async = true;

	ga.src = ('https:' == document.location.protocol ? 'https://ssl'
			: 'http://www') + '.google-analytics.com/ga.js';

	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(ga, s);

})();
</script>
	</body>

</html>
