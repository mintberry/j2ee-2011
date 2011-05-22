package com.tongji.j2ee.sp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Studentinfo;
import model.StudentinfoDAO;
import model.Teacherinfo;
import model.TeacherinfoDAO;

public class LoginServlet extends HttpServlet {
	
	//when to initialize the DAO is a problem
	private StudentinfoDAO studentinfoDAO = new StudentinfoDAO();
	private Studentinfo studentinfo;
	private TeacherinfoDAO teacherinfoDAO = new TeacherinfoDAO();
	private Teacherinfo teacherinfo;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("userID");
		String password = request.getParameter("password");
		
		//for student_id
		if(id.length()==6){
			studentinfo = studentinfoDAO.findById(id);
			if(studentinfo == null){
				request.setAttribute("errorInformation", "The user does not exist!");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			}else{
				if(password.equals(studentinfo.getPassword())){
					if(studentinfo.getEmail().equals("")){
						request.getRequestDispatcher("register.jsp").forward(request, response);
						return;
					}
					//TODO: replace by student.jsp
					request.getRequestDispatcher("teacher.jsp").forward(request, response);
				}else{
					request.setAttribute("errorInformation", "The password is not right!");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}
		}
		
		//for teacher_id
		if(id.length()==10){
			teacherinfo = teacherinfoDAO.findById(id);
			if(teacherinfo == null){
				request.setAttribute("errorInformation", "The user does not exist!");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				return;
			}else{
				if(password.equals(teacherinfo.getPassword())){
					if(teacherinfo.getEmail().equals("")){
						request.getRequestDispatcher("register.jsp").forward(request, response);
						return;
					}
					request.getRequestDispatcher("teacher.jsp").forward(request, response);
				}else{
					request.setAttribute("errorInformation", "The password is not right!");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}
		}
		
		//TODO:for admin_id
	}
}


