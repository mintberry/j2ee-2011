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

		<meta name="description" content="Gurudigger 是一个专门为靠谱的Web工程师搭建的平台。" />

		<meta name="keywords" content="Gurudigger" />

		<link href="imgs/c1.jpg" rel="shortcut icon" type="image/x-icon" />

		<link href="http://res.gurudigger.com/css/core.css" rel="stylesheet"
			type="text/css" />

		<%--script src="http://res.gurudigger.com/js/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="http://res.gurudigger.com/jsware.package.js" type="text/javascript"></script--%>





		<link href="http://res.gurudigger.com/css/main.css" rel="stylesheet"
			type="text/css" />

		<link
			href="http://res.gurudigger.com/globalization/zh-cn/css/main.css"
			rel="stylesheet" type="text/css" />

		<!--[if IE ]><link href="http://res.gurudigger.com/css/ie.css" rel="stylesheet" type="text/css"/><![endif]-->

		<!--[if IE 8 ]><link href="http://res.gurudigger.com/css/ie8.css" rel="stylesheet" type="text/css"/><![endif]-->



		<link href="http://res.gurudigger.com/css/layout.right.css"
			rel="stylesheet" type="text/css" />

		<script src="http://res.gurudigger.com/js/main.js"
			type="text/javascript">
</script>



		<link href="http://res.gurudigger.com/css/profile.css"
			rel="stylesheet" type="text/css" />

		<link href="http://res.gurudigger.com/css/box.css" rel="stylesheet"
			type="text/css" />

		<script src="http://res.gurudigger.com/js/jquery.form.js"
			type="text/javascript">
</script>





		<script type="text/javascript">

CF.Package.Configuration.Assets = "http://res.gurudigger.com";

CF.Package.Configuration.Host = "http://gurudigger.com";

var False = false;

var True = true;

var ProfileCurrentModel = {

	UserID : 24660,

	UserName : "littne"

};
</script>





	</head>



	<body>



		<div id="holder"></div>

		<div id="mn">

			<div id="mn-head" class="clearfix">

				<div id="hd" class="clearfix">

					<div id="hd-l">

						<a id="hd-logo" href="/activity"> <img id="hd-logo-img"
								src="imgs/sse.png" title="GuruDigger" alt="GuruDigger" />
						</a>

					</div>

					<div id="hd-r">

						<div id="nav-prof"
							style="left: 927px; width: 75px; top: 68px; height: 24px;">

							</a><a class="nav-prof-itm" id="nav-prof-setting" href="/settings"
								title="设置"></a><a class="nav-prof-itm" id="nav-prof-logout"
								title="登出" href="/logout"></a>



						</div>

					</div>

				</div>

				<div id="nav-bar">

					<ul id="nav-lst" class="nav-lst">

						<li class="nav-itm nav-curr ">
							
						<br></li>

						<li class="nav-itm ">
							
						<br></li>

						<li class="nav-itm ">
							
						<br></li>

						<li class="nav-itm ">
							

						<br></li>

						<li><br></li>

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

					</div><br>

					<div id="nav-bd-r">

					</div>

				<br></div>

				<script type="text/javascript">
CF.Package.Include("Favourite", true, "zh-CN");</script>

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
											alt="littne" />
									</a>

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



								<div class="pnl-head clearfix">

									<h3 class="pnl-caption">
										你想说：
									</h3>

								</div>



								<div class="pnl-content">



									<div id="prof-status" class="clearfix"></div>



									<div id="activity"></div>

								</div>

							</div>

						</div>



						<script type="text/javascript">

var DashboardInfo = {

	UpdateStatusSuccess : "",

	UpdateStatusAndAnsySuccess : "",

	TwitterNotBindYet : "",

	BuzzUnderConstruction : ""

};

var ActivityBasicModel = {

	UserID : 24660,

	UserName : "littne",

	IsSelf : True

};

var BindsModel = {
	Buzz : false,
	BuzzScreenName : "Buzz",
	Twitter : false,
	TwitterScreenName : ""
};
</script>

						<script type="text/javascript">
CF.Package.Include("Activity", true, "zh-CN");</script>



					</div>

				</div>

				<div id="mn-r" class="ly-r">







					<div id="prof-right" class="mn-r-pnl bd-round-blue-light">

						<div class="prof-block">

							<div id="slide-caption" class="fn-title clearfix">



							</div>

							<div id="slide-content" class="clearfix">

								<div id="slide-content-inner" class="clearfix">

									<div id="prof-project" class="slide-block clearfix">



										<p id="no-project" class="no-info">
											我们没有收集到你的任何项目。
											<br />
											<a href="/settings">点击这里</a> 给我们更多信息。
										</p>



									</div>



									<div id="prof-following" class="slide-block clearfix">



										<p id="no-following" class="no-info">
											你还没有关注任何人。
											<br />
											<a href="/people">点击这里</a>开始挖掘牛人。
										</p>



									</div>

									<div id="prof-follower" class="slide-block clearfix">



										<p id="no-follower" class="no-info">
											还没有人关注你
										</p>



									</div>



								</div>

							</div>

							<script type="text/javascript">

$(function() {

	$(".slide-title").click(function() {

		var i = $(this).index();

		$(".slide-curr").removeClass("slide-curr");

		$(this).addClass("slide-curr");

		var left = -275 * i;

		$("#slide-content-inner").animate( {
			left : left + "px"
		}, 200);

	});

})
</script>

						</div>



						<div class="prof-block">

							<h3 class="prof-block-title">
								地图
							</h3>

							<div class="prof-block-content">

								<div id="map-canvas-wrapper">

									<div id="map-canvas">



									</div>

								</div>

							</div>&nbsp; 

							

							<br>



						</div>



					</div>



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





				



				

			<br></div>

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
