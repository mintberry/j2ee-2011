package com.tongji.j2ee.sp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Studentinfo;
import model.Teacherinfo;

public class CheckMailAddrServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession hs = request.getSession();

		Object infoObject = hs.getAttribute("user");

		if (infoObject instanceof Studentinfo) {
			Studentinfo studentinfo = (Studentinfo) infoObject;
			String id = studentinfo.getSId();
			String password = studentinfo.getPassword();
			String to = request.getParameter("email1");
			String subject = "邮箱地址确认";
			String content = "http://localhost:8080/StudentPortal/RegMailServlet"
					+ "?id=" + id + "&password=" + password + "&email=" + to;
			SendMailServlet sendMailServlet = new SendMailServlet();
			sendMailServlet.sendMail(to, subject, content);
			request.getRequestDispatcher("EmailSuccess.html").forward(request, response);
		}else if(infoObject instanceof Teacherinfo){
			Teacherinfo studentinfo = (Teacherinfo) infoObject;
			String id = studentinfo.getTId();
			String password = studentinfo.getPassword();
			String to = request.getParameter("email1");
			String subject = "邮箱地址确认";
			String content = "http://localhost:8080/StudentPortal/RegMailServlet"
					+ "?id=" + id + "&password=" + password + "&email=" + to;
			SendMailServlet sendMailServlet = new SendMailServlet();
			sendMailServlet.sendMail(to, subject, content);
			request.getRequestDispatcher("EmailSuccess.html").forward(request, response);
			
			return;
		}
	}
}
