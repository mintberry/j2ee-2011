package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Teacherinfo;
import model.TeacherinfoDAO;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class FindTeacherInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FindTeacherInfo() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

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

		System.out.println("FindPerson!!!!!!!!!!!!!!!!!");

		String ID=request.getParameter("XiaZaiWenJian");
		System.out.println(ID);



		//DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String datetime = formatter.format(new java.util.Date());

		TeacherinfoDAO MyStudentDAO=new TeacherinfoDAO();
		Teacherinfo MyStudentInfo;

		MyStudentInfo=MyStudentDAO.findById(ID);
		HttpSession hs = request.getSession();
		hs.setAttribute("TeacherID", ID);
		hs.setAttribute("TeacherName", MyStudentInfo.getName());
		hs.setAttribute("TeacherTitle", MyStudentInfo.getSex());
		hs.setAttribute("TeacherBirthday", MyStudentInfo.getBirthday());
		hs.setAttribute("TeacherNation", MyStudentInfo.getNation());
		hs.setAttribute("TeacherAddress", MyStudentInfo.getAddress());
		hs.setAttribute("TeacherEmail", MyStudentInfo.getEmail());
		hs.setAttribute("TeacherPhone", MyStudentInfo.getPhoneNumber());
		Session s = (Session) HibernateSessionFactory.getSession();
		MyStudentDAO.save(MyStudentInfo);	
			try {
				Transaction ts = s.beginTransaction();
				ts.commit();
		} catch (Exception e) {

		} finally {
				s.close();

				request.setAttribute("pageNumber", 1);
				
				request.setAttribute("Jump", 2);
				
				
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}

		//NotifyDAO notifyDAO = new NotifyDAO();
		//Notify newNote = new Notify();

		//System.out.println(content);

		//newNote.setTitle(title);
		//newNote.setContent(content);
		//newNote.setAuthor(author);
		//newNote.setDatetime(tsig);


		//have to set id



		//notifyDAO.save(newNote);
//			notifyDAO.attachDirty(newNote);
//			try {
//				Transaction ts = s.beginTransaction();
//				ts.commit();
		//} catch (Exception e) {

		//} finally {
//			s.close();
//			request.getRequestDispatcher("admin.jsp").forward(request, response);
		//}

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
