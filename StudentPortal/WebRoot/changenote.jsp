<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>修改通知</title>

		<meta name="keywords" content="Gurudigger" />
		<meta name="description" content="通知" />
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />

		<link href="imgs/c1.jpg" rel="shortcut icon" type="image/x-icon" />

		<link href="css/core.css" rel="stylesheet" type="text/css" />

		<link href="css/main.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
#prof-info {
	float: left;
	width: 720px;
	word-break: break-all;
	text-align: left;
}
</style>
	</head>

	<body>
		<div id="holder"></div>

		<div id="mn">

			<div id="mn-head" class="clearfix">

				<div id="hd" class="clearfix">

					<div id="hd-l">

						<a id="hd-logo" href="http://sse.tongji.edu.cn"> <img
								id="hd-logo-img" src="imgs/sse.png" title="Tongji" alt="Tongji" />
						</a>

					</div>

					<div id="hd-r">
						&nbsp;

						<br />

					</div>

				</div>

				<div id="nav-bar">



					<div id="sub-nav-c">

						<div id="sub-nav-c-lt">

						</div>

						<div id="sub-nav-c-rt">

						</div>

						<div id="sub-nav-c-lb">

						</div>

						<div id="sub-nav-c-rb">

						</div>

					</div>

					<br />
					<div id="nav-search">
					</div>
					<div id="nav-bd-l">

					</div>
					<br />

					<div id="nav-bd-r">

					</div>

					<br />
				</div>

			</div>

			<div id="mn-body" class="clearfix">



				<div id="mn-c" class="ly-m">

					<div id="mn-c-inner" class="ly-m-inner">



						<div id="prof-pnl" class="mn-c-pnl" align="center">





							修改通知
							<br />



							<div id="prof-basic" class="block clearfix bd-round-blue-light">

								<!--div id="prof-basic-l">

									<a href="/profile?uid=24660"><img id="prof-photo"
											class="photo"
											src="http://www.gravatar.com/avatar/b2be14fe77d541e857248adc7ef2e52f?d=mm&s=87"
											alt="littne" /> </a>

								</div-->

								<div id="prof-basic-r" class="clearfix">

									<div id="prof-info">

										<h1>

										</h1>

										<form method="post" action="/StudentPortal/EditNote"
											name="editform">
											<p>
												&nbsp;
												<font bgcolor="#b6f8f4">标题：</font> &nbsp; &nbsp;
												<input type="text" maxlength="45" name="title"
													value="${title}" />
											</p>
											<p>
												&nbsp; 内容：
											</p>
											<p>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<textarea rows="6" name="content"">${content}</textarea>
											</p>
											<p>
												&nbsp;发布者：
												<input type="text" maxlength="20" name="author"
													value="${author}" />
											</p>
											<p>
												&nbsp;上传附件：
												<br />
											</p>
											<p>
												&nbsp;
												<input type="text" maxlength="20" name="noteid"
													value="${noteid}"
													style="visibility: hidden "/>

											</p>
											<p>
												&nbsp;
												<input type="button" value="完成" name="submit"
													onclick="bconfirm()" />
											</p>
											<p>
												&nbsp;&nbsp;
											</p>
											<p>
												&nbsp;
											</p>
										</form>

										<script type="text/javascript">
function opensub() {
	document.editform.submit();
}
function bconfirm() {
	window.dialogArguments.newnote.title.value = document.editform.title.value;
	window.dialogArguments.newnote.content.value = document.editform.content.value;
	window.dialogArguments.newnote.author.value = document.editform.author.value;
	window.dialogArguments.newnote.noteid.value = document.editform.noteid.value;
	//alert(dialogArguments.newnote.title.value);
	window.dialogArguments.newnote.submit();
	window.close();
}

function bcancel() {
	window.close();
}
</script>


										<div align="left">

											<br />
										</div>


									</div>
								</div>
								&nbsp;
							</div>
							<br />
							<div align="right">


							</div>
							<div align="right">

							</div>
						</div>

					</div>

				</div>

				<div id="mn-r" class="ly-r">




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
									<input id="ct-email" type="text" class="ct-text"
										maxlength="200" />
								</div>

							</div>

							<div id="ct-pop-row-cate" class="ct-pop-row clearfix">

								<div class="ct-pop-row-l">
									分类:
								</div>

								<div class="ct-pop-row-r">

									<select id="ct-category" name="Category">
										<option value="Suggestion">
											意见和建议
										</option>
										<option value="WebError">
											网页错误
										</option>
										<option value="Others">
											其它
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
								谢谢您联系我们
							</h1>

							<p>
								您的信息我们已经收到！
								<br />
								我们将会尽快回复您。
							</p>

							<a id="ct-close"></a>

						</div>

					</div>

				</div>











				<br />
			</div>

			<div id="mn-foot" class="clearfix">



				<ul id="ft">

					<li>
						<a href="http://code.google.com/p/j2ee-2011/" target="_blank">

							关于我们</a>
					</li>


				</ul>

			</div>

		</div>

		<div id="home-contact" class="do-contact"></div>

		<div id="mn-pop"></div>



		<br />

	</body>
</html>