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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		StudentinfoDAO studentinfoDAO = new StudentinfoDAO();
		Studentinfo current = studentinfoDAO.findById(id);

		Session s = (Session) HibernateSessionFactory.getSession();
		current.setEmail(email);
		studentinfoDAO.save(current);
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
