<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>GuruDigger</title>

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

		<script src="http://res.gurudigger.com/js/main.js"
			type="text/javascript">
</script>



		<!--link href="http://res.gurudigger.com/css/profile.css"
			rel="stylesheet" type="text/css" /-->

		<!--link href="http://res.gurudigger.com/css/box.css" rel="stylesheet"
			type="text/css" /-->

		<script src="http://res.gurudigger.com/js/jquery.form.js"
			type="text/javascript">
</script>

		<style type="text/css" media="all">
		
		
		h4 {text-align: center  ;font-size:200%; }
h5 {text-align: left }

#XiaZai{
	width: 400px;
	top: -353px;
	left: 570px;
	position: relative;
	height: auto;
	visibility: inherit;
	border-left-width: 0px;
	border-top-width: 0px;
}
#LiuYan{
	left:85px;
	height:300px;
	width:500px;
	font-size: 18px;
	font-style: italic;
	padding-top: -30px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-left: 50px;
}


#Kecheng{
	
	height:auto;
	width:1000px
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
	top: 10;
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

	left: -250px;
	height:1000px;
	position: absolute;
}

#tab ul li div#oDIV4 {
	left: -300px;
}

/*TAB-标题修饰*/
#tab,#tab ul li div,#tab ul li div li {
	width: 945px;
}  /* 设置总宽度[width] */
#tab {
left:60px;
	height: 400px;
	background:#99FFFF;
	overflow: hidden;
}  /* 设置总高度[height]、标题背景颜色[background] */
#tab ul li h3 a {
	height: 20px;
	padding: 5px 0 2px;
	margin: 5px 0px 0px 5px;
	text-align: center;
	border: solid #ccc 1px;
	border-bottom: none;
	color: #FFFFFF;
}  /* 标题默认状态 */
#tab ul li h3 a:hover {
	background-color: #99FFFF;
	border-color: #FFFFFF;
}  /* 鼠标经过状态 */
#tab ul li.up h3 a {
	background: #3366FF;
	border-color: #fff #999 #999 #fff;
	color: #fff;
}  /* 当前窗口状态 */
#tab ul li div {
	border: solid #999;
	border-width: 1px 0;
	background: #FFFFFF;
	height: auto;
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

/*TAB3效果[iframe]*/
#tab ul li #oDIV3 iframe {
	border: none;
	width: 440px;
	height: 157px;
	margin: 5px;
}
</style>

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


	</head>



	<body>&nbsp;&nbsp;



		<div id="mn-head" class="clearfix">&nbsp;<br><div id="hd" class="clearfix"> 
 
					<div id="hd-l" style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
 
						<a id="hd-logo" href="/activity"> <img id="hd-logo-img" src="imgs/sse.png" title="GuruDigger" alt="GuruDigger" style="left: 50px;"> </a> 
 
					</div> 
 
					<div id="hd-r"> 
						&nbsp; 
 
						<br> 
						<div id="nav-prof"> 
 
							<a class="nav-prof-itm" id="nav-prof-setting" href="/settings" title="设置"><img src="imgs/setting.png" style="left: 2px; width: 16px;"> </a><a class="nav-prof-itm" id="nav-prof-logout" title="退出" href="/logout"><img src="imgs/exit.png"> </a> 
 
 
 
						</div> 
 
					</div> 
 
				</div> 
			<div id="tab"> 
								<ul> 
									<li id="tab1" class="up"> 
										<h3>  
											<a href="####" onclick="javascript:toggleTo(1)">主页</a>  
										</h3> 
										<!-- onclick鼠标释放，onmousemove鼠标经过。 --> 
										 
										 
										 
									<div id="odiv1" style="top: 33px; height: 258px;">
									

			<a id="hd-Photo" href="/activity"> <img id="hd-logo-img" src="imgs/sse.png" title="GuruDigger" alt="GuruDigger" style="left: 50px;"> </a> 				
    <blockquote>
      <blockquote>
        <blockquote>
          <blockquote>
            <blockquote>
              
              <p>学号： 
               
               
                <input type="text" name="textfield" id="textfield" size="24">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码： 
               
               
                <input type="text" name="textfield2" id="textfield2"> 
              </p>
              
<p>姓名： 
               
               
                <input type="password" name="textfield3" id="textfield3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 性别： 
 
 
  <select name="Sex2" id="Sex2" accesskey="男" tabindex="0"> 
    <option value="0">男</option> 
    <option value="1">女</option> 
  </select> 
</p>

              <p>生日： 
 
 
  <input type="text" name="textfield4" id="textfield4" size="5" maxlength="4">  
  年 
  <input type="text" name="textfield5" id="textfield5" size="5" maxlength="4">  
  月 
  <input type="text" name="textfield6" id="textfield6" size="5" maxlength="4"> 
  日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 国籍： 
               
               
                <input type="password" name="textfield7" id="textfield7"> 
              </p>
              
              
              <p>邮箱： 
               
               
                <input type="password" name="textfield8" id="textfield8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 地址： 
               
               
                <input type="password" name="textfield9" id="textfield9"> 
              </p>
              <p>电话：  
              
              
                <input type="password" name="textfield10" id="textfield10"></p><blockquote> 
                <blockquote> 
                  <p> 
                    <input type="submit" name="RegistButton" class="oneColElsCtrHdr" id="RegistButton" value="修改"> 
                  </p> 
                </blockquote> 
              </blockquote>
<blockquote> 
                <blockquote> 
                  <p> 
                     
                  </p> 
                </blockquote> 
              </blockquote><p> 
              </p>
              <blockquote>
                <blockquote>
                  <p>
                    
                  </p>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <!-- end #mainContent -->
    </blockquote></div>
										 
									</li> 
									<li id="tab2"> 
										<h3> 
											<a href="####" onclick="javascript:toggleTo(2)">课程表</a> 
										</h3> 
 <div id="oDIV2" style="display: none;"> 											<br/> 												<table height="90%" width="90%" border="1" 													bgcolor="#80ffff" align="center"> 													<tbody> 														<tr> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 														</tr> 														<tr> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 														</tr> 														<tr> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 														</tr> 														<tr> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 														</tr> 														<tr> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 														</tr> 														<tr> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 															<td> 																&nbsp; 															</td> 														</tr> 													</tbody> 												</table> 											</div> 
									</li> 
									<li id="tab3"> 
										<h3> 
											<a href="####" onclick="javascript:toggleTo(4)">课程管理</a> 
										</h3> 
									<div id="oDIV3" style="display: none;"> 
										<form >
<div id="Kecheng">
  <h4><strong>课程名：
      <input name="CoureseName" type="text" value="java企业级程序设计"size="20" maxlength="20" readonly="true"/>
  </strong>
  人数:    
  <input name="CoureseID" type="text" value="50" size="3&quot;" maxlength="3" readonly="true" />
    教师：
    <input name="TeacherName3" type="text" value="金伟组" size="8" maxlength="8" readonly="true" />
  </h4>

<h4><strong>时间 ：
    
</strong><strong>
 <SELECT   name="LiuYanBan"  size="2" style="width:300px">
<OPTION   VALUE= "1 "> 周一下午 1:00----3:20 
<OPTION   VALUE= "2 "> 周三下午 1:00----3:20  
</SELECT> 
</strong></h4>
</div>
</form>
<form enctype="multipart/form-data">
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

<div id="XiaZai" >

  <h4>
  <SELECT   name="XiaZaiWenJian" size="14"  style="width:300px">
<OPTION   VALUE= "1 "> XXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefgXXX说:abcdefg 
<OPTION   VALUE= "2 "> Tortie 
<OPTION   VALUE= "3 "   SELECTED> Siamese 
</SELECT> 
  </h4>
  
<h4>
    <input type="submit" name="button" id="button" value="下载" />
</h4>
<p>
<h4>
  <label >
    <input name="fileField" type="file" id="fileField" size="40" maxlength="40" />	
    </label>
    </h4>
    <h4>
  <label>
  
    <input type="submit" name="button2" id="button2" value="上传" />
  </label>
  </h4>
</p>
</div>
</form>										
									
							
									</div>
									
								    <div id="oDIV4" style="display: none;"> 
								    
										<h3> 
											<a href="####" onclick="javascript:toggleTo(3)" onmousemove="javascript:toggleTo(4)">abccd</a> 
										</h3> 
										<h3> 
											<a href="####" onclick="javascript:toggleTo(3)" onmousemove="javascript:toggleTo(4)">bcdde</a> 										
										</h3>
									<br/> 	
																		
									</div>
									 
									</li> 
									 
								</ul> 
							</div> 
 
							</div>

		


					<br>

					<div id="nav-search">



					</div>





				
					<br>

			

					<br>
					
					
				<div>
				
				</div>


<div>
			</div>

		


  			



						<div id="prof-pnl" class="mn-c-pnl">





							<br>



						







								&nbsp;



							</div>

							



						



								<!--div class="pnl-head clearfix" id="tab-bar">

									<h3 class="pnl-caption">
										你想说：
									</h3>

								</div>



								<div class="pnl-content" id="tab-content">



									<div id="prof-status" class="clearfix"></div>



									<div id="activity"></div>
									
									

								</div-->
					
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

							<div class="ct-pop-row clearfix" style="left: 50px">

								<textarea id="ct-desc" class="ct-text" rows="10" cols="20"></textarea>

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








	     	<h1>&nbsp;&nbsp;</h1><h1><br></h1><h1><br><a href="http://code.google.com/p/j2ee-2011/" target="_blank">关于我们</a> 
							</h1>


				
	

		



		
		
	
	
	</body>


</html>
