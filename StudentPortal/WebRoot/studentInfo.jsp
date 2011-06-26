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
	width: 300px;
	height: 200px;
	overflow: auto;
}
</style>

<script type="text/javascript">
function select{
}
	var selectItem = filelist.value;
	var selectValue = filelist.options[selectItem].value;
</script>

	<body><hr width="100%" size="2"> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<strong>作业</strong>
		<br>
		<br>
		<%String fileId = (String) request.getAttribute("fileId"); %>
		<form action="/StudentPortal/EditGrade">
			<select name="filelist" size="15">
				<%
					List<Files> files = (List<Files>) request.getAttribute("files");
					for (int i=0;i<files.size();i++) {
						Files file = files.get(i);
				%>
				<option value=<%=i%>"><%=file.getName()%></option>
				<br />
				<%
					}
				%>
			</select>
		</form>

		<form action="/StudentPortal/EditGrade?fileId=<%=fileId%>" method="post">
			<textarea name="grade">
				<%=files.get(1).getDescription()%>
			</textarea>
			<br/>
		</form>
		
	</body>
</html>
