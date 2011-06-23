<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="model.CourseFile"%>
<%@page import="model.FilesDAO"%>
<%@page import="model.Files"%>
<%@page import="model.StudentCourseFile"%>
<%@page import="model.Studentinfo"%>
<%@page import="model.Courses"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'courseList1.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

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

h4 {
	text-align: center;
	font-size: 100%;
}

h5 {
	text-align: left
}

#ZuoYe {
	width: 302px;
	top: -387px;
	left: 450px;
	position: relative;
	height: 230px;
	visibility: inherit;
	border-left-width: 0px;
	border-top-width: 0px;
	border: 4px solid #1e90ff;
	margin-left:-80;
}

#LiuYan {
	left: 85px;
	height: 350px;
	width: 300px;
	font-size: 18px;
	font-style: italic;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-left: 50px;
	border: 4px solid #1e90ff;
	margin-left:-80;
}

#Kecheng {
	height: auto;
	width: 1000px
}

#title {
	height: 100px;
	width: 800px;
	font-size: 30px;
	font-family: "隶书";
	margin-left:-80;
}

#filename {
	border: 1px solid #CCCCCC;
	width: 300px;
	height: 100px;
	overflow: auto;
}
</style>
	<body>
		<body>
			<div id="holder"></div>

			<div id="mn">

				<div id="mn-head" class="clearfix">

					<div id="hd" class="clearfix">

						<div id="hd-l">

							<a id="hd-logo" href="http://sse.tongji.edu.cn"> <img
									id="hd-logo-img" src="imgs/sse.png" title="Tongji"
									alt="Tongji" /> </a>

						</div>

						<div id="hd-r">
							&nbsp;

							<br>

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



							<div id="prof-pnl" class="mn-c-pnl" align="center">



								<div id="prof-basic" class="block clearfix bd-round-blue-light">


									<div id="prof-basic-r" class="clearfix">

										<div id="prof-info">
											<div id="Kecheng">
												<% Courses course = (Courses) request.getAttribute("course"); %>
												<% List<Studentinfo> studentinfoList = (List<Studentinfo>) request.getAttribute("studentinfoList"); %>
												<table class="title" id="title">
													<tr>
														<td width="500px" height="20px">

															课程名：<%=course.getName() %>
															(<%=course.getCourseId() %>)
														</td>
														<td width="300px" height="20px">
															学生人数：<%=studentinfoList.size() %>
														</td>
													</tr>
													<tr>
														<td width="500px" height="20px">
															地点 ：<%=course.getPlace() %>
														</td>
														<td width="300px" height="20px">
															学分：<%=course.getCredit() %>
														</td>
													</tr>
												</table>
											</div>

											<div id="LiuYan">
												<div align="center">
													<br />
													<strong><font size="5">留言</font> </strong>
												</div>
												<strong> </strong>
												<br />

												<form method="post"
													action="/StudentPortal/StudentMessage
														?to=<%out.print(course.getTId());%>
														&course=<%out.print(course.getName());%>"
													target="_blank">
													主题
													<input type="text" size=40 name="subject">

													<br />
													<br />

													内容
													<br />
													<textarea
														style="height: 150px; width: 270px; overflow: auto"
														name="content">
				 </textarea>

													<br />
													<br />

													<div align="center">
														<label>
															<input type="submit" name="Pinlun" id="Pinlun" value="评论" />
														</label>
													</div>
												</form>

											</div>

											
											<br />
											<div id="ZuoYe">
												<font face="方正姚体"><strong><font size="5">课件</font>
												</strong> </font>
												<div id="XiaZai">
													<div class="filename" id="filename">
				<%
						FilesDAO filesDAO = new FilesDAO();
						List<CourseFile> courseFiles = (List<CourseFile>) request.getAttribute("courseFiles");
						for(CourseFile instance : courseFiles){
							Files file = filesDAO.findById(instance.getFId());
				%>
													<a
														href="/StudentPortal/Download?id=<%out.print(file.getFId());%>"><%=file.getName()%></a>
													<br />
													<%
						}
				%>
													</div>

													<!-- <input type="submit" name="button" id="button" value="download" /> -->
												</div>

												<br />

												<div id="ShangChuan">
													<form
														action="/StudentPortal/Upload1?courseId=<%=course.getCourseId()%>"
														enctype="multipart/form-data" name="uploadform"
														method="post">

														<tr>
															<td valign="top"
																style="padding-left: 30; padding-top: 10"
																bgcolor="white">
																文件路径：
																<br>
																<input type="file" name="file1" size="40">
																<br>
																<br/>
																<div align="center"><input type="submit" value="上传"> 
																<br></div>
																<br>
															</td>
														</tr>
													</form>
												</div>
											</div>



											<div align="left">

												<br>
											</div>


										</div>
									</div>
									&nbsp;
								</div>
								<br>
								<div align="right">
									###author###
									<br>
								</div>
								<div align="right">
									###time###
									<br>
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
										<input id="ct-name" type="text" class="ct-text"
											maxlength="200" />
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
	</body>
</html>
