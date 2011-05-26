package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Studentinfo;
import model.StudentinfoDAO;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegMailServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		Studentinfo current = (Studentinfo) hs.getAttribute("user");
		StudentinfoDAO sDAO = new StudentinfoDAO();

		String sAddress = (String) request.getParameter("email1");

		System.out.println("session:" + current.getSId() + sAddress);
		Session s = (Session) HibernateSessionFactory.getSession();
		current.setEmail(sAddress);
		sDAO.save(current);
		try {
			Transaction ts = s.beginTransaction();
			ts.commit();
		} catch (Exception e) {

		} finally {
			s.close();
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
}
