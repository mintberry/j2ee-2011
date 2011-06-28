
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
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

		<link href="imgs/c1.jpg" rel="shortcut icon" type="image/x-icon" />

		<link href="css/core.css" rel="stylesheet" type="text/css" />

		<%--script src="http://res.gurudigger.com/js/jquery-1.4.2.min.js"
			type="text/javascript">
</script>

		<script src="http://res.gurudigger.com/jsware.package.js"
			type="text/javascript">
</script--%>



		<link href="css/home.tpl.css" rel="stylesheet" type="text/css" />

		<link href="css/home.tpl.en.css" rel="stylesheet" type="text/css" />

		<!--[if IE ]><link href="http://res.gurudigger.com/css/ie.css" rel="stylesheet" type="text/css"/><![endif]-->

		<link media="only screen and (max-device-width: 480px)"
			href="http://res.gurudigger.com/css/iphone.css" type="text/css"
			rel="stylesheet" />

		<%--script src="http://res.gurudigger.com/js/main.js"
			type="text/javascript">
</script>

		<script src="http://res.gurudigger.com/js/gd.page.js"
			type="text/javascript">
</script--%>







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
							第一次登录请验证邮箱地址
						</h3>

					</div>

					<div class="doc-content clearfix">

						<div id="login-form" class="form">
							<form name="loginform" action="/StudentPortal/CheckMailAddrServlet"
								method="post">

								<div id="row-email" class="row clearfix">

									<div class="clearfix">

										<label for="acc_email" class="label">
											邮箱地址:

										</label>
										<span id="error1" style="display: none" style="font-size:10px"><font
											color=red>请输入 正确的邮箱地址</font> </span>

									</div>

									<input id="acc_email" name="email1" type="text" class="text bd"
										tabindex="1" />



								</div>

								<div id="row-pass" class="row clearfix">


								</div>
								<div id="row-summary" class="row clearfix">



								</div>
								<%--input type="image" alt="提交" src="imgs/login.png" /--%>
								<img alt="提交" src="imgs/login.png" class="submitbtn"
									style="cursor: pointer;"
									onclick="validateForm(document.loginform)" width="128"
									height="35" />
								<br />
							</form>


						</div>
					</div>
					<div align="center">
						<strong><font color="#ff0000">${requestScope.errorInformation}</font>
						</strong>
						<h4>
							<strong></strong>
						</h4>
						<strong><font color="#ff0000"><br /> </font> </strong>
					</div>
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


		</div>




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
var errMsg = {
	required : {
		msg : '此处不能为空',
		test : function(obj) {
			return trim(obj.value).length > 0
					|| trim(obj.value) != obj.defaultValue;
		}
	},
	email : {
		msg : '非法的邮箱地址',
		test : function(obj) {
			return trim(obj.value).length <= 0
					|| /^[a-z0-9_+.-]+\@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/i
							.test(obj.value);
		}
	},
	phone : {
		msg : '非法的电话号码',
		test : function(obj) {
			var m = /(\d{3}).*(\d{3}).*(\d{4})/.exec(obj.value);
			if (m)
				obj.value = "(" + m[1] + ") " + m[2] + "-" + m[3];
			return trim(obj.value).length <= 0 || m;
		}
	},
	date : {
		msg : '非法日期',
		test : function(obj) {
			return trim(obj.value).length <= 0
					|| /^\d{2}\/\d{2}\/\d{2,4}$/.test(obj.value);
		}
	},
	url : {
		msg : '非法的网址',
		test : function(obj) {
			return trim(obj.value).length <= 0
					|| obj.value == 'http://'
					|| /^https?:\/\/([a-z0-9-]+\.)+[a-z0-9]{2,4}.*$/
							.test(obj.value);
		}
	}
}
function trim(value) {
	return value.replace(/(^\s*)|(\s*$)/g, '');
}
//验证表单所有字段的函数
//form是个表单元素的引用
function validateForm(form) {
	document.getElementById("error1").style.display = "none";
	//document.getElementById("error2").style.display = "none";
	////alert(form.elements.length);
	//form.submit();
	var valid = true;

	var reMail = /^(?:\w+\.?)*\w+@(?:\w+\.)+\w+$/;

	var firstMail = form.elements[0].value;
	//var secondMail = form.elements[1].value;
	//alert(firstMail + ":" + secondMail);
	if (!reMail.exec(firstMail)) {
		//alert("IDerror");
		document.getElementById("error1").style.display = "inline";

		valid = false;
		return valid;
	}

	if (valid) {
		form.submit();
	}
	return valid;

}

//验证单个字段的内容
function validateField(elem) {
	var errors = [];
	//遍历所有可能的验证技术
	for ( var name in errMsg) {
		//查看字段是否有错误类型指定的class
		var re = new RegExp('(^|\\s)' + name + '(\\s|$)');
		//检查元素是否带有该class并把它传递给验证函数
		if (re.test(elem.className) && !errMsg[name].test(elem))
			//如果没有通过验证,把错误信息增加到列表中
			errors.push(errMsg[name].msg);
	}
	//如果存在错误信息,则显示出来
	if (errors.length)
		showErrors(elem, errors);
	return errors.length > 0; //>0说明有错误信息
}

/*显示和隐藏相应字段的错误信息*/
//隐藏当前正显示的任何错位信息
function hideErrors(elem) {
	//获取当前字段的下一个元素
	var next = elem.nextSibling;
	//如果下一个元素是ul并有class为errors
	if (next && next.nodeName == 'UL' && next.className == 'errors')
		//删掉它(这是我们'隐藏'的含义)
		elem.parentNode.removeChild(next);
}

//显示表单内特定字段的错误信息
function showErrors(elem, errors) {
	//获取当前字段的下一个元素
	var next = elem.nextSibling;
	//如果该字段不是我们指定的包含错误的容器
	if (next && (next.nodeName != 'UL' || next.className != 'errors')) {
		//我们得生成一个
		next = document.createElement('ul');
		next.className = 'errors';
		//并在DOM中把它插入到恰当的地方
		//从HTML中看,这里的elem.nextSibling指向的是'<br/>',
		//而<ul>本身默认的display为block
		elem.parentNode.insertBefore(next, elem.nextSibling);
	}
	//现在有了一个包含错误的容器引用,我们可以遍历所有的错误信息了
	for ( var i = 0; i < errors.length; i++) {
		var li = document.createElement('li');
		li.innerHTML = errors[i];
		//并插入到DOM中
		next.appendChild(li);
	}
}
</script>
	</body>

</html>