package com.tongji.j2ee.sp;

import hibernate.HibernateSessionFactory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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


import org.hibernate.Session;
import org.hibernate.Transaction;

public class EditCourseInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditCourseInfo() {
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
System.out.println("EditCourse!!!!!!!!!!!!!!!!!");

		
		String Way=request.getParameter("act4");
		System.out.println(Way);
		

//		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String datetime = formatter.format(new java.util.Date());
		
	
		StudentCourseDAO MyStudentCourseDAO=new StudentCourseDAO();
	
		Session s = (Session) HibernateSessionFactory.getSession();
		if (Way.equalsIgnoreCase("delete1"))
		{
			System.out.println("删除学生!");
			String StudentID=request.getParameter("CourseStudentID");
			String CourseID=request.getParameter("id");
	
			
			List<StudentCourse> StudentCourseList=MyStudentCourseDAO.findBySId(StudentID);
			for (int i = 0; i < StudentCourseList.size(); i++) {
				StudentCourse temp = (StudentCourse) StudentCourseList.get(i);
				String CourseID1=(String) temp.getCourseId();
				if (CourseID1.equalsIgnoreCase(CourseID))
				{
					MyStudentCourseDAO.delete(temp);
				}
			}
			
			


	//	Date MyDate=new Date();
		//MyDate.setDate(20);
		//MyDate.setHours(12);
		//MyDate.setYear(1990);
		//MyDate.setMonth(11);

		//MyStudentInfo.setBirthday(MyDate);

		}
		else if (Way.equalsIgnoreCase("add1"))
		{
			String StudentID=request.getParameter("CourseStudentID");
			String CourseID=request.getParameter("id");
			StudentCourse temp =new StudentCourse();
			temp.setCourseId(CourseID);
			temp.setSId(StudentID);
			MyStudentCourseDAO.attachDirty(temp);
		}
		else if (Way.equalsIgnoreCase("delete"))
		{
		
		}
		
			try {
				Transaction ts = s.beginTransaction();
				ts.commit();
	} catch (Exception e) {

		} finally {
				s.close();
				List<StudentCourse> StudentList = MyStudentCourseDAO.findAll();
				
				
				request.setAttribute("pageNumber", 1);
				request.setAttribute("Jump", 3);
				HttpSession hs = request.getSession();
	
			
				hs.setAttribute("CourseStudentList", StudentList);
				
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
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
