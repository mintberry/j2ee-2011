<%@ page contentType="text/html;charset=UTF-8"%>
<% String contextPath=request.getContextPath(); %>
<link type="text/css" rel="stylesheet" href="<%=contextPath%>/css/style.css">
<body>
<center>
<table border="0" width="80%" cellspacing="1" cellpadding="5" bgcolor="#999999" style="word-break:break-all;margin-top:100">
	<tr class="listhead" height="25"></tr>
	<tr bgcolor="#F5F5F5"><td>${requestScope.message}</td></tr>
</table>
</center>
</body>