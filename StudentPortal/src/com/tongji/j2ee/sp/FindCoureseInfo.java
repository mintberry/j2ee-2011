package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Courses;
import model.CoursesDAO;
import model.StudentCourse;
import model.StudentCourseDAO;
import model.Studentinfo;


import org.hibernate.Session;
import org.hibernate.Transaction;

public class FindCoureseInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FindCoureseInfo() {
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

		CoursesDAO MyCoursesDAO=new CoursesDAO();
		Courses MyCourses;

		MyCourses=MyCoursesDAO.findById(ID);
	
		HttpSession hs = request.getSession();
		hs.setAttribute("CourseID", ID);
		hs.setAttribute("CourseName", MyCourses.getName());
		hs.setAttribute("CourseCredit",  MyCourses.getCredit());
		hs.setAttribute("CourseTeacherName", MyCourses.getTName());
		hs.setAttribute("CourseTeacherID", MyCourses.getTId());
		hs.setAttribute("CourseClass", MyCourses.getClass());
		hs.setAttribute("CoursePlace", MyCourses.getPlace());
		hs.setAttribute("CourseMaxStudent", MyCourses.getMaxstudent());
		hs.setAttribute("CourseSchedule0", MyCourses.getSchedule0());
		hs.setAttribute("CourseSchedule1", MyCourses.getSchedule1());
		hs.setAttribute("CourseSchedule2", MyCourses.getSchedule2());
		hs.setAttribute("CourseSchedule3", MyCourses.getSchedule3());
	
		
	
		StudentCourseDAO MyStudentCourseDAO=new StudentCourseDAO();
		
		List<StudentCourse> StudentCourseList =MyStudentCourseDAO.findByCourseId(ID);
		
		hs.setAttribute("CourseStudentList",StudentCourseList);
		Session s = (Session) HibernateSessionFactory.getSession();
		MyCoursesDAO.save(MyCourses);
	
			try {
				Transaction ts = s.beginTransaction();
				ts.commit();
		} catch (Exception e) {

		} finally {
				s.close();

				request.setAttribute("pageNumber", 1);
				
				request.setAttribute("Jump", 3);
				
				
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
