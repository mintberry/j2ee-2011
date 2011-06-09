<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>编辑通知</title>
	</head>
	<body>
		<form method="post" action="/StudentPortal/EditNote" name="editform">
			<p>
				&nbsp;
				<font bgcolor="#b6f8f4">标题：</font> &nbsp; &nbsp;
				<input type="text" maxlength="45" name="title" />
			</p>
			<p>
				&nbsp; 内容：
			</p>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<textarea rows="6" name="content"></textarea>
			</p>
			<p>
				&nbsp;发布者：
				<input type="text" maxlength="20" name="author" />
			</p>
			<p>
				&nbsp;上传附件：
				<br />
			</p>
			<p>
				&nbsp;
			</p>
			<p>
				&nbsp;
				<input type="button" value="完成" name="submit" onclick="bconfirm()"/>
			</p>
			<p>
				&nbsp;
			</p>
			<p>
				&nbsp;
			</p>
		</form>

		<script type="text/javascript">
function opensub() {
	document.editform.submit();
}
function bconfirm() {
	window.dialogArguments.newnote.title.value = document.editform.title.value;
	window.dialogArguments.newnote.content.value = document.editform.content.value;
	window.dialogArguments.newnote.author.value = document.editform.author.value;
	//alert(dialogArguments.newnote.title.value);
	window.dialogArguments.newnote.submit();
	window.close();
}

function bcancel() {
	window.close();
}
</script>

	</body>
</html>