package com.tongji.j2ee.sp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.Courses;
import model.Studentinfo;
import model.Teacherinfo;
import model.TeacherinfoDAO;


public class StudentMessage extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String subject = request.getParameter("subject");
		String course = new String(request.getParameter("course").getBytes("iso-8859-1"),"utf-8");
		course = "(" + course + ")";
		Studentinfo studentinfo = (Studentinfo)session.getAttribute("user"); 
		subject = course + studentinfo.getName() + ":" + subject;
		
		String content = request.getParameter("content");
		
		String t_id = request.getParameter("to");
		TeacherinfoDAO teacherinfoDAO = new TeacherinfoDAO();
		Teacherinfo teacherinfo = teacherinfoDAO.findById(t_id);
		String to = teacherinfo.getEmail();
		
		SendMailServlet sendMailServlet = new SendMailServlet();
		if(!sendMailServlet.sendMail(to, subject, content)){
			request.getRequestDispatcher("EmailFailure.html").forward(request, response);
		}else{
			request.getRequestDispatcher("EmailSuccess.html").forward(request, response);
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
