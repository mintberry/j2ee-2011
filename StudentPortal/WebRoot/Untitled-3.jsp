<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>

<style type="text/css">

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



</style>

</head>

<body>


<form action="" method="get">
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
</body>
</html>