<%@ page contentType="text/html; charset=utf-8" %>
<!--%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.student.vo.User"%-->
<%!
long uid = 2;
int aaa=1;
%>
<%
System.out.println("======================================");
 session = request.getSession(false);
if(session!=null)
{
   /*User user= (User)session.getAttribute("userinfo");
   if(user!=null)
   {
	uid = user.getStudentUID().longValue();
	System.out.println("===========" + uid);
   }*/
}

%>
<html>
<head>
  <link rel="STYLESHEET" type="text/css" href="css/shared.css">
<title>
课程选择
</title>
<script language="javascript">
var selectedTr = null;

function setTrColor(colorTr,color)
{
 if(colorTr.tagName=="TR")
 {
  for(var i=0;i<colorTr.childNodes.length;i++)
  {
   colorTr.childNodes(i).style.backgroundColor = color;
   colorTr.childNodes(i).children(0).style.backgroundColor = color;
  }
 }
}

function saveselect()
{       var ss = document.getElementsByName("studentUID");
	alert(ss[0].value);
	document.chooseActionForm.studentUID.value =ss[0].value;
	alert(document.chooseActionForm.studentUID.value);
 	document.chooseActionForm.operation.value = "save";
	alert(document.chooseActionForm.operation.value);
	document.chooseActionForm.submit();
}
function onClickedCell()
{
 var clickedcell = event.srcElement;
 if(selectedTr!=null)
{
  setTrColor(selectedTr,"#FFFFFF");
}
 while(clickedcell.tagName!="TR")
 {
   clickedcell = clickedcell.parentElement;
 }
 selectedTr = clickedcell;
 setTrColor(selectedTr,"#FFDDFF");
}
</script>
</head>
<body bgcolor="#ffffff">
<br>
<hr height=1 />
<h2 align="center">
选课管理
</h2>
<html:form method="post" action="chooseAction.do">
<input type="hidden" name="studentUID" value=<%=uid%> />
<html:hidden name="chooseActionForm" property="studentUID" />
<html:hidden name="chooseActionForm" property="operation"/>
<table >
<tr>
<td class="tdframe">
<table class="table1">
<thead class="tdsectionbar">
<td align="center" class="tdsectionbar">选择</td>
<td align="center" class="tdsectionbar">课程名称</td>
<td align="center" class="tdsectionbar" width="200">授课教师</td>
<td align="center" class="tdsectionbar" width="200">上课地点</td>
<td align="center" class="tdsectionbar" width="200">上课时间</td>
<td align="center" class="tdsectionbar" width="200">学分</td>
</thead>
<tbody id="selectRows" onclick="onClickedCell()">
<logic:iterate  name="chooseActionForm" property="chooses" id="chooses">
<tr class="tdsectionbar">
<td class="tdbg0">
<html:checkbox indexed="true" name="chooses" property="isSelected" />
<html:hidden indexed="true" name="chooses" property="classUID" />
</td>
<td class="tdbg0">
<html:text indexed="true" name="chooses" property="className" />
</td>
<td class="tdbg0">
<html:text indexed="true" name="chooses" property="classTeacher" />
</td>
<td class="tdbg0">
<html:text indexed="true" name="chooses" property="classRoom" />
</td>
<td class="tdbg0">
<html:text indexed="true" name="chooses" property="classTime" />
</td>
<td class="tdbg0">
<html:text indexed="true" name="chooses" property="classCredit" />
</td>
<tr>
</logic:iterate>
</tbody>
</table>
</td>
</tr>
<tr>
<td align="center">
<input type="button" value="保存" class="button" onclick="saveselect();" />
</td>
</tr>
</table>
<br><br>

</html:form>
</body>
</html>
