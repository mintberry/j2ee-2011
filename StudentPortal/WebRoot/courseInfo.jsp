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
	font-size: 100%;
}

h5 {
	text-align: left
}

#KeJian {
	width: 400px;
	top:-318px;
	left: 450px;
	position: relative;
	height: 150px;
	visibility: inherit;
	border-left-width: 0px;
	border-top-width: 0px;
	border:4px solid #1e90ff;
}

#ZuoYe {
	width: 400px;
	top: -300px;
	left: 450px;
	position: relative;
	height: 400px;
	visibility: inherit;
	border-left-width: 0px;
	border-top-width: 0px;
	border:4px solid #1e90ff;
}

#LiuYan {
	left: 85px;
	height: 300px;
	width: 300px;
	font-size: 18px;
	font-style: italic;
	
	padding-right: 50px;
	padding-bottom: 10px;
	padding-left: 50px;
	border:4px solid #1e90ff;
}

#Kecheng {
	height: auto;
	width: 1000px
}

#title{
	height:100px;
	width:800px;
	font-size:30px;
	font-family:"隶书";
}

#filename{
	border:1px solid #CCCCCC;
	width:300px;
	height:100px;
	overflow:auto;
}

</style>

	</head>

	<body>


		<div id="Kecheng">
		<% Courses course = (Courses) request.getAttribute("course"); %>
		<table class="title" id="title">
		<tr>	
					<td width="500px" height="20px">
				
					课程名：<%=course.getName() %> (<%=course.getCourseId() %>)
					</td>
					<td width="300px" height="20px">
					教师：<%=course.getTName() %> 
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
			<strong><font size="5">留言</font></strong>
			<h4>
				<textarea name="Time" cols="35" rows="15" readonly="true">周一 13：00——15：20
周四 08：00——09：40</textarea>
			</h4>
			<h4>
				<label>
					<input type="submit" name="Pinlun" id="Pinlun" value="评论" />
				</label>
			</h4>


		</div>

		<div id="KeJian">
			<font face="方正姚体"><strong><font size="5">课件</font></strong></font>
				<div class="filename" id="filename">
				<%
						FilesDAO filesDAO = new FilesDAO();
						List<CourseFile> courseFiles = (List<CourseFile>) request.getAttribute("courseFiles");
						for(CourseFile instance : courseFiles){
							Files file = filesDAO.findById(instance.getFId());
				%>
					<a href="/StudentPortal/Download?id=<%out.print(file.getFId());%>"><%=file.getName()%></a>
					<br/>
				<%
						}
				%>
				</div>
				<!-- <input type="submit" name="button" id="button" value="download" /> -->
		</div>
		<br/>
		<div id="ZuoYe">
			<font face="方正姚体"><strong><font size="5">作业</font></strong></font>
			<div id="XiaZai">
					<div class="filename" id="filename">
					<%
						List<StudentCourseFile> studentCourseFiles = (List<StudentCourseFile>) request.getAttribute("studentCourseFiles");
						for(StudentCourseFile instance : studentCourseFiles){
							Files file = filesDAO.findById(instance.getFId());
					 %>
						<a href="/StudentPortal/Download?id=<%out.print(file.getFId());%>"><%=file.getName()%></a>
						<br/>
					<%
						}
					%>
					</div>

					<!-- <input type="submit" name="button" id="button" value="download" /> -->
			</div>
			
			<br/>
			
			<div id="ShangChuan">
				<form action="/StudentPortal/Upload?courseId=<%=course.getCourseId()%>&filedir=<%=(String)session.getAttribute("userId")%>" enctype="multipart/form-data"
					name="uploadform" method="post">
				
					<tr>
						<td width="22%" align="center" valign="top" bgcolor="#F7FAF6"
							style="padding-top: 8">
							<div
								style="background: #177B6C; width: 100%; height: 25; color: white">
								<b>注意事项：</b>
							</div>
							文件长度最大允许为50兆！
						</td>
						<td valign="top" style="padding-left: 30; padding-top: 10"
							bgcolor="white">
							文件路径1：
							<br>
								<input type="file" name="file1" size="40">
									<br>
										文件描述1：<br>
											<textarea rows="5" cols="40" name="fileinfo1"></textarea>
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