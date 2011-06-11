<%@ page contentType="text/html; charset=UTF-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="java.util.List"%>
<%@page import="model.CourseFile"%>
<%@page import="model.FilesDAO"%>
<%@page import="model.Files"%>
<%@page import="model.StudentCourseFile"%>
<%@page import="model.Courses"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>CourseInfo</title>

		<style type="text/css">
h4 {
	text-align: center;
	font-size: 200%;
}

h5 {
	text-align: left
}

#XiaZai {
	width: 400px;
	top: -353px;
	left: 570px;
	position: relative;
	height: auto;
	visibility: inherit;
	border-left-width: 0px;
	border-top-width: 0px;
}

#LiuYan {
	left: 85px;
	height: 300px;
	width: 500px;
	font-size: 18px;
	font-style: italic;
	padding-top: -30px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-left: 50px;
}

#Kecheng {
	height: auto;
	width: 1000px
}
</style>

	</head>

	<body>


		<div id="Kecheng">
		<% Courses course = (Courses) request.getAttribute("course"); %>
			<h2>
				<strong>
					课程名：<%=course.getName() %> (<%=course.getCourseId() %>)&nbsp; 
					教师：<%=course.getTName() %>&nbsp; <br/>&nbsp;地点 ：<%=course.getPlace() %>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 学分：<%=course.getCredit() %>&nbsp;
				</strong> 
			</h2>
		</div>

		<div id="LiuYan">
			<h4>


				<textarea name="Time" cols="60" rows="15" readonly="true">周一 13：00——15：20
周四 08：00——09：40</textarea>
			</h4>
			<h4>
				<label>
					<input type="submit" name="Pinlun" id="Pinlun" value="评论" />
				</label>
			</h4>


		</div>

		<div id="KeJian">

			<h4>
				<%
						FilesDAO filesDAO = new FilesDAO();
						List<CourseFile> courseFiles = (List<CourseFile>) request.getAttribute("courseFiles");
						for(CourseFile instance : courseFiles){
							Files file = filesDAO.findById(instance.getFId());
					 %>
				<a href="/StudentPortal/Download?id=<%out.print(file.getFId());%>"><%=file.getName()%></a>
				<%
						}
					%>
			</h4>

			<h4>
				<input type="submit" name="button" id="button" value="download" />
			</h4>
		</div>

		<div id="ZuoYe">

			<div id="XiaZai">

				<h4>
					<%
						List<StudentCourseFile> studentCourseFiles = (List<StudentCourseFile>) request.getAttribute("studentCourseFiles");
						for(StudentCourseFile instance : studentCourseFiles){
							Files file = filesDAO.findById(instance.getFId());
					 %>
					<a href="/StudentPortal/Download?id=<%out.print(file.getFId());%>"><%=file.getName()%></a>
					<%
						}
					%>
				</h4>

				<h4>
					<input type="submit" name="button" id="button" value="download" />
				</h4>
			</div>

<input name="filedir" type="hidden" value="<%=(String)session.getAttribute("userId") %>">
				<input name="courseId" type="hidden" value="<%=course.getCourseId() %>">

			<div id="ShangChuan">
				<form action="/StudentPortal/Upload?courseId=<%=course.getCourseId()%>&filedir=<%=(String)session.getAttribute("userId")%>" enctype="multipart/form-data"
					name="uploadform" method="post">
				
					<tr>
						<td width="22%" align="center" valign="top" bgcolor="#F7FAF6"
							style="padding-top: 8">
							<div
								style="background: #177B6C; width: 94%; height: 25; color: white">
								<b>注意事项：</b>
							</div>
							文件长度最大允许为50兆！
						</td>
						<td valign="top" style="padding-left: 30; padding-top: 10"
							bgcolor="white">
							文件路径1：
							<br>
								<input type="file" name="file1" size="60">
									<br>
										文件描述1：<br>
											<textarea rows="5" cols="69" name="fileinfo1"></textarea>
											<br>
												<input type="button" value="submit"
													onclick=uploadform.submit();>
													<input type="reset" value="reset">
														<br>
															<br>
						</td>
					</tr>
				</form>
			</div>
		</div>


	</body>
</html>