package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Studentinfo;
import model.StudentinfoDAO;
import model.Teacherinfo;
import model.TeacherinfoDAO;

public class ModifyServlet extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */

	private StudentinfoDAO studentinfoDAO = new StudentinfoDAO();
	private Studentinfo studentinfo;
	private TeacherinfoDAO teacherinfoDAO = new TeacherinfoDAO();
	private Teacherinfo teacherinfo;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Session s = (Session) HibernateSessionFactory.getSession();
		HttpSession hs = request.getSession();

		String mail = request.getParameter("email");
		String passwd = request.getParameter("email1");

		Object inf = hs.getAttribute("user");
		if (inf instanceof Studentinfo) {//学生
			studentinfo = (Studentinfo) inf;

			if (!passwd.equals("")) { // 密码不为空
                studentinfo.setPassword(passwd);
                studentinfoDAO.save(studentinfo);
                try {
    				Transaction ts = s.beginTransaction();
    				ts.commit();
    			} catch (Exception e) {

    			} finally {
    				s.close();  				
    				
    			}
			}

			if (!mail.equals("")) { // 邮箱不为空
				//String to = request.getParameter("email1");
				String subject = "Email address validation";
				String content = "http://localhost:8080/StudentPortal/RegMailServlet"
						+ "?id="
						+ studentinfo.getSId()
						+ "&password="
						+ studentinfo.getPassword() + "&email=" + mail;
				SendMailServlet sendMailServlet = new SendMailServlet();
				sendMailServlet.sendMail(mail, subject, content);
				hs.removeAttribute("user");
				hs.removeAttribute("noteli");
				hs.invalidate();
				request.getRequestDispatcher("EmailSuccess.html").forward(
						request, response);
				return;
			}
			
			hs.removeAttribute("user");
			hs.removeAttribute("noteli");
			hs.invalidate();
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
			
		} else if (inf instanceof Teacherinfo) {//老师
			teacherinfo = (Teacherinfo) inf;
			if (!passwd.equals("")) { // 密码不为空
                teacherinfo.setPassword(passwd);
                teacherinfoDAO.save(teacherinfo);
                try {
    				Transaction ts = s.beginTransaction();
    				ts.commit();
    			} catch (Exception e) {

    			} finally {
    				s.close();  				
    				
    			}
			}

			if (!mail.equals("")) { // 邮箱不为空
				//String to = request.getParameter("email1");
				String subject = "Email address validation";
				String content = "http://localhost:8080/StudentPortal/RegMailServlet"
						+ "?id="
						+ teacherinfo.getTId()
						+ "&password="
						+ teacherinfo.getPassword() + "&email=" + mail;
				SendMailServlet sendMailServlet = new SendMailServlet();
				sendMailServlet.sendMail(mail, subject, content);
				hs.removeAttribute("user");
				hs.removeAttribute("noteli");
				hs.invalidate();
				request.getRequestDispatcher("EmailSuccess.html").forward(
						request, response);
				return;
			}
			
			hs.removeAttribute("user");
			hs.removeAttribute("noteli");
			hs.invalidate();
			request.getRequestDispatcher("index.jsp").forward(request, response);			
		}

	}

}
