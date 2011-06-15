<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
function gotoSelectedPage()
{
	var x = document.getElementById("navigatorForm");
	//alert("Original action: " + x.action)
	//alert(x.pageNumber);
	x.submit();
}
</script>
<form action="/StudentPortal/Paging" method="get" id="navigatorForm">
	<a href="/StudentPortal/Paging?pageNumber=1">首页</a> 
	<c:if test="${pageNumber>1}">
		<a href="/StudentPortal/Paging?pageNumber=${pageNumber - 1}">上一页</a>
	</c:if> 
	跳转到第 <select name="pageNumber" onchange="gotoSelectedPage();">
	<c:forEach begin="1" end="${noteli.pages}" step="1" var="pageIndex">
		<c:choose>
			<c:when test="${pageIndex eq pageNumber}">
				<option value="${pageIndex}" selected="selected">${pageIndex}</option>
			</c:when>
			<c:otherwise>
				<option value="${pageIndex}">${pageIndex}</option>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</select>页 
	<c:if test="${pageNumber<noteli.pages}">
		<a href="/StudentPortal/Paging?pageNumber=${pageNumber+1}">下一页</a>
	</c:if> 
	<a href="/StudentPortal/Paging?pageNumber=${noteli.pages}">末页</a>
</form>

