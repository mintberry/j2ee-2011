package com.tongji.j2ee.sp;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

public class HtmlGenerator {

	public HtmlGenerator() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void GenerateHtml(HttpServletRequest request) {
		try {
			String title = "This is Title";
			String content = "This   is   Content   Area";
			String editer = "Neon";
			String filePath = "";
			filePath = request.getRealPath("/") + "test/template.htm";
			// out.print(filePath+"<br/>");
			String templateContent = "";
			FileInputStream fileinputstream = new FileInputStream(filePath);// 读取模块文件
			int lenght = fileinputstream.available();
			byte bytes[] = new byte[lenght];
			fileinputstream.read(bytes);
			fileinputstream.close();
			templateContent = new String(bytes);
			// out.print(templateContent);
			templateContent = templateContent.replaceAll("###title###", title);
			templateContent = templateContent.replaceAll("###content###",
					content);
			templateContent = templateContent
					.replaceAll("###author###", editer);// 替换掉模块中相应的地方
			// out.print(templateContent);
			// 根据时间得文件名
			Calendar calendar = Calendar.getInstance();
			String fileame = String.valueOf(calendar.getTimeInMillis())
					+ ".html";
			fileame = request.getRealPath("/") + fileame;// 生成的html文件保存路径
			FileOutputStream fileoutputstream = new FileOutputStream(fileame);// 建立文件输出流
			byte tag_bytes[] = templateContent.getBytes();
			fileoutputstream.write(tag_bytes);
			fileoutputstream.close();
		} catch (Exception e) {
			System.out.print(e.toString());
		}

	}
}
