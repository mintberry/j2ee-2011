<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		<title>CourseList</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<br />
		<%
			List myCourses = (List) session.getAttribute("myCourses");
			for (int i = 0; i < myCourses.size(); i++) {
				Courses temp = (Courses) myCourses.get(i);
		%>
		<a
			href="/StudentPortal/CourseInfo?id=<%out.print(temp.getCourseId());%>"><%=temp.getName()%></a>
		<%
			}
		%>
	</body>
</html>
