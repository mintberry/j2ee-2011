<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<title>StudentPortal</title>

		<meta http-equiv="content-type" content="text/html;charset=utf-8" />

		<meta name="description"
			content="GuruDigger is a tailor-made community only for web engineers." />

		<meta name="keywords" content="Gurudigger" />

		<link href="/imgs/c1.jpg" rel="shortcut icon"
			type="image/x-icon" />

		<link href="http://res.gurudigger.com/css/core.css" rel="stylesheet"
			type="text/css" />

		<script src="http://res.gurudigger.com/js/jquery-1.4.2.min.js"
			type="text/javascript">
</script>

		<script src="http://res.gurudigger.com/jsware.package.js"
			type="text/javascript">
</script>



		<link href="http://res.gurudigger.com/css/home.tpl.css"
			rel="stylesheet" type="text/css" />

		<link
			href="http://res.gurudigger.com/globalization/en-us/css/home.tpl.css"
			rel="stylesheet" type="text/css" />

		<!--[if IE ]><link href="http://res.gurudigger.com/css/ie.css" rel="stylesheet" type="text/css"/><![endif]-->

		<link media="only screen and (max-device-width: 480px)"
			href="http://res.gurudigger.com/css/iphone.css" type="text/css"
			rel="stylesheet" />

		<script src="http://res.gurudigger.com/js/main.js"
			type="text/javascript">
</script>

		<script src="http://res.gurudigger.com/js/gd.page.js"
			type="text/javascript">
</script>







	</head>



	<body>





		<div id="mn">





			<div id="panel" class="block">

				<div class="logo">
					<a href="http://sse.tongji.edu.cn"><img src="imgs/sse.png"
							alt="S" title="StudentPortal" /> </a>
				</div>

				<div class="doc">

					<div class="doc-title clearfix">

						<h3 class="doc-caption">
							登录
						</h3>

					</div>

					<div class="doc-content clearfix">

						<div id="login-form" class="form">
							<form action="/StudentPortal/LoginServlet" method = "post">

								<div id="row-email" class="row clearfix">

									<div class="clearfix">

										<label for="acc_email" class="label">
											用户:
										</label>

									</div>

									<input id="acc_email" name="userID" type="text" class="text bd"
										tabindex="1" />



								</div>

								<div id="row-pass" class="row clearfix">

									<div class="clearfix">

										<label for="acc_pass" class="label">
											密码:
										</label>
										<input type="password" id="acc_pass" name="password"
											class="text bd" tabindex="2" />

										<a id="link_forgot" class="fn-s" href="/forgetpassword"
											tabindex="5">忘记密码?</a>

									</div>
								</div><div id="row-summary" class="row clearfix">



								</div>
								<input type="image" alt="提交" src="imgs/login.png"
									onclick="submit()" /><br /></form>

						</div></div>
					<div align="center"><strong><font color="#ff0000">${requestScope.errorInformation}</font></strong><h4><strong></strong></h4><strong><font color="#ff0000"><br /></font></strong></div>
				</div>

				<script type="text/javascript">

var LoginInfo = {

	WarnEmailNotValid : "Please input a valid email address",

	WarnPasswordError : "Incorrect email or password",

	WarnNotActived : "Your account has not been actived. Please be patient.",

	WarnEmailEmpty : "Please specify your email address",

	WarnPasswordEmpty : "Please specify your password"

};
</script>

				<script type="text/javascript">
CF.Package.Include("GD.Login", true, "en-US");</script>



			</div>

			<div id="hm-foot" style="top: 561px; left: -3px;">

				<div id="link">

					<a id="lnk-blog" title="Project" target="_blank"
						href="http://code.google.com/p/j2ee-2011/">Project Home</a>

				</div>

			</div>

			<div id="home-contact" class="do-contact"></div>

			<div id="mn-pop"></div>







			<div id="ct">

				<div id="ct-form">

					<div id="ct-btn" class="ct-close"></div>

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

							<div id="ct-warn"></div>
							<a id="ct-submit"></a>

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

						<a id="ct-close"></a>

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