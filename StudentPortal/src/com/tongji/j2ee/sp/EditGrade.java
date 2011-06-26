package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jspsmart.upload.File;


import model.Files;
import model.FilesDAO;


public class EditGrade extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String grade = request.getParameter("grade");
		int fileId = Integer.parseInt( request.getParameter("fileId") );
		
		FilesDAO filesDAO = new FilesDAO();
		Files file = filesDAO.findById(fileId);
		file.setDescription(grade);
		filesDAO.save(file);
		
		Session s = (Session) HibernateSessionFactory.getSession();
		try {
			Transaction ts = s.beginTransaction();
			ts.commit();
		} catch (Exception e) {

		} finally {
			s.close();
		}
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML> <BODY>");
		out.println("<script language='javascript'>");
		out.println("alert('评价成功！');");// 可以不写
		out.println("history.go(-1)");// 填写你要跳回的页面，或者用("history.go(-1)");
		out.println("</script>");
		out.println("</body> </html>");
	}

}
