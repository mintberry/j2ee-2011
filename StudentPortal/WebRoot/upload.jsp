<%@ page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<title>上传文件</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">
	</head>
	<body bgcolor="#E1E1E1">
		<center>
		<table border="1" bordercolor="#BFD3E1" bordercolorlight="#BFD3E1" bordercolordark="white" cellpadding="0" cellspacing="0" rules="cols">
			<form action="/StudentPortal/Upload" enctype="multipart/form-data" name="uploadform" method="post">
			<tr>
				<td width="22%" align="center" valign="top" bgcolor="#F7FAF6" style="padding-top:8">
					<div style="background:#177B6C;width:94%;height:25;color:white"><b>注意事项：</b></div>					
					文件长度最大允许为50兆！
				</td>
				<td valign="top" style="padding-left:30;padding-top:10" bgcolor="white">
					文件路径1：<br>
					<input type="file" name="file1" size="60"><br>
					文件描述1：<br>
					<textarea rows="5" cols="69" name="fileinfo1"></textarea><br>
					<hr color="black">
					文件路径2：<br>
					<input type="file" name="file2" size="60"><br>
					文件描述2：<br>
					<textarea rows="5" cols="69" name="fileinfo2"></textarea><br>
					
					<input type="button" value="submit" onclick="uploadform.submit()">
					<input type="reset" value="reset">
					<br><br>
				</td>
			</tr>
			</form>
		</table>
		</form>
		</center>
	</body>
</html>