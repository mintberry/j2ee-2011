package com.tongji.j2ee.sp;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Studentinfo;

public class CheckMailAddrServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession hs = request.getSession();

		Object infoObject = hs.getAttribute("user");

		if (infoObject instanceof Studentinfo) {
			System.out.println("OK");
			Studentinfo studentinfo = (Studentinfo) infoObject;
			String id = studentinfo.getSId();
			String password = studentinfo.getPassword();
			String email = request.getParameter("email1");
			Vector<String> to =  new Vector<String>();
			to.add(email);
			String subject = "邮箱地址确认";
			String content = "http://localhost:8080/StudentPortal/RegMailServlet"
					+ "?id=" + id + "&password=" + password + "&email=" + email;
			
			request.setAttribute("to", to);
			request.setAttribute("subject", subject);
			request.setAttribute("content", content);
			SendMailServlet sendMailServlet = new SendMailServlet();
			sendMailServlet.doPost(request, response);
			return;
		} else {
			System.out.println("Fuck");
			return;
		}
	}
}
