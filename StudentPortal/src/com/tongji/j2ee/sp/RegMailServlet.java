package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Studentinfo;
import model.StudentinfoDAO;
import model.Teacherinfo;
import model.TeacherinfoDAO;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegMailServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		TeacherinfoDAO tiDAO = new TeacherinfoDAO();
		StudentinfoDAO studentinfoDAO = new StudentinfoDAO();
		
		String email = request.getParameter("email");
		
		if(10 == id.length()){
			
			Teacherinfo current =tiDAO.findById(id);
			current.setEmail(email);
			tiDAO.save(current);
			
		}else{
		    Studentinfo current = studentinfoDAO.findById(id);
		    current.setEmail(email);
		    studentinfoDAO.save(current);
		}
		
		Session s = (Session) HibernateSessionFactory.getSession();
		
		
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
