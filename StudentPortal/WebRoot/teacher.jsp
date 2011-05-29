<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>GuruDigger</title>

		<meta http-equiv="content-type" content="text/html;charset=utf-8" />

		<meta name="description" content="用户主页" />

		<meta name="keywords" content="Gurudigger" />

		<link href="imgs/c1.jpg" rel="shortcut icon" type="image/x-icon" />

		<link href="css/core.css" rel="stylesheet" type="text/css" />

		<%--script src="http://res.gurudigger.com/js/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="http://res.gurudigger.com/jsware.package.js" type="text/javascript"></script--%>





		<link href="css/main.css" rel="stylesheet" type="text/css" />

		<link
			href="http://res.gurudigger.com/globalization/zh-cn/css/main.css"
			rel="stylesheet" type="text/css" />

		<!--[if IE ]><link href="http://res.gurudigger.com/css/ie.css" rel="stylesheet" type="text/css"/><![endif]-->

		<!--[if IE 8 ]><link href="http://res.gurudigger.com/css/ie8.css" rel="stylesheet" type="text/css"/><![endif]-->



		<!--link href="http://res.gurudigger.com/css/layout.right.css"
			rel="stylesheet" type="text/css" /-->

		<script src="http://res.gurudigger.com/js/main.js"
			type="text/javascript">
</script>



		<!--link href="http://res.gurudigger.com/css/profile.css"
			rel="stylesheet" type="text/css" /-->

		<!--link href="http://res.gurudigger.com/css/box.css" rel="stylesheet"
			type="text/css" /-->

		<script src="http://res.gurudigger.com/js/jquery.form.js"
			type="text/javascript">
</script>

		<style type="text/css" media="all">
/*TAB布局*/
#tab * {
	font-size: 12px;
}

#tab h3 a {
	display: inline-block;
}

#tab h3 a {
	display: block;
}

#tab {
	position: relative;
}

#tab h3,#tab ul,#tab div,#tab li {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#tab ul li {
	position: absolute;
	left: 0;
	top: 0;
	float: left;
	display: block;
	width: 100px;
	height: 30px;
	font-size: 0;
}

#tab ul li#tab2 {
	left: 100px;
}

#tab ul li#tab3 {
	left: 200px;
}

#tab ul li#tab4 {
	left: 300px;
}

#tab ul li div {
	position: absolute;
	clear: both;
}

#tab ul li div#oDIV2 {
	left: -100px;
}

#tab ul li div#oDIV3 {
	left: -200px;
}

#tab ul li div#oDIV4 {
	left: -300px;
}

/*TAB-标题修饰*/
#tab,#tab ul li div,#tab ul li div li {
	width: 945px;
}  /* 设置总宽度[width] */
#tab {
	height: 400px;
	background: #ccc;
	overflow: hidden;
}  /* 设置总高度[height]、标题背景颜色[background] */
#tab ul li h3 a {
	height: 20px;
	padding: 5px 0 2px;
	margin: 5px 0px 0px 5px;
	text-align: center;
	border: solid #ccc 1px;
	border-bottom: none;
	color: #333;
}  /* 标题默认状态 */
#tab ul li h3 a:hover {
	background-color: #ddd;
	border-color: #fff;
}  /* 鼠标经过状态 */
#tab ul li.up h3 a {
	background: #999;
	border-color: #fff #999 #999 #fff;
	color: #fff;
}  /* 当前窗口状态 */
#tab ul li div {
	border: solid #999;
	border-width: 1px 0;
	background: #f7f7f7;
	height: 367px;
}  /* 设置内容高度[height]、背景颜色[background]、上下分割线[border] */ /*TAB1效果[ol/li]*/
#tab ul li #oDIV1 ol {
	margin: 8px;
	padding: 0;
}

#tab ul li #oDIV1 ol li {
	position: static;
	float: none;
	font-size: 0;
	height: auto;
}

#tab ul li #oDIV1 ol li a {
	font-size: 12px;
	display: block;
	padding: 5px 0 1px;
}

/*TAB2效果[img]*/
#tab ul li #oDIV2 img {
	margin: 8px;
	border: none;
}

/*TAB3效果[iframe]*/
#tab ul li #oDIV3 iframe {
	border: none;
	width: 440px;
	height: 157px;
	margin: 5px;
}
</style>

		<script type="text/javascript">
<!--
function toggleTo(img)
{
var ts=document.getElementById("tab").getElementsByTagName("div");
for(i=1;i<ts.length+1;i++){
if(img==i)
{
document.getElementById("oDIV"+i).style.display = "";
document.getElementById("oDIV"+i).parentNode.className+=" up";
}
else{
document.getElementById("oDIV"+i).style.display = "none";
document.getElementById("oDIV"+i).parentNode.className="tab"+i;
}
}
}
-->
</script>


	</head>



	<body>



		<div id="holder"></div>

		<div id="mn">

			<div id="mn-head" class="clearfix">

				<div id="hd" class="clearfix">

					<div id="hd-l">

						<a id="hd-logo" href="/activity"> <img id="hd-logo-img"
								src="imgs/sse.png" title="GuruDigger" alt="GuruDigger" /> </a>

					</div>

					<div id="hd-r">
						&nbsp;

						<br>
						<div id="nav-prof">

							<a class="nav-prof-itm" id="nav-prof-setting" href="/settings"
								title="设置"><img src="imgs/setting.png"
									style="left: 2px; width: 16px;" /> </a><a class="nav-prof-itm"
								id="nav-prof-logout" title="退出" href="/logout"><img
									src="imgs/exit.png" /> </a>



						</div>

					</div>

				</div>

				<div id="nav-bar">

					<ul id="nav-lst" class="nav-lst">

						<li class="nav-itm nav-curr ">

							<br>
						</li>

						<li class="nav-itm ">

							<br>
						</li>

						<li class="nav-itm ">

							<br>
						</li>

						<li class="nav-itm ">


							<br>
						</li>
					</ul>

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

					<br>

					<div id="nav-search">



					</div>





					<div id="nav-bd-l">

					</div>
					<br>

					<div id="nav-bd-r">

					</div>

					<br>
				</div>

			</div>

			<div id="mn-body" class="clearfix">



				<div id="mn-c" class="ly-m">

					<div id="mn-c-inner" class="ly-m-inner">



						<div id="prof-pnl" class="mn-c-pnl">





							<br>



							<div id="prof-basic" class="block clearfix bd-round-blue-light">

								<div id="prof-basic-l">

									<a href="/profile?uid=24660"><img id="prof-photo"
											class="photo"
											src="http://www.gravatar.com/avatar/b2be14fe77d541e857248adc7ef2e52f?d=mm&s=87"
											alt="littne" /> </a>

								</div>

								<div id="prof-basic-r" class="clearfix">

									<div id="prof-info">

										<h1>
											<span id="prof-name">littne</span>
										</h1>

										<div id="prof-desc">

											<div>



												<span id="prof-title">Shanghai, CN</span>



												<span id="prof-info-spl">|</span>



												<a id="prof-blog" href="http://littne.wordpress.com"
													target="_blank">littne.wordpress.com</a>



											</div>

											<div id="latest-status" class="clearfix">



											</div>

										</div>

									</div>



								</div>







								&nbsp;



							</div>

							<br>



							<div id="prof-pnl-act" class="bd-round-blue-light">



								<!--div class="pnl-head clearfix" id="tab-bar">

									<h3 class="pnl-caption">
										你想说：
									</h3>

								</div>



								<div class="pnl-content" id="tab-content">



									<div id="prof-status" class="clearfix"></div>



									<div id="activity"></div>
									
									

								</div-->
								<div id="tab">
									<ul>
										<li id="tab1" class="up">
											<h3>
												<a href="####" onclick="javascript:toggleTo(1)">主页</a>
											</h3>
											<!-- onclick鼠标释放，onmousemove鼠标经过。 -->
											<div id="oDIV1">
												<ol>
													<li>
														<a href="http://www.ijavascript.cn"><span>使该元素在FireFox下获得高度从而显示背景</span>
														</a>
													</li>
													<li>
														<a href="http://www.ijavascript.cn"><span>为了保证浏览器的兼容性</span>
														</a>
													</li>
													<li>
														<a href="http://www.ijavascript.cn"><span>文本对齐方式改回默认left</span>
														</a>
													</li>
													<li>
														<a href="http://www.ijavascript.cn"><span>左右自适应[FireFox居中方式]</span>
														</a>
													</li>
													<li>
														<a href="http://www.ijavascript.cn"><span>内容对齐方式为居中[IE居中方式]</span>
														</a>
													</li>
													<li>
														<a href="http://www.ijavascript.cn"><span>内容对齐方式为居中[IE居中方式]</span>
														</a>
													</li>
												</ol>
											</div>
										</li>
										<li id="tab2">
											<h3>
												<a href="####" onclick="javascript:toggleTo(2)">课程表</a>
											</h3>
											<div id="oDIV2" style="display: none;">
											<br/>
												<table height="90%" width="90%" border="1"
													bgcolor="#80ffff" align="center">
													<tbody>
														<tr>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
														<tr>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
															<td>
																&nbsp;
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</li>
										<li id="tab3">
											<h3>
												<a href="####" onclick="javascript:toggleTo(3)">课程管理</a>
											</h3>
											<div id="oDIV3" style="display: none;">
											<br/>
												
											</div>
										</li>
										<li id="tab4">
											<h3>
												<a href="####" onclick="javascript:toggleTo(4)">备用</a>
											</h3>
											<div id="oDIV4" style="display: none;">
												<a href="http://www.ijavascript.cn">JavaScript教程网</a>
											</div>
										</li>
									</ul>
								</div>

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











				<br>
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



		<br>

	</body>


</html>
