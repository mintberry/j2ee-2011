package com.tongji.j2ee.sp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Studentinfo;
import model.StudentinfoDAO;

public class LoginServlet extends HttpServlet {
	
	private StudentinfoDAO siset = new StudentinfoDAO();
	private Studentinfo current;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession hs = request.getSession();
		current = siset.findById(request.getParameter("userID"));
		if(current == null){
			request.setAttribute("errorInformation", "The user does not exist!");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		hs.setAttribute("user", current);
		
		String passwd = current.getPassword();
		if(passwd.equals(request.getParameter("password"))){
			System.out.println(current.getEmail());
			if(current.getEmail().equals("")){
				
				request.getRequestDispatcher("register.jsp").forward(request, response);
				return;
			}
			System.out.println(current.getName());
			request.getRequestDispatcher("teacher.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
}
