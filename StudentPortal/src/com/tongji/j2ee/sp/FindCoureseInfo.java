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

		{
			int Time=MyCourses.getSchedule0();
			String OutString;
			int TempNumber=Time%5+1;
			int TempNumber1=Time/5+1;
			
			if (TempNumber1>=7)
			{
				TempNumber1=TempNumber1-7;
			}
			if (Time<=35)
			{
				OutString=String.format("单周周%d第%d第%d节课",TempNumber1,TempNumber,TempNumber+1);
			}
			else
			{
				OutString=String.format("双周周%d第%d第%d节课",TempNumber1,TempNumber,TempNumber+1);
			}
			System.out.println(OutString);
			hs.setAttribute("CourseSchedule0",OutString);
		}
		
		{
			int Time=MyCourses.getSchedule1();
			String OutString;
			int TempNumber=Time%5+1;
			int TempNumber1=Time/5+1;
			
			if (TempNumber1>=7)
			{
				TempNumber1=TempNumber1-7;
			}
			if (Time<=35)
			{
				OutString=String.format("单周周%d第%d第%d节课",TempNumber1,TempNumber,TempNumber+1);
			}
			else
			{
				OutString=String.format("双周周%d第%d第%d节课课",TempNumber1,TempNumber,TempNumber+1);
			}
			hs.setAttribute("CourseSchedule1",OutString);
		}
		
		{
			int Time=MyCourses.getSchedule2();
			String OutString;
			int TempNumber=Time%5+1;
			int TempNumber1=Time/5+1;
			
			if (TempNumber1>=7)
			{
				TempNumber1=TempNumber1-7;
			}
			if (Time<=35)
			{
				OutString=String.format("单周周%d第%d第%d节课",TempNumber1,TempNumber,TempNumber+1);
			}
			else
			{
				OutString=String.format("双周周%d第%d第%d节课",TempNumber1,TempNumber,TempNumber+1);
			}
			hs.setAttribute("CourseSchedule2",OutString);
		}
		
		{
			int Time=MyCourses.getSchedule3();
			String OutString;
			int TempNumber=Time%5+1;
			int TempNumber1=Time/5+1;
			
			if (TempNumber1>=7)
			{
				TempNumber1=TempNumber1-7;
			}
			if (Time<=35)
			{
				OutString=String.format("单周周%d第%d第%d节课",TempNumber1,TempNumber,TempNumber+1);
			}
			else
			{
				OutString=String.format("双周周%d第%d第%d节课",TempNumber1,TempNumber,TempNumber+1);
			}
			hs.setAttribute("CourseSchedule3",OutString);
		}

		hs.setAttribute("CourseID", ID);
		hs.setAttribute("CourseName", MyCourses.getName());
		String TempStringInt;
		TempStringInt=String.format("%d",MyCourses.getCredit());
		hs.setAttribute("CourseCredit", TempStringInt);
		hs.setAttribute("CourseTeacherName", MyCourses.getTName());
		hs.setAttribute("CourseTeacherID", MyCourses.getTId());
		//hs.setAttribute("CourseClass", MyCourses.getClass());
		hs.setAttribute("CoursePlace", MyCourses.getPlace());
		
		String TempStringInt1;
		TempStringInt1=String.format("%d",MyCourses.getMaxstudent());
		hs.setAttribute("CourseMaxStudent", TempStringInt1);


	
		
	
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
