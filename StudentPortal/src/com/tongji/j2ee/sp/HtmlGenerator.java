package com.tongji.j2ee.sp;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import model.Notify;

public class HtmlGenerator {

	public HtmlGenerator() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void changeHtml(){
		
	}

	public void GenerateHtml(HttpServletRequest request, Notify newnote) {
		ServletContext sc = request.getSession().getServletContext();
		try {
			String title = newnote.getTitle();
			String content = newnote.getContent();
			String editer = newnote.getAuthor();
			String time = newnote.getDatetime().toString();
			String filePath = "";
			filePath = sc.getRealPath("/") + "html/template.html";
			System.out.println(filePath);
			// out.print(filePath+"<br/>");
			String templateContent = "";
			InputStreamReader isr = new InputStreamReader(new FileInputStream(filePath),"UTF-8");
			BufferedReader bf = new BufferedReader(isr);
			//FileInputStream fileinputstream = new FileInputStream(filePath);// 读取模块文件
			//int lenght = fileinputstream.available();
			char buffer[] = new char[8192];
			String cb = new String();
			bf.read(buffer);
			bf.close();
			templateContent = new String(buffer);
			// out.print(templateContent);
			templateContent = templateContent.replaceAll("###title###", title);
			templateContent = templateContent.replaceAll("###content###",
					content);
			templateContent = templateContent
					.replaceAll("###author###", editer);// 替换掉模块中相应的地方
			templateContent = templateContent.replaceAll("###time###", time);// 替换掉模块中相应的地方
			// out.print(templateContent);
			// 根据时间得文件名
			//Calendar calendar = Calendar.getInstance();
			// String fileame = String.valueOf(calendar.getTimeInMillis())
			// + ".html";
			String fileame = "html/" + newnote.getNid() + ".html";
			fileame = sc.getRealPath("/") + fileame;// 生成的html文件保存路径
			OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(fileame), "UTF-8");
			//FileOutputStream fileoutputstream = new FileOutputStream(fileame);// 建立文件输出流
			//byte tag_bytes[] = templateContent.getBytes();
			//osw.write(tag_bytes);
			osw.append(templateContent);
			osw.flush();
			osw.close();
		} catch (Exception e) {
			System.out.print(e.toString());
		}

	}
}
