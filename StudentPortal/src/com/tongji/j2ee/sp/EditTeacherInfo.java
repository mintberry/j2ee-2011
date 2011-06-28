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

import model.Teacherinfo;
import model.TeacherinfoDAO;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class EditTeacherInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditTeacherInfo() {
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

	System.out.println("EditTeacher!!!!!!!!!!!!!!!!!");

		
		String Way=request.getParameter("act1");
		System.out.println(Way);
		String ID=request.getParameter("id");
		String Name = request.getParameter("name");
		String Sex = request.getParameter("sex");
		//String Birthday = request.getParameter("birthday");
		String Nation = request.getParameter("nation");
		String Mail = request.getParameter("mail");
		String Address = request.getParameter("address");
		String Phone = request.getParameter("phone");

//		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String datetime = formatter.format(new java.util.Date());
		
	
		TeacherinfoDAO MyTeacherDAO=new TeacherinfoDAO();
		Teacherinfo MyTeacherInfo;
	
		Session s = (Session) HibernateSessionFactory.getSession();
		if (Way.equalsIgnoreCase("edit"))
		{
			System.out.println("编辑!");
			MyTeacherInfo=MyTeacherDAO.findById(ID);
			MyTeacherInfo.setName(Name);
			MyTeacherInfo.setSex(Sex);
			MyTeacherInfo.setNation(Nation);
			MyTeacherInfo.setEmail(Mail);
			MyTeacherInfo.setAddress(Address);
	//	Date MyDate=new Date();
		//MyDate.setDate(20);
		//MyDate.setHours(12);
		//MyDate.setYear(1990);
		//MyDate.setMonth(11);

		//MyStudentInfo.setBirthday(MyDate);
			MyTeacherInfo.setPhoneNumber(Phone);
		System.out.println(Name);
		System.out.println(Sex);
		
		MyTeacherDAO.save(MyTeacherInfo);	
		}
		else if (Way.equalsIgnoreCase("add"))
		{
			System.out.println("添加!");
			MyTeacherInfo=new Teacherinfo();
			MyTeacherInfo.setTId(ID);
			MyTeacherInfo.setPassword("1234");
			MyTeacherInfo.setPinCode("1234");
			MyTeacherInfo.setTitle("讲师");
			MyTeacherInfo.setName(Name);
			MyTeacherInfo.setSex(Sex);
			MyTeacherInfo.setNation(Nation);
			MyTeacherInfo.setEmail(Mail);
			MyTeacherInfo.setAddress(Address);
			Date MyDate=new Date();
			MyDate.setDate(20);
			MyDate.setHours(12);
			MyDate.setYear(1990);
			MyDate.setMonth(11);

			MyTeacherInfo.setBirthday(MyDate);
			MyTeacherInfo.setPhoneNumber(Phone);
			System.out.println(Name);
			System.out.println(Sex);
			
			MyTeacherDAO.save(MyTeacherInfo);	
		}
		else if (Way.equalsIgnoreCase("delete"))
		{
			MyTeacherInfo=MyTeacherDAO.findById(ID);
			MyTeacherDAO.delete(MyTeacherInfo);
		}
		
			try {
				Transaction ts = s.beginTransaction();
				ts.commit();
	} catch (Exception e) {

		} finally {
				s.close();
				List<Teacherinfo> StudentList = MyTeacherDAO.findAll();
				
				
				request.setAttribute("pageNumber", 1);
				request.setAttribute("Jump", 2);
				HttpSession hs = request.getSession();
	
			
				hs.setAttribute("MyTeacherList", StudentList);
				
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
