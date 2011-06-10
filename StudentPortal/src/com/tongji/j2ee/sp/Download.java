package com.tongji.j2ee.sp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;

import model.Files;
import model.FilesDAO;

public class Download extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		Files file = null;
		
		try{
			FilesDAO fileDao = new FilesDAO();
			file = fileDao.findById(id);
			if(file!=null){
				SmartUpload mydown = new SmartUpload();
				mydown.initialize(getServletConfig(),request,response);
				mydown.setContentDisposition(null);
				mydown.downloadFile(file.getLocation());
			}
		}catch(Exception e){
			e.printStackTrace();
			String message="下载失败！文件 <b><font color='red'>"+file.getName()+"</font></b> 不存在或已经被删除！<br>";
			message+="<a href='javascript:window.history.go(-1)'>返回</a>";
		    request.setAttribute("message",message);
		    //RequestDispatcher rd=request.getRequestDispatcher("/message.jsp");
		    //rd.forward(request,response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
