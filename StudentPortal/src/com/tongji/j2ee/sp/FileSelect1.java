package com.tongji.j2ee.sp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.Files;
import model.FilesDAO;


public class FileSelect1 extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		FilesDAO filesDAO =  new FilesDAO();
		Files file = filesDAO.findById(id);
		
		request.setAttribute("file", file);
		
		request.getRequestDispatcher("fileView.jsp").forward(request, response);
	}

}
