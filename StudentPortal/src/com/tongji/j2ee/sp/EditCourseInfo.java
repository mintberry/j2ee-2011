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
		else if (Way.equalsIgnoreCase("edit"))
		{
			String CourseID=request.getParameter("id");
			String CourseName=request.getParameter("name");

			String teacherID = request.getParameter("teacherID");
			//String Birthday = request.getParameter("birthday");
			String teacherName = request.getParameter("teacherName");
			String Time1 = request.getParameter("Time1");
			String Time2 = request.getParameter("Time2");
			String Time3 = request.getParameter("Time3");
			String Time4 = request.getParameter("Time4");
			String Credit = request.getParameter("Credit");
			String MaxStudent = request.getParameter("MaxStudent");
			String CoursePlace=request.getParameter("CoursePlace");
			
			
			Courses TempCourse;
			CoursesDAO TempDAO=new CoursesDAO();
			TempCourse=TempDAO.findById(CourseID);
			TempCourse.setName(CourseName);
			TempCourse.setTId(teacherID);
			TempCourse.setPlace(CoursePlace);
			TempCourse.setTName(teacherName);
			int i=Integer.parseInt(MaxStudent);
			TempCourse.setMaxstudent(i);
			i=Integer.parseInt(Credit);
			TempCourse.setCredit(i);
			
			int ShangkeTime=0;
			int TempInt;
			int TempInt1;
			char TempChar;
			if (!Time1.equalsIgnoreCase("null"))
			{
			TempChar=Time1.charAt(0);
			if (TempChar=='双')
			{
				ShangkeTime=35;
			}
			
			TempChar=Time1.charAt(3);
			 TempInt=TempChar-'1';
			TempChar=Time1.charAt(5);
			TempInt1=(TempChar-'1')/2+1;
			
			ShangkeTime=ShangkeTime+5*TempInt+TempInt1;
			TempCourse.setSchedule0(ShangkeTime);
			ShangkeTime=0;
			}
			if (!Time2.equalsIgnoreCase("null"))
			{
			TempChar=Time2.charAt(0);
			
			if (TempChar=='双')
			{
				ShangkeTime=35;
			}
			
			TempChar=Time2.charAt(3);
			 TempInt=TempChar-'1';
			TempChar=Time2.charAt(5);
			TempInt1=(TempChar-'1')/2+1;
			
			ShangkeTime=ShangkeTime+5*TempInt+TempInt1;
			TempCourse.setSchedule1(ShangkeTime);
			ShangkeTime=0;
			}
			if (!Time3.equalsIgnoreCase("null"))
			{
			TempChar=Time3.charAt(0);
			
			if (TempChar=='双')
			{
				ShangkeTime=35;
			}
			
			TempChar=Time3.charAt(3);
 TempInt=TempChar-'1';
			TempChar=Time3.charAt(5);
			TempInt1=(TempChar-'1')/2+1;
			
			ShangkeTime=ShangkeTime+5*TempInt+TempInt1;
			TempCourse.setSchedule2(ShangkeTime);
			ShangkeTime=0;
			}
			
			if (!Time4.equalsIgnoreCase("null"))
			{
			TempChar=Time4.charAt(0);
			
			
			if (TempChar=='双')
			{
				ShangkeTime=35;
			}
			
			TempChar=Time4.charAt(3);
			 TempInt=TempChar-'1';
			TempChar=Time4.charAt(5);
			TempInt1=(TempChar-'1')/2+1;
			
			ShangkeTime=ShangkeTime+5*TempInt+TempInt1;
			TempCourse.setSchedule3(ShangkeTime);
			ShangkeTime=0;
	
			}

			TempDAO.save(TempCourse);
		}
		else if (Way.equalsIgnoreCase("add"))
		{
			
			String CourseID=request.getParameter("id");
			String CourseName=request.getParameter("name");

			String teacherID = request.getParameter("teacherID");
			//String Birthday = request.getParameter("birthday");
			String teacherName = request.getParameter("teacherName");
			String Time1 = request.getParameter("Time1");
			String Time2 = request.getParameter("Time2");
			String Time3 = request.getParameter("Time3");
			String Time4 = request.getParameter("Time4");
			String Credit = request.getParameter("Credit");
			String MaxStudent = request.getParameter("MaxStudent");
			String CoursePlace=request.getParameter("CoursePlace");
			
			
			Courses TempCourse=new Courses();

			
			TempCourse.setCourseId(CourseID);
			TempCourse.setName(CourseName);
			TempCourse.setTId(teacherID);
			TempCourse.setPlace(CoursePlace);
			TempCourse.setTName(teacherName);
			int i=Integer.parseInt(MaxStudent);
			TempCourse.setMaxstudent(i);
			i=Integer.parseInt(Credit);
			TempCourse.setCredit(i);
			
			int ShangkeTime=0;
			int TempInt;
			int TempInt1;
			char TempChar;
			if (!Time1.equalsIgnoreCase("null"))
			{
			TempChar=Time1.charAt(0);
			if (TempChar=='双')
			{
				ShangkeTime=35;
			}
			
			TempChar=Time1.charAt(3);
			 TempInt=TempChar-'1';
			TempChar=Time1.charAt(5);
			TempInt1=(TempChar-'1')/2+1;
			
			ShangkeTime=ShangkeTime+5*TempInt+TempInt1;
			TempCourse.setSchedule0(ShangkeTime);
			ShangkeTime=0;
			}
			if (!Time2.equalsIgnoreCase("null"))
			{
			TempChar=Time2.charAt(0);
			
			if (TempChar=='双')
			{
				ShangkeTime=35;
			}
			
			TempChar=Time2.charAt(3);
			 TempInt=TempChar-'1';
			TempChar=Time2.charAt(5);
			TempInt1=(TempChar-'1')/2+1;
			
			ShangkeTime=ShangkeTime+5*TempInt+TempInt1;
			TempCourse.setSchedule1(ShangkeTime);
			ShangkeTime=0;
			}
			if (!Time3.equalsIgnoreCase("null"))
			{
			TempChar=Time3.charAt(0);
			
			if (TempChar=='双')
			{
				ShangkeTime=35;
			}
			
			TempChar=Time3.charAt(3);
 TempInt=TempChar-'1';
			TempChar=Time3.charAt(5);
			TempInt1=(TempChar-'1')/2+1;
			
			ShangkeTime=ShangkeTime+5*TempInt+TempInt1;
			TempCourse.setSchedule2(ShangkeTime);
			ShangkeTime=0;
			}
			
			if (!Time4.equalsIgnoreCase("null"))
			{
			TempChar=Time4.charAt(0);
			
			
			if (TempChar=='双')
			{
				ShangkeTime=35;
			}
			
			TempChar=Time4.charAt(3);
			 TempInt=TempChar-'1';
			TempChar=Time4.charAt(5);
			TempInt1=(TempChar-'1')/2+1;
			
			ShangkeTime=ShangkeTime+5*TempInt+TempInt1;
			TempCourse.setSchedule3(ShangkeTime);
			ShangkeTime=0;
	
			}
			CoursesDAO TempDAO=new CoursesDAO();
			TempDAO.save(TempCourse);			
		}
		else if (Way.equalsIgnoreCase("delete"))
		{
			
			Courses TempCourse=new Courses();
			CoursesDAO MyCoursesDAO=new CoursesDAO();
			String CourseID=request.getParameter("id");
			TempCourse=MyCoursesDAO.findById(CourseID);
			
			MyCoursesDAO.delete(TempCourse);
		
			
			
			List<StudentCourse> StudentCourseList=MyStudentCourseDAO.findByCourseId(CourseID);
			for (int i = 0; i < StudentCourseList.size(); i++) {
				StudentCourse temp = (StudentCourse) StudentCourseList.get(i);
				MyStudentCourseDAO.delete(temp);
			}
			
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

		
			try {
				Transaction ts = s.beginTransaction();
				ts.commit();
	} catch (Exception e) {

		} finally {
				s.close();
				List<StudentCourse> StudentList = MyStudentCourseDAO.findAll();
				CoursesDAO TempDAO=new CoursesDAO();
				List<Courses> CoursesList = TempDAO.findAll();
				
				request.setAttribute("pageNumber", 1);
				request.setAttribute("Jump", 3);
				HttpSession hs = request.getSession();
	
				hs.setAttribute("MyCourseList", CoursesList);
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
