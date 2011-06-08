//移动层的类
function DivMove() {
	this.Move = function(DivID, Evt) {
		if (DivID == "") {
			return;
		}
		var DivObj = document.getElementById(DivID);
		evt = Evt ? Evt : window.event;
		if (!DivObj) {
			return;
		}
		var DivW = DivObj.offsetWidth;
		var DivH = DivObj.offsetHeight;
		var DivL = DivObj.offsetLeft;
		var DivT = DivObj.offsetTop;
		var TemDiv = document.createElement("div");
		TemDiv.id = DivID + "tem";
		document.body.appendChild(TemDiv);
		TemDiv.style.cssText = "width:" + DivW + "px;height:" + DivH
				+ "px;top:" + DivT + "px;left:" + DivL
				+ "px;position:absolute; border:#ff0000 1px dotted;z-index:500";
		this.MoveStart(DivID, evt);
	}

	this.MoveStart = function(DivID, Evt) {
		var TemDivObj = document.getElementById(DivID + "tem");
		if (!TemDivObj)
			return;
		evt = Evt ? Evt : window.event;
		var rLeft = evt.clientX - TemDivObj.offsetLeft;
		var rTop = evt.clientY - TemDivObj.offsetTop;
		if (!window.captureEvents) {
			TemDivObj.setCapture();
		} else {
			window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
		}

		document.onmousemove = function(e) {
			if (!TemDivObj) {
				return;
			}
			e = e ? e : window.event;
			if (e.clientX - rLeft <= 0) {
				TemDivObj.style.left = 0 + "px";
			} else if (e.clientX - rLeft >= document.documentElement.clientWidth
					- TemDivObj.offsetWidth - 2) {
				TemDivObj.style.left = (document.documentElement.clientWidth
						- TemDivObj.offsetWidth - 2)
						+ "px";
			} else {
				TemDivObj.style.left = e.clientX - rLeft + "px";
			}
			if (e.clientY - rTop <= 1) {

			} else {
				TemDivObj.style.top = e.clientY - rTop + "px";
			}
		}

		document.onmouseup = function() {
			if (!TemDivObj) {
				return;
			}
			if (!window.captureEvents) {
				TemDivObj.releaseCapture();
			} else {
				window.releaseEvents(Event.MOUSEMOVE | Event.MOUSEUP);
			}
			var DivObj1 = document.getElementById(DivID);
			if (!DivObj1)
				return;
			var l0 = TemDivObj.offsetLeft;
			var t0 = TemDivObj.offsetTop;

			DivObj1.style.top = t0 + "px";
			DivObj1.style.left = l0 + "px";

			document.body.removeChild(TemDivObj);
			TemDivObj = null;
		}
	}
}

var MoveDiv = new DivMove();//创建移动层的实例

function myalert(str) {
	//var MoveDiv = new DivMove();//创建移动层的实例
	var alertTop = document.documentElement.scrollTop + 100;//得到滚动位置，设置对话框顶部位置

	var alertLeft = (document.body.offsetWidth - 350) / 2;//设置对话框居中显示
	var obj = document.createElement("div");//创建一个div标签，作为自定对话框的容器
	obj.id = "myalertdiv";
	document.body.appendChild(obj);
	obj.style.cssText = "position:absolute; left:"
			+ alertLeft
			+ "px; top:"
			+ alertTop
			+ "px; border:#999999 1px solid; width:350px; height:150px; z-index:1000;";//设定对话框容器的样式
	obj.innerHTML = '<div style="border:0; height:20px; line-height:20px; width:100%; background-color:#0000ff; font-size:12px; color:#ffffff">'
			+ '定义对话框<div style="position:absolute;cursor:default; top:0px; left:340px;" onmouseover="this.style.color=\'#ff0000\';" onmouseout="this.style.color=\'#ffffff\'" onclick="removeAlert();">'
			+ 'X'
			+ '</div>'
			+ '</div>'
			+ '<div style="width:320px;height:110px; line-height:20px; font-size:14px; text-align:center; padding-top:20px; padding-left:15px; padding-right:15px;">'
			+ str
			+ '</div><div style="position:absolute;left:300px; top:120px; width:50px;height:30px;">'
			+ '<button type="button" onclick="removeAlert()">确定</button>'
			+ '</div>';//设置对话框的内容，这里可以设置的漂亮一些，我只是简单设置一下，没有用图片，这些你们可自行设置喜欢的样式
}
function removeAlert() {//关闭对话框函数
	if (document.getElementById("myalertdiv")) {
		document.body.removeChild(document.getElementById("myalertdiv"));
	}
}

