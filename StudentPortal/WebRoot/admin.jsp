
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control",
			"no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="model.Courses" import="com.tongji.j2ee.sp.NotifyList" import="model.Studentinfo" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
	Object obj = session.getAttribute("user");
	if (obj == null)
		out.print("<script>window.location.href='index.jsp';</script>");//strange here
%>
<%@page import="model.Courses" import="model.Notify"
	import="model.NotifyDAO"   import="model.Studentinfo"%>%>
	
	

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>管理员主页</title>

		<meta http-equiv="content-type" content="text/html;charset=utf-8" />

		<meta name="description" content="用户主页" />

		<meta name="keywords" content="Gurudigger" />

		<link href="imgs/c1.jpg" rel="shortcut icon" type="image/x-icon" />

		<link href="css/core.css" rel="stylesheet" type="text/css" />

		<%--script src="http://res.gurudigger.com/js/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="http://res.gurudigger.com/jsware.package.js" type="text/javascript"></script--%>





		<link href="css/main.css" rel="stylesheet" type="text/css" />

		<link
			href="http://res.gurudigger.com/globalization/zh-cn/css/main.css"
			rel="stylesheet" type="text/css" />

		<!--[if IE ]><link href="http://res.gurudigger.com/css/ie.css" rel="stylesheet" type="text/css"/><![endif]-->

		<!--[if IE 8 ]><link href="http://res.gurudigger.com/css/ie8.css" rel="stylesheet" type="text/css"/><![endif]-->



		<!--link href="http://res.gurudigger.com/css/layout.right.css"
			rel="stylesheet" type="text/css" /-->

		<!--script src="http://res.gurudigger.com/js/main.js"
			type="text/javascript"-->
		<script src="js/htmldialog.js" type="text/javascript">
</script>



		<!--link href="http://res.gurudigger.com/css/profile.css"
			rel="stylesheet" type="text/css" /-->

		<!--link href="http://res.gurudigger.com/css/box.css" rel="stylesheet"
			type="text/css" /-->

		<!--script src="http://res.gurudigger.com/js/jquery.form.js"
			type="text/javascript">
</script-->
		<script type="text/javascript">
<!--
function toggleTo(img)
{
var ts=document.getElementById("tab").getElementsByTagName("div");
for(i=1;i<ts.length+1;i++){
if(img==i)
{
document.getElementById("oDIV"+i).style.display = "";
document.getElementById("oDIV"+i).parentNode.className+=" up";
}
else{
document.getElementById("oDIV"+i).style.display = "none";
document.getElementById("oDIV"+i).parentNode.className="tab"+i;
}
}
}
-->
</script>

<% 	Integer myJump=(Integer)request.getAttribute("Jump");%>

		<script type="text/javascript">
function jump() {
<%if (myJump==1){%>
		toggleTo(1);
		<%}else if (myJump==2){%>
toggleTo(2);

<%};%>
}
function openwindow() {
	window
			.showModalDialog("editnote.jsp", document,
					"status:no;scroll:no;dialogWidth:650px;dialogHeight:500px;resizable:yes");
}
function openwindow1() {

            document.getElementById("StudentNumber").value=document.getElementById("StudentSelectID").options[document.getElementById("StudentSelectID").selectedIndex].value;
///         document.getElementById("StudentSelectID").setAttribute("")
  
  
            document.getElementById("findPerson").submit();
}
function openedit(servletarg) {
	window
			.showModalDialog(servletarg, document,
					"status:no;scroll:no;dialogWidth:650px;dialogHeight:500px;resizable:yes");
}

function selectRes() {
  document.getElementById("act").value="edit";
  document.getElementById("editPerson").submit();
}
function AddingRes() {
  document.getElementById("act").value="add";
  //document.getElementById("editPerson").submit();
   document.getElementById("AddingButton").value="确认添加";
   document.getElementById("EditingButton").type="hidden";
      document.getElementById("DeletingButton").type="hidden";
   document.getElementById("AddingButton").onclick=Adding
   document.getElementById("StudentNumber").readOnly="";
   document.getElementById("StudentNumber").value="";
   document.getElementById("StudentName").value="";
     document.getElementById("Sex2").value="";
      document.getElementById("StudentBirthday").value="";
    document.getElementById("StudentEmail").value="";
    document.getElementById("StudentPhone").value="";
 document.getElementById("StudentAddress").value="";

 
}
function DeleteRes()
{
 document.getElementById("act").value="delete";
   document.getElementById("editPerson").submit();
}
function Adding(){

var k=document.getElementById("StudentSelectID").options.length;
var x=false;
for (var j = 0; j <k; j++) {
	
	if (document.getElementById("StudentNumber").value==document.getElementById("StudentSelectID").options[j].value)
	{
	alert("已存在该用户");
	x=true;
	break;
	}
}  
if (x==true)
{
alert("添加失败");
}
else
{
  document.getElementById("editPerson").submit();
}



}


</script>

		<style type="text/css" media="all">
		
		#PersonalInfo {
	top:15px;
 	left:350px;
	height:300px;
	width:500px;

	padding-top: 10px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-left: 100px;
}

/*TAB布局*/
#tab * {
	font-size: 12px;
}

#tab h3 a {
	display: inline-block;
}

#tab h3 a {
	display: block;
}

#tab {
	position: relative;
}

#tab h3,#tab ul,#tab div,#tab li {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#tab ul li {
	position: absolute;
	left: 0;
	top: 0;
	float: left;
	display: block;
	width: 100px;
	height: 30px;
	font-size: 0;
}

#tab ul li#tab2 {
	left: 100px;
}

#tab ul li#tab3 {
	left: 200px;
}

#tab ul li#tab4 {
	left: 300px;
}

#tab ul li div {
	position: absolute;
	clear: both;
}

#tab ul li div#oDIV2 {
	left: -100px;
}

#tab ul li div#oDIV3 {
	left: -200px;
}

#tab ul li div#oDIV4 {
	left: -300px;
}

ul#notes li.noteaddr {
	width: 300px;
	display: block;
	float: left;
	font-size: 15px;
	height: 20px;
	left: 0;
	line-height: 1.4;
	list-style-type: none;
	margin: 0 0 0 22px;
	padding: 0;
	position: relative;
	top: 0;
}

/*TAB-标题修饰*/
#tab,#tab ul li div,#tab ul li div li {
	width: 945px;
}  /* 设置总宽度[width] */
#tab {
	height: 400px;
	background: #ccc;
	overflow: hidden;
}  /* 设置总高度[height]、标题背景颜色[background] */
#tab ul li h3 a {
	height: 20px;
	padding: 5px 0 2px;
	margin: 5px 0px 0px 5px;
	text-align: center;
	border: solid #ccc 1px;
	border-bottom: none;
	color: #333;
}  /* 标题默认状态 */
#tab ul li h3 a:hover {
	background-color: #ddd;
	border-color: #fff;
}  /* 鼠标经过状态 */
#tab ul li.up h3 a {
	background: #999;
	border-color: #fff #999 #999 #fff;
	color: #fff;
}  /* 当前窗口状态 */
#tab ul li div {
	border: solid #999;
	border-width: 1px 0;
	background: #f7f7f7;
	height: 367px;
}  /* 设置内容高度[height]、背景颜色[background]、上下分割线[border] */ /*TAB1效果[ol/li]*/
#tab ul li #oDIV1 ol {
	margin: 8px;
	padding: 0;
}

#tab ul li #oDIV1 ol li {
	position: static;
	float: none;
	font-size: 0;
	height: auto;
}

#tab ul li #oDIV1 ol li a {
	font-size: 12px;
	display: block;
	padding: 5px 0 1px;
}

/*TAB2效果[img]*/
#tab ul li #oDIV2 img {
	margin: 8px;
	border: none;
}

ul#notes {
	list-style-type: square;
	margin: 0;
	padding: 0;
	list-style: disc outside none;
	line-height: 1.2;
}

ul#notes li {
	display: block;
	float: left;
	font-size: 15px;
	height: 20px;
	left: 0;
	line-height: 1.4;
	list-style-type: none;
	margin: 0 0 0 22px;
	padding: 0;
	position: relative;
	top: 0;
}

/*TAB3效果[iframe]*/
#tab ul li #oDIV3 iframe {
	border: none;
	width: 440px;
	height: 157px;
	margin: 5px;
}

table#tnotes {
	border-collapse: collapse;
	border-spacing: 0;
}
</style>




	</head>



	<body  onLoad="javascript:jump();">>



		<div id="holder"></div>

		<div id="mn">

			<div id="mn-head" class="clearfix">

				<div id="hd" class="clearfix">

					<div id="hd-l">

						<a id="hd-logo" href="/activity"> <img id="hd-logo-img"
								src="imgs/sse.png" title="GuruDigger" alt="GuruDigger" /> </a>

					</div>

					<div id="hd-r">
						&nbsp;

						<br>
						<div id="nav-prof">

							<a class="nav-prof-itm" id="nav-prof-setting" href="/settings"
								title="设置"><img src="imgs/setting.png"
									style="left: 2px; width: 16px;" /> </a><a class="nav-prof-itm"
								id="nav-prof-logout" title="退出" href="/StudentPortal/logout"><img
									src="imgs/exit.png" /> </a>


						</div>

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



						<div id="prof-pnl" class="mn-c-pnl">





							<br>



							<div id="prof-basic" class="block clearfix bd-round-blue-light">

								<div id="prof-basic-l">

									<a href="/profile?uid=24660"><img id="prof-photo"
											class="photo"
											src="http://www.gravatar.com/avatar/b2be14fe77d541e857248adc7ef2e52f?d=mm&s=87"
											alt="littne" /> </a>

								</div>

								<div id="prof-basic-r" class="clearfix">

									<div id="prof-info">

										<h1>
											<!--span id="prof-name">littne</span-->
											<jsp:useBean id="user" scope="session"
												class="model.Teacherinfo"></jsp:useBean>
										</h1>

										<div id="prof-desc">

											<div>
												<span id="prof-title" style="display: none">Shanghai,
													CN</span>



												<span id="prof-info-spl"></span>



												<a id="prof-blog" href="http://littne.wordpress.com"
													target="_blank" style="display: none">littne.wordpress.com</a>
												<br>
												<%=user.getTId()%>
												&nbsp;&nbsp;
												<%=user.getName()%><br>

												<%=user.getSex()%><br>



											</div>

											<div id="latest-status" class="clearfix">



											</div>

										</div>

									</div>



								</div>
								&nbsp;



							</div>

							<br>

							<div id="prof-pnl-act" class="bd-round-blue-light">



								<!--div class="pnl-head clearfix" id="tab-bar">

									<h3 class="pnl-caption">
										你想说：
									</h3>

								</div>



								<div class="pnl-content" id="tab-content">



									<div id="prof-status" class="clearfix"></div>



									<div id="activity"></div>
									
									

								</div-->
								<div id="tab">
									<ul>
										<li id="tab1" class="up">
											<h3>
												<a href="####" onclick="javascript:toggleTo(1)">通知管理</a>
											</h3>
											<!-- onclick鼠标释放，onmousemove鼠标经过。 -->
											<div id="oDIV1">
												&nbsp;

												<br />
												&nbsp; 当前通知 |
												<br />


												<ul id="notes">
													<%
														//int currentPage = Integer.valueOf((String) request
														//		.getAttribute("pageno"));
														//NotifyDAO notifyDAO = new NotifyDAO();
														//List lns = notifyDAO.findAll();
														//List ln = lns.subList(currentPage, currentPage + 12);
														NotifyList lns = (NotifyList) session.getAttribute("noteli");
														System.out.println("admin" + lns.allItems);
														List ln = lns.getCurrentList(((Integer) request
																.getAttribute("pageNumber")).intValue());

														out
																.println("<table id=\"tnotes\" width=\"100%\"><thead><tr align=\"center\">"
																		+ "<td width=\"20%\">发布时间</td>"
																		+ "<td width=\"60%\">通知标题</td>"
																		+ "<td colspan=\"3\">操作</td></tr></thead><tbody>");
														for (int i = 0; i != ln.size(); ++i) {
															Notify temp = (Notify) ln.get(i);
															String date = temp.getDatetime().toString();

															//out.println("<li><a href=\"/StudentPortal/html/"
															//		+ temp.getNid() + ".html\"target=\"_blank\">"
															//		+ temp.getTitle() + "</a></li>");
															if ((i % 2) == 1) {
																out.println("<tr align=\"center\">");
															} else {
																out.println("<tr align=\"center\" bgcolor=\"#00f2a0\">");
															}
															out
																	.println("<td>"
																			+ date.substring(0, date.indexOf(' '))
																			+ "</td><td><a href=\"/StudentPortal/html/"
																			+ temp.getNid()
																			+ ".html\"target=\"_blank\">"
																			+ temp.getTitle()
																			+ "</a></td><td><a href=\"javascript:openedit(\'/StudentPortal/GetCurNote?noteid="
																			+ temp.getNid()
																			+ "\')\">编辑</a>"
																			+ "&nbsp;<a href=\"/StudentPortal/DeleteNote?noteid="
																			+ temp.getNid() + "\">删除</a></td>" + "</tr>");

														}
														out.println("</tbody></table>");
													%>
												</ul>
												<br />
												<jsp:include page="paging_footer.jsp"></jsp:include>
												<form method="post" action="/StudentPortal/EditNote"
													name="newnote">
													&nbsp;
													<input type="button" value="添加通知" name="addnote"
														onclick="openwindow();">
													<input type="text" maxlength="45" name="title"
														style="visibility: hidden" />
													<input type="text" maxlength="1000" name="content"
														style="visibility: hidden" />
													<input type="text" maxlength="20" name="author"
														style="visibility: hidden" />
													<input type="text" maxlength="20" name="noteid"
														style="visibility: hidden" />
												</form>
												<br />
												&nbsp;
											</div>
										</li>
										<li id="tab2">
											<h3>
												<a href="####" onclick="javascript:toggleTo(2)">账号管理</a>
											</h3>
											<div id="oDIV2" style="display: none;">
												<br />
								
												<%
													List myStudent = (List) session.getAttribute("MyStudentList");
												%>
							
											
													
			<form method="post" action="/StudentPortal/FindPersonalInfo" id="findPerson" >						
												
  <SELECT   id="StudentSelectID" value="" name="XiaZaiWenJian" size="14"  style="width:300px" onchange="openwindow1();" selected="1">
<%										
											
		for (int i = 0; i < myStudent.size(); i++) {
		Studentinfo temp = (Studentinfo) myStudent.get(i);
%>
<OPTION   VALUE=  <%out.print(temp.getSId());%> > <%out.print(temp.getName());%> </OPTION>
<% }%>
</SELECT> 
	 </form>
<div id="PersonalInfo">

	<form method="post" action="/StudentPortal/EditPersonalInfo" id="editPerson" >
	
										
												<%
												String myID = (String) session.getAttribute("StudentID");
													String myName = (String) session.getAttribute("StudentName");
													String mySex= (String) session.getAttribute("Sex");
													
													
													String myNation= (String) session.getAttribute("StudentNation");
													String myAddress= (String) session.getAttribute("StudentAddress");
													String myEmail= (String) session.getAttribute("StudentEmail");
													String myPhone= (String) session.getAttribute("StudentPhone");
												%>
							
			<p>
				&nbsp;
						
				<font bgcolor="#b6f8f4">学号</font> &nbsp; &nbsp;
				<input readonly="true" id="StudentNumber" value=<%out.print(myID);%> type="" maxlength="45" name="id" />
			</p>	
			<p>
					&nbsp;
				<font bgcolor="#b6f8f4">姓名</font> &nbsp; &nbsp;
				<input id="StudentName" value=<%out.print(myName);%> type="text" maxlength="45" name="name" />
			</p>
			
				<p>
					&nbsp;
				<font bgcolor="#b6f8f4">性别</font> &nbsp; &nbsp;
				
				 <select name="sex" id="Sex2" accesskey=<%out.print(mySex);%> tabindex="0"> 
   					 <option value="男">男</option> 
  					  <option value="女">女</option> 
  				</select> 
  
			</p>
			
					<p>&nbsp; 
					生日&nbsp; &nbsp;&nbsp; <input id="StudentBirthday" type="text" maxlength="45" name="birthday"  value=""/>
			</p>
				<p>&nbsp; 
					国籍&nbsp; &nbsp;&nbsp; <input id="StudentNation" type="text" maxlength="45" name="nation" value=<%out.print(myNation);%> />
			</p>
			
				<p>&nbsp; 
					地址&nbsp; &nbsp;&nbsp; <input id="StudentAddress" type="text" maxlength="45" name="address" value=<%out.print(myAddress);%> />
			</p>
			
				<p>&nbsp; 邮箱&nbsp; &nbsp;&nbsp; <input id="StudentEmail" type="text" maxlength="45" name="mail" value=<%out.print(myEmail);%> />
			</p>
				<p>&nbsp; 电话&nbsp; &nbsp;&nbsp; <input id="StudentPhone" type="text" maxlength="45" name="phone" value=<%out.print(myPhone);%> />
			</p>
			<p> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>
				&nbsp;
				
				<input type="hidden" id="act" name="act" value="select">
 <input type="button" value="修改" onclick="selectRes()" id="EditingButton">
<input type="hidden" name="act" value="edit">
  <input type="button" value="添加" onClick="AddingRes()" id="AddingButton">
				
				<input type="hidden" name="act" value="delete">
  <input type="button" value="删除" onClick="DeleteRes()" id="DeletingButton">
			

			</p>
			<p>
				&nbsp;
			</p>
			
		</form>
	
		</div>
								
											</div>
										</li>
										<li id="tab3">
											<h3>
												<a href="####" onclick="javascript:toggleTo(3)">课程管理</a>
											</h3>
											<div id="oDIV3" style="display: none;">
												<br />

											</div>
										</li>
										<li id="tab4">
											<h3>
												<a href="####" onclick="javascript:toggleTo(4)">课程</a>
											</h3>
											<div id="oDIV4" style="display: none;">

											</div>
										</li>
									</ul>
								</div>

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
									<input id="ct-name" type="text" class="ct-text" maxlength="200" />
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


</html>
