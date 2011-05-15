<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	font: 100% Verdana, Arial, Helvetica, sans-serif;
	background: #666666;
	margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
	padding: 0;
	text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */
	color: #000000;
}

/* Tips for Elastic layouts 
1. Since the elastic layouts overall sizing is based on the user's default fonts size, they are more unpredictable. Used correctly, they are also more accessible for those that need larger fonts size since the line length remains proportionate.
2. Sizing of divs in this layout are based on the 100% font size in the body element. If you decrease the text size overall by using a font-size: 80% on the body element or the #container, remember that the entire layout will downsize proportionately. You may want to increase the widths of the various divs to compensate for this.
3. If font sizing is changed in differing amounts on each div instead of on the overall design (ie: #sidebar1 is given a 70% font size and #mainContent is given an 85% font size), this will proportionately change each of the divs overall size. You may want to adjust based on your final font sizing.
*/
.oneColElsCtrHdr #container {
	width: 46em;  /* this width will create a container that will fit in an 800px browser window if text is left at browser default font sizes */
	background: #FFFFFF;
	margin: 0 auto; /* the auto margins (in conjunction with a width) center the page */
	border: 1px solid #000000;
	text-align: left; /* this overrides the text-align: center on the body element. */
}
.oneColElsCtrHdr #header { 
	background: #DDDDDD; 
	padding: 0 10px 0 20px;  /* this padding matches the left alignment of the elements in the divs that appear beneath it. If an image is used in the #header instead of text, you may want to remove the padding. */
} 
.oneColElsCtrHdr #header h1 {
	margin: 0; /* zeroing the margin of the last element in the #header div will avoid margin collapse - an unexplainable space between divs. If the div has a border around it, this is not necessary as that also avoids the margin collapse */
	padding: 10px 0; /* using padding instead of margin will allow you to keep the element away from the edges of the div */
}
.oneColElsCtrHdr #mainContent {
	padding: 0 20px; /* remember that padding is the space inside the div box and margin is the space outside the div box */
	background: #FFFFFF;
}
.oneColElsCtrHdr #footer { 
	padding: 0 10px; /* this padding matches the left alignment of the elements in the divs that appear above it. */
	background:#DDDDDD;
} 
.oneColElsCtrHdr #footer p {
	margin: 0; /* zeroing the margins of the first element in the footer will avoid the possibility of margin collapse - a space between divs */
	padding: 10px 0; /* padding on this element will create space, just as the the margin would have, without the margin collapse issue */
}
.fltlft {	float: left;
	margin-right: 8px;
}
-->
</style></head>

<body class="oneColElsCtrHdr">

<div id="container">
  <div id="header">
  <blockquote>
    <blockquote>
      <blockquote>
        <h1> <img src="logo.png" width="341" height="56" /></h1>
      </blockquote>
    </blockquote>
  </blockquote>
  <!-- end #header --></div>
  <div id="mainContent">
    <blockquote>
      <blockquote>
        <blockquote>
          <blockquote>
            <blockquote>
              <p>学号：
                <input name="textfield" type="text" id="textfield" size="24" />
              </p>
              <p>密码：
                <input type="text" name="textfield2" id="textfield2" />
              </p>
              <p>姓名：
                <input type="password" name="textfield3" id="textfield3" />
              </p>
<p>性别：
  <select name="Sex2" id="Sex2" accesskey="男" tabindex="0">
    <option value="0">男</option>
    <option value="1">女</option>
  </select>
</p>
<p>生日：
  <input name="textfield4" type="text" id="textfield4" size="5" maxlength="4" /> 
  年
  <input name="textfield5" type="text" id="textfield5" size="5" maxlength="4" /> 
  月
  <input name="textfield6" type="text" id="textfield6" size="5" maxlength="4" />
  日
</p>
              <p>国籍：
                <input type="password" name="textfield7" id="textfield7" />
              </p>
              <p>职称：
                <select name="Sex" id="Sex" accesskey="男" tabindex="0">
                  <option value="0">讲师</option>
                  <option value="1">副教授</option>
                  <option value="2">教授</option>
                </select>
              </p>
              <p>邮箱：
                <input type="password" name="textfield8" id="textfield8" />
              </p>
              <p>地址：
                <input type="password" name="textfield9" id="textfield9" />
              </p>
              <p>电话： 
                <input type="password" name="textfield10" id="textfield10" />
              </p>
              <blockquote>
                <blockquote>
                  <p>
                    <input name="RegistButton" type="submit" class="oneColElsCtrHdr" id="RegistButton" value="注册" />
                  </p>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <!-- end #mainContent -->
    </blockquote></div>
  <div id="footer">
    <div id="footer2">
      <blockquote>
        <blockquote>
          <blockquote>
            <blockquote>
              <blockquote>
                <blockquote>
                  <blockquote>
                    <p class="twoColElsLtHdr"> 同济大学软件学院 </p>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <!-- end #footer -->
      <!-- end #footer -->
  </div></div>
<!-- end #container --></div>
</body>
</html>