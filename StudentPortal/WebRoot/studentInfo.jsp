<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="model.StudentCourseFile"%>
<%@page import="model.Files"%>
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

		<title>My JSP 'studentInfo.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>

	<style type="text/css">
#filename {
	border: 1px solid #CCCCCC;
	width: 300px;
	height: 200px;
	overflow: auto;
}
</style>

	<body> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<strong>作业</strong>
		<br>
		<br><div class="filename" id="filename">
			<%
				List<Files> files = (List<Files>) request.getAttribute("files");
				for (Files file : files) {
			%>
			<a href="/StudentPortal/Download?id=<%out.print(file.getFId());%>"><%=file.getName()%></a>
			<br />
			<%
				}
			%>
		</div>
	</body>
</html>
