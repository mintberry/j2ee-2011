<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'file.jsp' starting page</title>
    
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
  		<%
  			Files file = (Files) request.getAttribute("file");
  		%>
  		<font face="隶书" size="4"><strong><%=file.getName()%></strong></font>
  		<br/>
			<textarea readonly name="grade" style="height: 150px; width: 270px; overflow: auto">
				<%
					if(file != null){
				 %>
  						<%=file.getDescription()%>
  				<%
  					}
  				 %>
  			</textarea>
  			<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
		
		<form action="/StudentPortal/Download?id=<%=file.getFId()%>" method="post"> 
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
			<input type="submit" value="下载">
		</form>
	</body>
</html>