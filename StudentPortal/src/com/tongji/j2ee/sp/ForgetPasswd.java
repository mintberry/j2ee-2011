package com.tongji.j2ee.sp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Studentinfo;
import model.StudentinfoDAO;
import model.Teacherinfo;
import model.TeacherinfoDAO;

public class ForgetPasswd extends HttpServlet {
	private StudentinfoDAO studentinfoDAO = new StudentinfoDAO();
	private Studentinfo studentinfo;
	private TeacherinfoDAO teacherinfoDAO = new TeacherinfoDAO();
	private Teacherinfo teacherinfo;

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("userID");
		if(id.length() == 6){
			studentinfo = studentinfoDAO.findById(id);
			if(studentinfo == null){
				request.setAttribute("errorInformation", "用户名不存在");
				request.getRequestDispatcher("forgetpasswd.jsp").forward(request,
						response);
			    return;	
			}
			String to = studentinfo.getEmail();
			if(to.equals("")){
				request.setAttribute("errorInformation", "邮箱未验证，首次登录，密码为1234");
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
				return;
			}
			String password = studentinfo.getPassword();
			
			String subject = "Get password";
			String content = "id:" + id + "\npassword:" + password;
			SendMailServlet sendMailServlet = new SendMailServlet();
			sendMailServlet.sendMail(to, subject, content);
			request.getRequestDispatcher("findpasswd.html").forward(request, response);
		}else if(id.length() == 10){
			teacherinfo = teacherinfoDAO.findById(id);
			if(id.equals("0000000007") || teacherinfoDAO == null){
				request.setAttribute("errorInformation", "用户名不存在");
				request.getRequestDispatcher("forgetpasswd.jsp").forward(request,
						response);
				return;
			}
			String to = teacherinfo.getEmail();
			if(to.equals("")){
				request.setAttribute("errorInformation", "邮箱未验证，首次登录，密码为1234");
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
				return;
			}
			String password = teacherinfo.getPassword();
			
			String subject = "Get password";
			String content = "id:" + id + "\npassword:" + password;
			SendMailServlet sendMailServlet = new SendMailServlet();
			sendMailServlet.sendMail(to, subject, content);
			request.getRequestDispatcher("findpasswd.html").forward(request, response);
		}
	}

}
