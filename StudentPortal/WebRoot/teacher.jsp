<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control",
			"no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
%>
<%
	if (session.getAttribute("user") == null) {

		response.sendRedirect("outofsession.html");
		//out.print("<script>window.location.href='insession.html';</script>");
		return;
	}
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@page import="model.Notify" import="model.NotifyDAO"%>
<%@page import="model.Courses" import="com.tongji.j2ee.sp.NotifyList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>教师主页</title>

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

ul#notes {
	list-style-type: square;
	margin: 0;
	padding: 0;
	list-style: disc outside none;
	line-height: 1.2;
}

ul#notes li {
	display: block;
	float: left;
	font-size: 15px;
	height: 20px;
	left: 0;
	line-height: 1.4;
	list-style-type: none;
	margin: 0 0 0 22px;
	padding: 0;
	position: relative;
	top: 0;
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
								id="nav-prof-logout" title="退出" href="/StudentPortal/logout"><img
									src="imgs/exit.png" /> </a>


						</div>

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
											class="photo" src="imgs/face.png" alt="littne" /> </a>

								</div>

								<div id="prof-basic-r" class="clearfix">

									<div id="prof-info">

										<h1>
											<!--span id="prof-name">littne</span-->
											<jsp:useBean id="user" scope="session"
												class="model.Teacherinfo"></jsp:useBean>
										</h1>

										<div id="prof-desc">

											<div>
												<span id="prof-title" style="display: none">Shanghai,
													CN</span>



												<span id="prof-info-spl"></span>

												<br>
												<table width="402" border="0" bgcolor="#fafeff"
													align="center" height="89">
													<tbody>
														<tr>
															<td width="%20">
																&nbsp;<%=user.getTId()%>
															</td>
															<td>
																&nbsp;<%=user.getName()%>
															</td>
															<td>
																<%=user.getTitle()%>
															</td>
														</tr>
														<tr>
															<td>
																&nbsp;<%
																	String s = user.getBirthday().toString();
																	s = s.substring(0, s.indexOf(' '));
																	out.print(s);
																%>
															</td>
															<td>
																&nbsp;<%=user.getNation()%></td>
															<td>
																&nbsp;<%=user.getSex()%>
															</td>
														</tr>
														<tr>
															<td>
																&nbsp;<%=user.getEmail()%>
															</td>
															<td>
																&nbsp;<%
																	String n = user.getPhoneNumber();
																	if (n != null) {
																		out.print(n);
																	}
																%>
															</td>
														</tr>

													</tbody>
												</table>

												&nbsp;&nbsp;
												<br />

												<a id="editinfoa" href="modifytea.jsp" target="_blank"
													onmouseover="javascript:this.style.backgroundColor='#efeed9'"
													onmouseout="javascript:this.style.backgroundColor='#fafeff'">编辑个人信息</a>
												<br>
											</div>
										</div>

									</div>



								</div>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<br>
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
												&nbsp;

												<br />
												&nbsp; 当前通知 |
												<br />


												<ul id="notes">
													<%
														//int currentPage = Integer.valueOf((String) request
														//		.getAttribute("pageno"));
														//NotifyDAO notifyDAO = new NotifyDAO();
														//List lns = notifyDAO.findAll();
														//List ln = lns.subList(currentPage, currentPage + 12);
														NotifyList lns = (NotifyList) session.getAttribute("noteli");
														System.out.println("teachers:" + lns.allItems);
														List ln = lns.getCurrentList(((Integer) request
																.getAttribute("pageNumber")).intValue());

														out
																.println("<table id=\"tnotes\" width=\"100%\"><thead><tr align=\"center\">"
																		+ "<td width=\"20%\">发布时间</td>"
																		+ "<td width=\"60%\">通知标题</td></tr></thead><tbody>");
														for (int i = 0; i != ln.size(); ++i) {
															Notify temp = (Notify) ln.get(i);
															String date = temp.getDatetime().toString();

															//out.println("<li><a href=\"/StudentPortal/html/"
															//		+ temp.getNid() + ".html\"target=\"_blank\">"
															//		+ temp.getTitle() + "</a></li>");
															if ((i % 2) == 1) {
																out.println("<tr align=\"center\">");
															} else {
																out.println("<tr align=\"center\" bgcolor=\"#00f2a0\">");
															}
															out.println("<td>" + date.substring(0, date.indexOf(' '))
																	+ "</td><td><a href=\"/StudentPortal/html/"
																	+ temp.getNid() + ".html\"target=\"_blank\">"
																	+ temp.getTitle() + "</a></td></tr>");

														}
														out.println("</tbody></table>");
													%>
												</ul>
												<br />
												<jsp:include page="paging_footer.jsp"></jsp:include>
											</div>
										</li>
										<li id="tab2">
											<h3>
												<a href="####" onclick="javascript:toggleTo(2)">课程表</a>
											</h3>
											<%
												ArrayList<Courses> courseSchedule = (ArrayList<Courses>) request
														.getAttribute("schedule");
											%>
											<div id="oDIV2" style="display: none;">
												<br />
												<table height="90%" width="90%" border="1" bgcolor="#80ffff"
													align="center">
													<tbody>
														<tr class="tablerow" id="row1">
															<td>
																&nbsp;
															</td>
															<td align="center">
																星期一&nbsp;
															</td>
															<td align="center">
																星期二&nbsp;
															</td>
															<td align="center">
																星期三&nbsp;
															</td>
															<td align="center">
																星期四&nbsp;
															</td>
															<td align="center">
																星期五&nbsp;
															</td>
															<td align="center">
																星期六&nbsp;
															</td>
															<td align="center">
																星期日&nbsp;
															</td>
														</tr>
														<tr class="tablerow" id="row2">
															<td align="center">
																1,2&nbsp;
															</td>
															<td id="1">
																<%=courseSchedule.get(0).getName()%>
																&nbsp;
															</td>
															<td id="6"><%=courseSchedule.get(5).getName()%>
																&nbsp;
															</td>
															<td id="11"><%=courseSchedule.get(10).getName()%>
																&nbsp;
															</td>
															<td id="16"><%=courseSchedule.get(15).getName()%>
																&nbsp;
															</td>
															<td id="21"><%=courseSchedule.get(20).getName()%>
																&nbsp;
															</td>
															<td id="26"><%=courseSchedule.get(25).getName()%>
																&nbsp;
															</td>
															<td id="31"><%=courseSchedule.get(30).getName()%>
																&nbsp;
															</td>
														</tr>
														<tr class="tablerow" id="row3">
															<td align="center">
																3,4&nbsp;
															</td>
															<td id="2"><%=courseSchedule.get(1).getName()%>
																&nbsp;
															</td>
															<td id="7"><%=courseSchedule.get(6).getName()%>
																&nbsp;
															</td>
															<td id="12"><%=courseSchedule.get(11).getName()%>
																&nbsp;
															</td>
															<td id="17"><%=courseSchedule.get(16).getName()%>
																&nbsp;
															</td>
															<td id="22"><%=courseSchedule.get(21).getName()%>
																&nbsp;
															</td>
															<td id="27"><%=courseSchedule.get(26).getName()%>
																&nbsp;
															</td>
															<td id="32"><%=courseSchedule.get(31).getName()%>
																&nbsp;
															</td>
														</tr>
														<tr class="tablerow" id="row4">
															<td align="center">
																5,6&nbsp;
															</td>
															<td id="3"><%=courseSchedule.get(2).getName()%>
																&nbsp;
															</td>
															<td id="8"><%=courseSchedule.get(7).getName()%>
																&nbsp;
															</td>
															<td id="13"><%=courseSchedule.get(12).getName()%>
																&nbsp;
															</td>
															<td id="18"><%=courseSchedule.get(17).getName()%>
																&nbsp;
															</td>
															<td id="23"><%=courseSchedule.get(22).getName()%>
																&nbsp;
															</td>
															<td id="28"><%=courseSchedule.get(27).getName()%>
																&nbsp;
															</td>
															<td id="33"><%=courseSchedule.get(32).getName()%>
																&nbsp;
															</td>
														</tr>
														<tr class="tablerow" id="row5">
															<td align="center">
																7,8&nbsp;
															</td>
															<td id="4"><%=courseSchedule.get(3).getName()%>
																&nbsp;
															</td>
															<td id="9"><%=courseSchedule.get(8).getName()%>
																&nbsp;
															</td>
															<td id="14"><%=courseSchedule.get(13).getName()%>
																&nbsp;
															</td>
															<td id="19"><%=courseSchedule.get(18).getName()%>
																&nbsp;
															</td>
															<td id="24"><%=courseSchedule.get(23).getName()%>
																&nbsp;
															</td>
															<td id="29"><%=courseSchedule.get(28).getName()%>
																&nbsp;
															</td>
															<td id="34"><%=courseSchedule.get(33).getName()%>
																&nbsp;
															</td>
														</tr>
														<tr class="tablerow" id="row6">
															<td align="center">
																9,10&nbsp;
															</td>
															<td id="5"><%=courseSchedule.get(4).getName()%>
																&nbsp;
															</td>
															<td id="10"><%=courseSchedule.get(9).getName()%>
																&nbsp;
															</td>
															<td id="15"><%=courseSchedule.get(14).getName()%>
																&nbsp;
															</td>
															<td id="20"><%=courseSchedule.get(19).getName()%>
																&nbsp;
															</td>
															<td id="25"><%=courseSchedule.get(24).getName()%>
																&nbsp;
															</td>
															<td id="30"><%=courseSchedule.get(29).getName()%>
																&nbsp;
															</td>
															<td id="35"><%=courseSchedule.get(34).getName()%>
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
												<br />
												<%
													List myCourses = (List) request.getAttribute("myCourses");
													for (int i = 0; i < myCourses.size(); i++) {
														Courses temp = (Courses) myCourses.get(i);
												%>
												<a
													href="/StudentPortal/CourseInfo1?id=<%out.print(temp.getCourseId());%>"
													target="_blank"> <%=temp.getName()%> </a>
												<%
													}
												%>
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
